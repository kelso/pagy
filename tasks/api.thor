# frozen_string_literal: true

require 'json'

class Test < Thor
  class Api < Test
    desc 'current', 'Test current API'
    def current
      puts "\nTesting current API..."
      files = Dir.glob('test/unit/**/*_test.rb').reject { _1.include?('next_test.rb') }
      run_tests(files)
    end

    desc 'next', 'Test next API'
    def next
      puts "\nTesting next API..."
      run_tests(['test/unit/pagy/next_test.rb'], 'PAGY_NEXT' => 'true')  # Isolated process
    end

    desc 'all', 'Test current and next API'
    def all
      invoke 'current'
      invoke 'next'
    end

    desc 'coverage', 'Test API coverage'
    def coverage
      ENV['COVERAGE'] = 'true' # for all tasks
      invoke 'all'
      path   = Pathname.new(`git rev-parse --show-toplevel`.chomp).join('coverage')
      result = JSON.parse(path.join('.last_run.json').read)['result']
      line, branch = result.values_at('line', 'branch')

      return if [line, branch].all?(100)  # next ends the task here

      miss_pct = -> { format('%7.2f%%', -100 + _1) }
      warn <<~MISS

        >>> MISSING COVERAGE!
        #{">>> LINE:   #{miss_pct.(line)}" if line < 100}
        #{">>> BRANCH: #{miss_pct.(branch)}" if branch < 100}
        >>> Report: file://#{path.join('index.html')}
      MISS
      exit 2
    end
  end
end
