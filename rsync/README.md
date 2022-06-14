### reference: 
https://docs.rockylinux.org/zh/guides/automation/cron_jobs_howto/
### init install
```
dnf install rsync
```
### use
#### 1
```
cp backup.sh /etc/cron.daily/backup.sh
```
#### 2
```
chmod +x /etc/cron.daily/backup.sh
```
#### 3
```
crontab -e
```
#### 4 add below
```
0 */1 * * * /etc/cron.daily/backup.sh
```