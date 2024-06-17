#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/10-25-2023_v430_p4/1D/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

mkdir -p ${datadDir}

# How many files do we have?
cd /pnfs/minerva/persistent/users/anezkak/1D_v430_p4/
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

# for all playlists
#for playlist in minervame5A
for playlist in minervame6A

do  : '
    dirpwd=/pnfs/minerva/persistent/users/anezkak/1D_v430_p4/${playlist}/
    echo ${dirpwd}
    cd ${dirpwd}

    cd ${datadDir}
    savedir="${playlist}"
    mkdir -p ${savedir} && cd ${savedir}
   
    echo Plastic sidebands Scale Factors
    cd ${datadDir}/${savedir}
    mkdir -p "PlasticSidebands"
    cd "PlasticSidebands"
    cp ${dirpwd}/PlasticBkg*.root .
    cd ${scaleFacDir}
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 26 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t2_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 82 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t2_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 26 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t3_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 06 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t3_z06.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 82 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t3_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 4 82 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t4_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 26 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t5_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 82 ${playlist} 0 | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t5_z82.txt
    '
    cd ${datadDir}/${savedir}
    echo Plot Untuned And Tuned Plastic Sidebands
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} 0
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} 0
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} 0
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} 0
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} 0
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} 0
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} 0
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} 0
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################

done

cd /minerva/app/users/anezkak/MAT_GitHub/

