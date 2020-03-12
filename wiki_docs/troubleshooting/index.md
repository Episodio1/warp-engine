# troubleshooting

## command **start**

`warp start`

```bash
ERROR: for test_php_1  Cannot start service php: OCI runtime create failed: container_linux.go:346: 
starting container process caused "process_linux.go:449: container init caused \"rootfs_linux.go:58: mounting \\\"/Users/matias/Desktop/test/.warp/docker/config/php/ext-ioncube.ini\\\" to rootfs \\\"/var/lib/docker/overlay2/4f3d14d1f3d7755705914496fd518389d2510081d6d1f0e1e41155da236c638b/merged\\\" at \\\"/var/lib/docker/overlay2/4f3d14d1f3d7755705914496fd518389d2510081d6d1f0e1e41155da236c638b/merged/usr/local/etc/php/conf.d/10-php-ext-ioncube.ini\\\" caused \\\"not a directory\\\"\"": 
unknown: Are you trying to mount a directory onto a file (or vice-versa)? Check if the specified host path exists and is the expected type

ERROR: for php  Cannot start service php: OCI runtime create failed: container_linux.go:346: starting container process caused "process_linux.go:449: container init caused \"rootfs_linux.go:58: mounting \\\"/Users/matias/Desktop/test/.warp/docker/config/php/ext-ioncube.ini\\\" to rootfs \\\"/var/lib/docker/overlay2/4f3d14d1f3d7755705914496fd518389d2510081d6d1f0e1e41155da236c638b/merged\\\" at \\\"/var/lib/docker/overlay2/4f3d14d1f3d7755705914496fd518389d2510081d6d1f0e1e41155da236c638b/merged/usr/local/etc/php/conf.d/10-php-ext-ioncube.ini\\\" caused \\\"not a directory\\\"\"": 
unknown: Are you trying to mount a directory onto a file (or vice-versa)? Check if the specified host path exists and is the expected type
ERROR: Encountered errors while bringing up the project.
ERROR: No container found for php_1
Error response from daemon: mount /Users/matias/Desktop/test/.warp/docker/config/php/ext-ioncube.ini:/var/lib/docker/overlay2/4f3d14d1f3d7755705914496fd518389d2510081d6d1f0e1e41155da236c638b/merged/usr/local/etc/php/conf.d/10-php-ext-ioncube.ini, flags: 0x5000: not a directory
ERROR: No container found for php_1
```

### possible solutions
- check mounted files `docker-compose-warp.yml`
- Are you trying to mount a directory onto a file (or vice-versa)

-------------

## Private DB Registry

```bash
ERROR: pull access denied for 123456789.dkr.ecr.us-east-1.amazonaws.com/sample-site-dbs, 
repository does not exist or may require‘docker login’: denied: Your Authorization Token has expired. 
Please run ‘aws ecr get-login --no-include-email’ to fetch a new one.
```

### possible solutions
- login to aws by console

-------------

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