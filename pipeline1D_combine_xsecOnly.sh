#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/07-10-2023_v430/1D/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

mkdir -p ${datadDir}

# How many files do we have?
cd /pnfs/minerva/persistent/users/anezkak/1D_v430/
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

cd ${datadDir}/combined/
iterDir="50iter"
mkdir -p ${iterDir}

echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection ${datadDir}/combined/ 26 ${combinedVersion} | tee ${datadDir}/combined/${iterDir}/cross-sectiont235z26.txt
./extractCrossSection ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/${iterDir}/cross-sectiont3z06.txt
#./extractCrossSection ${datadDir}/combined/ 82 ${combinedVersion} | tee ${datadDir}/combined/${iterDir}/cross-sectiont2345z82.txt
#echo Tracker Cross-section Extraction
#./extractCrossSection ${datadDir}/combined/ 99 ${combinedVersion} 99 true | tee ${datadDir}/combined/${iterDir}/cross-sectiont99z99.txt

#echo Daisy Tracker Cross-section Extraction
#cd ${scriptDir}
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} Enu | tee ${datadDir}/combined/${iterDir}/cross-sectiont99z99Daisy_Enu.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} x | tee ${datadDir}/combined/${iterDir}/cross-sectiont99z99Daisy_x.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pTmu1D | tee ${datadDir}/combined/${iterDir}/cross-sectiont99z99Daisy_pTmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pZmu1D | tee ${datadDir}/combined/${iterDir}/cross-sectiont99z99Daisy_pZmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} ThetamuDeg | tee ${datadDir}/combined/${iterDir}/cross-sectiont99z99Daisy_ThetamuDeg.txt

cd /minerva/app/users/anezkak/MAT_GitHub/

