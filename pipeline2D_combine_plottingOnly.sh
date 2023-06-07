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
cd ${plottingDir}
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 26 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 82 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 26 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 06 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 82 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 4 82 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 26 ${combinedVersion} 1
./plotEventSelection2D_Target ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 82 ${combinedVersion} 1
./plotEventSelection2D_Tracker ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 99 99 ${combinedVersion} 1
./plotDaisyEventSelection2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection ${combinedVersion} 1

echo Event Loop with intType breakdown plots
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 26 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 26 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 06 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 4 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 26 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 99 99 ${combinedVersion} 1

echo Event Loop Fractional Error plots
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 26 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 82 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 26 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 06 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 82 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 4 82 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 26 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 82 ${combinedVersion} 
./plotFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 99 99 ${combinedVersion} 
./plotDaisyFractionalError2D ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection ${combinedVersion} 

cd ${datadDir}/combined/

echo Plot Background Subtracted Event Selections
cd "BackgroundSubtracted"
cd ${plottingDir}
echo Plot Background Subtracted Event Selections Tracker
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1

echo Plot Fractional Errors Background Subtracted Event Selections
echo Data
./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 

echo MC
./plotFractionalError2D_BkgSubtractedMC ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 

echo Plot Background Subtracted Event Selections Tracker Daisy
./plotDaisyBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted ${combinedVersion} 1


cd ${datadDir}/combined/

echo Efficiency plots
cd "Efficiency"
cd ${plottingDir}
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 2 26 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 2 82 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 3 26 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 3 06 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 3 82 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 4 82 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 5 26 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 5 82 ${combinedVersion} 1
./plotEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 99 99 ${combinedVersion} 1
./plotDaisyEfficiencyNumDenom2D ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency ${combinedVersion} 1  

echo Efficiency
cd ${datadDir}/combined/Efficiency
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 2 26 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 2 82 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 3 26 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 3 06 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 3 82 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 4 82 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 5 26 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 5 82 ${combinedVersion} 
python ${plottingDir}/plotEfficiency2D.py ${datadDir}/combined/Efficiency 99 99 ${combinedVersion} 
python ${plottingDir}/plotDaisyEfficiency2D.py ${datadDir}/combined/Efficiency ${combinedVersion} 


cd /minerva/app/users/anezkak/MAT_GitHub/

