#!/bin/bash

# for all playlists
indir=1D_v1_p4
basedir=/minerva/app/users/${USER}/MAT_GitHub

for playlist in minervame6D #minervame6H2
#for playlist in minervame5A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6I minervame6H minervame6J
#for playlist in minervame6A
do 
    echo ${playlist}
    # 99 99 Daisy
    echo ============== 5 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/efficiencyt5z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 5 26 ${playlist}"

    #cd /pnfs/minerva/persistent/users/anezkak/1D/
    #rm ${playlist}/*/myarea*
    cd /minerva/app/users/anezkak/MAT_GitHub/
    rm eventLoop_${playlist}_wrapper_tag_default_*.sh
    cd /minerva/app/users/anezkak/MAT_GitHub/

done









