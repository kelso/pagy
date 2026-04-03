`slots: 9`
: Override the default number of page `:slots` used for the navigation bar.
- `slots < 7` causes the slots to be filled by contiguous pages around the current one
- `slots >= 7` causes the first and last slots to be occupied by first and last pages, separated by the rest with a `...` (`:gap`) slot when needed.
- Prefer odd numbers of slots, which determine the current page to be in the central slot.

`compact: true`
: Fill all the slots with contiguous pages, regardless the number of slots.
