# Ruby Test Environment

Ruby is tested with [`minitest`](https://github.com/minitest/minitest) through `thor`. It also uses [`holdify`](https://github.com/ddnexus/holdify) as a snapshot system.

## Prerequisite

- Install the gems: `bundle install`
- E2E tests use your local Chrome

No other setup required.

## Testing

```
❯ bundle exec thor list
test
----
thor test:all                # Test Rubocop + API + Coverage + E2E
thor test:api:all            # Test current and next API
thor test:api:coverage       # Test API coverage
thor test:api:current        # Test current API
thor test:api:next           # Test next API
thor test:e2e:apps [APP]     # Test all E2E apps (or just APP)
```

## Run all checks

To get green light for PRs, just run them all in ~10secs...

`bundle exec thor test:all`
