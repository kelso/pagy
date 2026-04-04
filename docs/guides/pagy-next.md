---
label: Use Pagy NEXT
order: 60
icon: zap
nav:
  badge:
    text: "≈ 44"
    variant: info
---

#

## :icon-zap:&nbsp;&nbsp;Pagy NEXT

---

!!!tip You can use the NEXT version NOW!

Just edit the Gemfile...

```diff Gemfile (diff)
- gem 'pagy', '~> 43.4'                         # MINOR version restriction
+ gem 'pagy', '~> 43.4.4', require: 'pagy/next' # PATCH version restriction + pagy/next entry point
```

As an alternative _(without Gemfile changes)_, ensure the environment variable `PAGY_NEXT=true` is set, BEFORE `pagy` is required.

```rb IRB
$ PAGY_NEXT=true irb
>> require 'pagy'
=> true
>> Pagy::VERSION
=> "43.4.4.next"
```
!!!

### How does it work?

Pagy NEXT is the code that will be released as the next MAJOR version. It is already implemented in the current version in its most efficient and elegant form, i.e. without any deprecation warning nor branching. However, respecting the [SemVer](https://semver.org/) contract _(with regular releases)_, we override it with a compatibility layer that avoids any unexpected breaking change and provides warnings to educate the users.

For developers seeking maximum performance and modern patterns today, pagy NEXT provides an opt-in mechanism to bypass the legacy layer entirely. By using `require: 'pagy/next'` or setting `PAGY_NEXT=true`, you effectively run the next MAJOR version's logic now.

### How should you maintain it?

This "early access" mode is lighter and faster, but **requires immediate adherence to the latest API changes**.

!!!warning Adjust the gem update policy!

- Use a stricter PATCH version restriction (e.g., replace `~> 43.4` with `~> 43.4.4`) **(recommended)**
- Follow the [Deprecations Instructions](/changelog/#deprecations) after `bundle update` involving MINOR or MAJOR releases.

!!!

With the PATCH version restriction, bundle will automatically update **only** PATCH releases, ensuring your NEXT code won't break on update. However, remember to manually check `bundle outdated` more often to avoid missing MINOR or MAJOR releases.
