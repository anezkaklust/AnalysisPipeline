#!/bin/bash

# for all playlists
indir=2D_v1-nonrespi 
basedir=/minerva/app/users/${USER}/MAT_GitHub

for playlist in minervame5A
#for playlist in minervame5A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6I minervame6H minervame6J
#for playlist in minervame6A
do 
    echo ${playlist}
    # Event loop
    # 4 82
    echo ============== 4 82 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial2D.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/migrationt4z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runMigration2D . 4 82 ${playlist}"


    #cd /pnfs/minerva/persistent/users/anezkak/1D/
    #rm ${playlist}/*/myarea*
    cd /minerva/app/users/anezkak/MAT_GitHub/
    rm eventLoop_${playlist}_wrapper_tag_default_*.sh
    cd /minerva/app/users/anezkak/MAT_GitHub/


done









