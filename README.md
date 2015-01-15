# shmark

Super minimal shell bookmarking.

`m [bookmark]`: will create a bookmark with name "[bookmark]"

`g [bookmark]`: will cd to directory bookmark (if "[bookmark]" is defined).

`savemarks`: will write the marks to `$HOME/.shmarks`. When you source `shmark.sh`, it'll load global marks from `$HOME/.shmarks`.
