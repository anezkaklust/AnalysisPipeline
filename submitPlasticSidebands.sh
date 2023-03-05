#!/bin/bash

# for all playlists
indir=$1
basedir=/minerva/app/users/${USER}/MAT_GitHub
for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
#for playlist in minervame5A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6I minervame6H minervame6J
#for playlist in minervame5A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6I minervame6J
#for playlist in minervame6A
do 
    echo ${playlist}
    # Event loop
    # 2 26
    echo ============== 2 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict2z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 2 26 ${playlist}"
    # 2 82
    echo ============== 2 82 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict2z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 2 82 ${playlist}"
    # 3 6
    echo ============== 3 6 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict3z06/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 3 6 ${playlist}"
    # 3 26
    echo ============== 3 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict3z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 3 26 ${playlist}"
    # 3 82
    echo ============== 3 82  =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict3z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 3 82 ${playlist}"
    # 4 82
    echo ============== 4 82 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict4z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 4 82 ${playlist}"
    # 5 26
    echo ============== 5 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict5z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 5 26 ${playlist}"
    # 5 82
    echo ============== 5 82 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/${playlist}/plastict5z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEventLoop_plasticSB . 5 82 ${playlist}"

    #cd /pnfs/minerva/persistent/users/anezkak/1D
    #rm ${playlist}/*/myarea*
    cd /minerva/app/users/anezkak/MAT_GitHub/
    rm eventLoop_${playlist}_wrapper_tag_default_*.sh
    cd /minerva/app/users/anezkak/MAT_GitHub/

done