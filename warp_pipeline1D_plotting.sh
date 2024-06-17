#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/07-10-2023_v430/1D_v430_enuratiowarp/
#datadDir=/minerva/data/users/anezkak/05-31-2023/2p2hwarp_CVv1-nonrespi

scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

CVfiles=/minerva/data/users/anezkak/07-10-2023_v430/1D/combined/
#/minerva/data/users/anezkak/03-04-2023/1D/combined/
warp="v430_enuratiowarp"

mkdir -p ${datadDir}

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

# for all playlists
#for playlist in minervame5A minervame6A minervame6B minervame6D minervame6G minervame6I 
#for playlist in minervame5A

#dir to save
saveDir=v430_enuratiowarp

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
echo Plot Warped/CV Ratio
#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 2 26 ${combinedVersion} ${warp}
#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 3 26 ${combinedVersion} ${warp}
#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 5 26 ${combinedVersion} ${warp}

#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 3 06 ${combinedVersion} ${warp}

#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 2 82 ${combinedVersion} ${warp}
#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 3 82 ${combinedVersion} ${warp}
#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 5 82 ${combinedVersion} ${warp}
#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 4 82 ${combinedVersion} ${warp}

#python ${plottingDir}/warpingStudies/ratio_orig_warped.py ${datadDir}/combined/ ${CVfiles} 99 99 ${combinedVersion} ${warp}

######################## Plot ###########################
echo Plot Warping Studies
cd ${datadDir}/combined/
for VARIABLE in x pTmu1D
do
    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t2_z26_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t3_z26_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t5_z26_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}

    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t2_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t3_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t4_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t5_z82_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}

    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t3_z06_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}

    python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t99_z99_${combinedVersion}_${warp}_${VARIABLE}.root ${warp} ${VARIABLE}
    for PETAL in 0 1 2 3 4 5 6 7 8 9 10 11
    do
        python ${plottingDir}/warpingStudies/PrintWarpingStudy_Pulls.py ${datadDir}/combined/${saveDir}/Warping_t99_z99_${combinedVersion}_${warp}_${VARIABLE}_${PETAL}.root ${warp} ${VARIABLE}
    done
done

cd /minerva/app/users/anezkak/MAT_GitHub

