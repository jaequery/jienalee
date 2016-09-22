#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
parentdir="$(dirname "$dir")"
app=${parentdir##*/}
dest=$1
dest="jae@x.hakberry.com"
rsync --exclude="volumes" --exclude=".git" -avzr $parentdir $dest:~/sites/ && ssh $dest "cd ~/sites/$app && docker-compose kill && docker-compose build && docker-compose -f docker-compose.yml up && docker-compose logs"

