#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/11-28-2023_v430_p4_combinedPlastic/1D/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

mkdir -p ${datadDir}


combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

#cd ${datadDir}/combined/
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst02z26/ ../PlasticBkg_${combinedVersion}_t2_z26_sys.root
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst02z82/ ../PlasticBkg_${combinedVersion}_t2_z82_sys.root
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst03z26/ ../PlasticBkg_${combinedVersion}_t3_z26_sys.root
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst03z06/ ../PlasticBkg_${combinedVersion}_t3_z06_sys.root
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst03z82/ ../PlasticBkg_${combinedVersion}_t3_z82_sys.root
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst04z82/ ../PlasticBkg_${combinedVersion}_t4_z82_sys.root
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst05z26/ ../PlasticBkg_${combinedVersion}_t5_z26_sys.root
#python ${scriptDir}combinePlaylistHistos_plasticSidebands.py ${datadDir}/combined/PlasticSidebandst05z82/ ../PlasticBkg_${combinedVersion}_t5_z82_sys.root

#mkdir -p "PlasticSidebands"
#cd "PlasticSidebands"
#mv ${datadDir}/combined/PlasticBkg_${combinedVersion}*.root .

#cd ${datadDir}/combined/
# plastic sidebands

#cd ${scaleFacDir}
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 2 26 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t2_z26.txt
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 2 82 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t2_z82.txt
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 3 26 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t3_z26.txt
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 3 06 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t3_z06.txt
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 3 82 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t3_z82.txt
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 4 82 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t4_z82.txt
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 5 26 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t5_z26.txt
#./getScaleFactors_PlasticSB ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 5 82 ${combinedVersion} 1 | tee ${datadDir}/combined/PlasticSidebands/plasticSidebands_t5_z82.txt


cd ${datadDir}/combined/PlasticSidebands
echo Plot Untuned And Tuned Plastic Sidebands
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 2 26 ${combinedVersion} 1
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 2 82 ${combinedVersion} 1
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 3 26 ${combinedVersion} 1
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 3 06 ${combinedVersion} 1
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 3 82 ${combinedVersion} 1
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 4 82 ${combinedVersion} 1
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 5 26 ${combinedVersion} 1
python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/combined/PlasticSidebands/ ${datadDir}/combined/PlasticSidebands 5 82 ${combinedVersion} 1

: '
echo Background Subtraction Targets
cd ${datadDir}/combined
mkdir -p "BackgroundSubtracted"
cd "BackgroundSubtracted"
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 3 06 ${combinedVersion} 1  

python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 2 26 ${combinedVersion} 1 
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 2 82 ${combinedVersion} 1 
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 3 26 ${combinedVersion} 1 
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 3 06 ${combinedVersion} 1  
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 3 82 ${combinedVersion} 1 
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 4 82 ${combinedVersion} 1 
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 5 26 ${combinedVersion} 1 
python ${scriptDir}BackgroundSubtraction.py ${datadDir}/combined ${datadDir}/combined/PlasticSidebands 5 82 ${combinedVersion} 1 

echo Background Subtraction Tracker
python ${scriptDir}BackgroundSubtraction_Tracker.py ${datadDir}/combined ${combinedVersion} 1

echo Background Subtraction Tracker Daisy
python ${scriptDir}BackgroundSubtraction_Tracker_Daisy.py ${datadDir}/combined ${combinedVersion} 1


cd ${datadDir}/combined/

echo Plot Background Subtracted Event Selections
cd "BackgroundSubtracted"
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 3 06 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1

echo Plot Background Subtracted Event Selection Tracker
python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1

python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target_SidebandScaled.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1
'
: '
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 3 06 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1
'
: '
echo Plot Background Subtracted Event Selection Tracker Daisy 
python ${plottingDir}plotDaisyDistrib_bkgSubtracted_new.py ${datadDir}/combined/BackgroundSubtracted ${combinedVersion} 1

cd ${datadDir}/combined/
cd "BackgroundSubtracted"
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 2 26 
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}combined/BackgroundSubtracted 2 82 
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 3 26
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 3 06 
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 3 82 
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 4 82 
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 5 26 
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 5 82 
python ${plottingDir}plotBkgSubtracted+ratio.py ${datadDir}/combined/BackgroundSubtracted 99 99 


echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection ${datadDir}/combined/ 26 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont235z26.txt
./extractCrossSection ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont3z06.txt
./extractCrossSection ${datadDir}/combined/ 82 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont2345z82.txt
echo Tracker Cross-section Extraction
./extractCrossSection ${datadDir}/combined/ 99 ${combinedVersion} 99 true | tee ${datadDir}/combined/cross-sectiont99z99.txt

echo Daisy Tracker Cross-section Extraction
cd ${scriptDir}
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} Enu | tee ${datadDir}/combined/cross-sectiont99z99Daisy_Enu.txt
./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} x | tee ${datadDir}/combined/cross-sectiont99z99Dais_x.txt
./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pTmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pTmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pZmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pZmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} ThetamuDeg | tee ${datadDir}/combined/cross-sectiont99z99Daisy_ThetamuDeg.txt

cd ${datadDir}/combined/
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1 x
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1 x
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1 x 

python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1 pTmu1D
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1 pTmu1D
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1 pTmu1D
'
cd /minerva/app/users/anezkak/MAT_GitHub/

