# zenchrome.vim

A minimal Vim colorscheme for the terminal that clears implicit colors.

## Screenshots

Note as this colorscheme only utilizes terminal colors this may, and indeed
likely will, differ from the result in your terminal.

## Design

Vim sets a number of highlight groups by default. As such when creating
a colorscheme for Vim you never actually start from a blank slate.

To remove these defaults you would perform something like the following.

```vim
highlight {group-name} NONE
```

Note this needs to be done for each highlight group. There is no built in
mechanism to remove highlights for all groups.

Furthermore highlight groups that set colors can be added at runtime from
syntax files. Also when setting the `background` (even to its existing value)
default highlight groups can get re-added. As such manually clearing or
overriding Vim's default highlight groups at startup isn't sufficient if you
want a minimal colorscheme and/or total control over highlights.

## Customising

You can provide your own theme be defining a function called
`ColorScheme` that returns a dictionary, take a look at the default in
`autoload/zenchrome/default.vim` for an example. The reason a function
is expected rather than a variable is to allow for dynamic content,
namely varying depending upon the value of `&background`.

## Implementation

Whilst the resulting colorscheme is minimal the implementation is not.

The irony of this is not lost on the author.
