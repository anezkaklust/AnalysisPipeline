#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/panel_plottingConcise/
datadDir=/minerva/data/users/anezkak/03-04-2023/2D/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

mkdir -p ${datadDir}/

# How many files do we have?
cd /pnfs/minerva/persistent/users/anezkak/1D/
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

cd ${datadDir}/combined/

# PLOTTING combined stuff
# Combine root files from different playlist 
echo Combine root files from different playlists
echo First combine backtround subtracted event rates
cd ${datadDir}/combined/

echo Event Selection plots
cd "EventSelection"
#python /minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/combineTargetHistos.py ${datadDir}/combined/EventSelection/iron  ../EventSelection_${combinedVersion}_t23_z26_sys.root
#python /minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/combineTargetHistos.py ${datadDir}/combined/EventSelection/lead  ../EventSelection_${combinedVersion}_t2345_z82_sys.root


echo Event Selection plots
cd "EventSelection"
cd ${plottingDir}
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 235 26 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2345 82 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 06 ${combinedVersion} 1
./plotEventSelection2D_Tracker ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 99 99 ${combinedVersion} 1
#./plotDaisyEventSelection2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection ${combinedVersion} 1

echo Event Loop with intType breakdown plots
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 235 26 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2345 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 06 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 99 99 ${combinedVersion} 1

cd /minerva/app/users/anezkak/MAT_GitHub/

