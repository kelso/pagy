# frozen_string_literal: true

class Test < Thor
  class E2e < Test
    desc 'apps [APP]', 'Test all E2E apps (or just APP)'
    def apps(app = nil)
      files = if app
                puts "\nTesting E2E #{app} app..."
                "test/e2e/#{app}_test.rb"
              else
                puts "\nTesting E2E apps..."
                'test/e2e/**/*_test.rb'
              end
      run_tests(Dir.glob(files))
    end

    desc 'update_assets', 'Update assets for E2E apps'
    def update_assets
      require 'open-uri'

      assets_path = Pagy::ROOT.join('../test/e2e/assets')
      puts "Asset directory: #{assets_path}"
      mkdir_p(assets_path)

      assets = {
        'tailwind.js'       => 'https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio',
        'bootstrap.min.css' => 'https://cdn.jsdelivr.net/npm/bootstrap@5/dist/css/bootstrap.min.css',
        'bulma.min.css'     => 'https://cdn.jsdelivr.net/npm/bulma@1/css/bulma.min.css'
      }

      assets.each do |filename, url|
        puts "Downloading #{filename}..."
        # Open-URI's 'open' can be called directly on the string... not a security concern in this context
        content = URI.open(url).read # rubocop:disable Security/Open
        File.write("#{assets_path}/#{filename}", content)
      end
    end
  end
end
