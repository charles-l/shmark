# shmark

Super minimal shell bookmarking.

# rc file

This branch supports `~/.shmarkrc`. Set the create mark alias in the rc file with `create_mark='create_mark_alias'` and `goto_mark='goto_mark_alias'`.

`create_mark_alias [bookmark]`: will create a bookmark with name "[bookmark]"

`goto_mark_alias [bookmark]`: will cd to directory bookmark (if "[bookmark]" is defined).

`savemarks`: will write the marks to `$HOME/.shmarks`. When you source `shmark.sh`, it'll load global marks from `$HOME/.shmarks`.

