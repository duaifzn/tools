#!/bin/bash
scp -i {path}/.ssh/config/{id} -r {path}/docker/mongo {user}@{server}:{path}/mongo-backup-$(date +%Y-%m-%d)
