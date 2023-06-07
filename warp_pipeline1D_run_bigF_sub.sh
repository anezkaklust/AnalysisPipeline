#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
#datadDir=/minerva/data/users/anezkak/${now}/1D_nonrespiwarp20Gev/
datadDir=/minerva/data/users/anezkak/05-31-2023/mareswarp_CVv1-nonrespi/

scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

CVfiles=/minerva/data/users/anezkak/06-05-2023_v1-nonrespi/1D/combined/
#/minerva/data/users/anezkak/03-04-2023/1D/combined/
warp="mares_CVv1-nonrespi"

mkdir -p ${datadDir}

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

# for all playlists
#for playlist in minervame5A minervame6A minervame6B minervame6D minervame6G minervame6I 
#for playlist in minervame5A

#dir to save
saveDir=mares_statUnc

# PLOTTING combined stuff
# Combine root files from different playlist 
echo Combine root files from different playlists
echo First combine backtround subtracted event rates
cd ${datadDir}/combined/
mkdir -p ${saveDir}
cd ${saveDir}

##########################################################
##########################################################
##########################################################

############  WARPING STUDY STARTS here  #################
##########################################################
##########################################################


echo Run Warping Studies
cd ${scriptDir}/warpingStudies/

source runTransWarp_bigF_sub.sh ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 3 26 ${combinedVersion} ${warp}

source runTransWarpDaisy_bigF_sub.sh ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 99 99 ${combinedVersion} ${warp}
: << 'COMMENT'
source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 2 26 ${combinedVersion} ${warp}
source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 3 26 ${combinedVersion} ${warp}
source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 5 26 ${combinedVersion} ${warp}

source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 3 06 ${combinedVersion} ${warp}

source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 2 82 ${combinedVersion} ${warp}
source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 3 82 ${combinedVersion} ${warp}
source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 4 82 ${combinedVersion} ${warp}
source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 5 82 ${combinedVersion} ${warp}

source runTransWarp.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 99 99 ${combinedVersion} ${warp}

cd ${scriptDir}/warpingStudies/
source runTransWarpDaisy.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/${saveDir}/ 99 99 ${combinedVersion} ${warp}


######################## Plot ###########################
echo Plot Warping Studies
cd ${datadDir}/combined/
for VARIABLE in Enu x pTmu1D pZmu1D ThetamuDeg
do
    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t2_z26_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t3_z26_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t5_z26_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}

    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t2_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t3_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t4_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t5_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}

    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t3_z06_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}

    python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t99_z99_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    for PETAL in 0 1 2 3 4 5 6 7 8 9 10 11
    do
        python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t99_z99_${combinedVersion}_${warp}_${VARIABLE}_${PETAL}.root ${warp} ${VARIABLE}
    done
done
COMMENT
VARIABLE=x
cd ${datadDir}/combined/
python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t3_z26_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}

for PETAL in 6
    do
        python ${plottingDir}/warpingStudies/PrintWarpingStudy.py ${datadDir}/combined/${saveDir}/Warping_t99_z99_${combinedVersion}_${warp}_${VARIABLE}_${PETAL}.root ${warp} ${VARIABLE}
    done

cd /minerva/app/users/anezkak/MAT_GitHub

