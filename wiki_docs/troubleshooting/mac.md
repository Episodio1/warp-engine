# macOS

## command **rsync**

`warp rsync push --all`

```bash
rsync: --chown=501:33: unknown option
rsync error: syntax or usage error (code 1) at /BuildRoot/Library/Caches/com.apple.xbs/Sources/rsync/rsync-52.200.1/rsync/main.c(1337) [client=2.6.9]
Completed copying all files from host to container
```

### possible solutions
- update rsync 
- minimum required version 3.1.1

-------------