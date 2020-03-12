### each command has a `--help` option.

example:

`warp mysql --help`

```bash
Usage:
 warp mysql command [options] [arguments]


Options:

 -h, --help         display this help message

Available commands:
 info               display info available
 dump               allows to make a database dump
 connect            connect to mysql command line (shell)
 import             allows to restore a database
 ssh                connect to mysql by ssh

Help:
 warp mysql dump --help
```

and each sub-command has a `--help` option.

example:

`warp mysql dump --help`

```bash
Usage:
 warp mysql dump [db_name] > [file]


Help:
 Create a backup of a database and save it local machine
 to remove all the security definers of a mysql dump, add this to the command: sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/'

Example:
 warp mysql dump warp_db | gzip > /path/to/save/backup/warp_db.sql.gz
 warp mysql dump warp_db | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' | gzip > /path/to/save/backup/warp_db.sql.gz
 warp mysql dump warp_db | gzip | pv > /path/to/save/backup/warp_db.sql.gz
 warp mysql dump warp_db > /path/to/save/backup/warp_db.sql
```