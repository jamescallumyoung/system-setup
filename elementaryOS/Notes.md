# .list files

A .list is a simple .txt file that should include a list of things.

Each entry in the list should be on it's own line and lines with
spaces in should be wrapped in quotes.

```
this-is-one-entry
'this is another entry'
this entry is bad
```

.line files also support comments. A line that starts with a #
(leading spaces are ignore) is considered a comment.

Blank lines and comments will be ingored by the get-lines.sh
utility that is used to read .lines files.

.line files are commonly used to pass a list of args to xargs.
