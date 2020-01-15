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

.line files are commonly used to pass a list of args to xargs.

## Usage in this program

We use .list files where a list of like- items should be kept,
like a list of packages to install.

## Reading .list files

.list files can be read by the readlist command (available in
./scripts). This outputs each entry on it's own line.

The output of readlist can be piped directly to xargs as:
```readlist $FOO | xargs -n 1```

Any comments will be ignored by readlist.
