#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


datadDir=/minerva/data/users/anezkak/08-30-2023_2DbinOptim/2D/

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/panel_plottingConcise_optim/
scriptDir1D=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists2D/
pnfsDir=/pnfs/minerva/persistent/users/anezkak/2D_v430_newBin/

# How many files do we have?
cd ${pnfsDir}
echo ${pnfsDir}
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame6A6B6C6D6E6F6G6H6I6J"

mkdir -p ${datadDir}
cd ${datadDir}
mkdir -p combined

cd ${datadDir}/combined/
mkdir -p EventSelection
mkdir -p Efficiency
mkdir -p Migration
mkdir -p Plastic

cd ${datadDir}/combined/

#<< 'MULTILINE-COMMENT'
cd ${datadDir}/combined/

echo Get Scale Factors
cd ${scriptDir}/plasticBackground2D/

./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 3 6 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t3_z06.txt
cd ${datadDir}/combined/
echo Background Subtracted
mkdir -p BackgroundSubtracted
cd BackgroundSubtracted

python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 3 06 ${combinedVersion} 1


echo Extract Cross-Section
cd ${scriptDir}
echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection2D ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont3z06.txt


#echo Plot Cross-Section
#cd ${plottingDir}
#./plotCrossSection2D ${datadDir}/combined  ${datadDir}/combined/ 3 06 ${combinedVersion}


echo Plot Cross-Section Fractional Error
cd ${plottingDir}
./plotFractionalError2D_CrossSection ${datadDir}/combined  ${datadDir}/combined/ 3 06 ${combinedVersion}

echo Plot Unfolded
cd ${plottingDir}
./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 3 3 6 ${combinedVersion}


echo Plot Unfolded Fractional Error
cd ${plottingDir}
./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 3 3 6 ${combinedVersion}

cd /minerva/app/users/anezkak/MAT_GitHub/

