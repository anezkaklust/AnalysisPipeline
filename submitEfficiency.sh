#!/bin/bash

# for all playlists
basedir=/minerva/app/users/${USER}/MAT_GitHub
#for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
#or playlist in minervame6A
for playlist in minervame5A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6I minervame6J
do 
    echo ${playlist}
    # Efficiency
    # 2 26
    echo ============== 2 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt2z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 2 26 ${playlist}"
    # 2 82
    echo ============== 2 82 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt2z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 2 82 ${playlist}"
    # 3 6
    echo ============== 3 6 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt3z06/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 3 6 ${playlist}"
    # 3 26
    echo ============== 3 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt3z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 3 26 ${playlist}"
    # 3 82
    echo ============== 3 82  =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt3z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 3 82 ${playlist}"
    # 4 82
    echo ============== 4 82 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt4z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 4 82 ${playlist}"
    # 5 26
    echo ============== 5 26 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt5z26/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 5 26 ${playlist}"
    # 5 82
    echo ============== 5 82 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt5z82/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency . 5 82 ${playlist}"
    # 99 99
    echo ============= 99 99 =============
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt99z99/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency_tracker . ${playlist}"
    # 99 99 Daisy
    echo ========= 99 99 Daisy ===========
    echo =================================
    python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/1D/${playlist}/efficiencyt99z99daisy/ --stage eventLoop --playlist ${playlist} --basedir ${basedir} --runcommand "./runEfficiency_tracker_daisy . ${playlist}"

    d /pnfs/minerva/persistent/users/anezkak/
    rm ${playlist}/*/myarea*
    cd /minerva/app/users/anezkak/MAT_GitHub/

done