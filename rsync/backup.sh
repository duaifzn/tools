#!/bin/bash
function mongo_backup(){
    sudo rsync -a --delete --quiet -e ssh iii.eth8:/home/azureuser/projects/web3-server/server/docker/mongo/db ./mongo_backup
}

function mongo_restore(){
    sudo rsync -a --delete --quiet -e ssh ./mongo_backup/db/* iii.eth8:/home/azureuser/projects/web3-server/server/docker/mongo/db 
}

mongo_backup
