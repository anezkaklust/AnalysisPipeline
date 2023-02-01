#!/bin/bash

# for all playlists
basedir=/minerva/app/users/${USER}/MAT_GitHub
#for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
for playlist in minervame6A
do 
    echo ${playlist}
    # Event loop
    # 3 26
    echo ============== 3 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${playlist}/eventloopt3z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop . 3 26 ${playlist}"

done