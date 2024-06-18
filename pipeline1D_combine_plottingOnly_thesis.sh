#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/10-25-2023_v430_p4/1D/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

# How many files do we have?
#cd /pnfs/minerva/persistent/users/anezkak/1D_v1-nonrespi/
#du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
# for all playlists
#for playlist in minervame5A minervame6A minervame6B minervame6D minervame6G minervame6I 
#for playlist in minervame6A

# PLOTTING combined stuff
cd ${datadDir}/combined/
: '
echo Event Selection plots
mkdir -p "EventSelection_thesis"
cd "EventSelection_thesis"

python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg+ratio_target.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1

python ${plottingDir}plotStackedBkg+ratio_tracker.py ${datadDir}/combined/EventSelection/ ${combinedVersion} 1

python ${plottingDir}plotDaisyDistrib_withBkg.py ${datadDir}/combined/EventSelection/ ${combinedVersion} 1

python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1
python ${plottingDir}plotStacked_intType.py ${datadDir}/combined/EventSelection/ 99 99 ${combinedVersion} 1

'

#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1
#python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 99 99 ${combinedVersion} 1
: '
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_dataMCratio.py ${datadDir}/combined/EventSelection/ 99 99 ${combinedVersion} 1
 
echo Background breakdown Targets
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
python ${plottingDir}plotStackedBkg_target.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1

echo Background breakdown Tracker
python ${plottingDir}plotStackedBkg_tracker.py ${datadDir}/combined/EventSelection/ ${combinedVersion} 1
'
: '
echo Event Loop Tracker Daisy
python ${plottingDir}plotDaisyDistrib.py ${datadDir}/combined/EventSelection/ ${combinedVersion} 1
python ${plottingDir}plotDaisyDistrib_withBkg.py ${datadDir}/combined/EventSelection/ ${combinedVersion} 1

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

python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 3 06 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1
python ${plottingDir}plotCVError_bkgSubtracted_dataMCratio.py ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1

echo Plot Background Subtracted Event Selection Tracker Daisy 
python ${plottingDir}plotDaisyDistrib_bkgSubtracted.py ${datadDir}/combined/BackgroundSubtracted ${combinedVersion} 1

cd ${datadDir}/combined/

echo Migration plots
cd "Migration"
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 2 26 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 2 82 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 3 26 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 3 06 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 3 82 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 4 82 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 5 26 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 5 82 ${combinedVersion}
python ${plottingDir}plotMigrationMatrix.py ${datadDir}combined/Migration 99 99 ${combinedVersion}

echo Migration Tracker Daisy
python ${plottingDir}plotDaisyMigrationMatrix.py ${datadDir}/combined/Migration ${combinedVersion}

cd ${datadDir}/combined/

echo Efficiency plots
cd "Efficiency"
python ${plottingDir}plotEfficiency_combined.py ${datadDir}/combined/Efficiency 26 ${combinedVersion} 1
python ${plottingDir}plotEfficiency_combined.py ${datadDir}/combined/Efficiency 82 ${combinedVersion} 1
python ${plottingDir}plotEfficiency_combined.py ${datadDir}/combined/Efficiency 06 ${combinedVersion} 1
python ${plottingDir}plotEfficiency_combined.py ${datadDir}/combined/Efficiency 99 ${combinedVersion} 1

echo Efficiency Tracker Daisy
python ${plottingDir}plotDaisyEfficiency.py ${datadDir}/combined/Efficiency ${combinedVersion} 1


echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection ${datadDir}/combined/ 26 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont235z26.txt

./extractCrossSection ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont3z06.txt
./extractCrossSection ${datadDir}/combined/ 82 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont2345z82.txt
echo Tracker Cross-section Extraction
./extractCrossSection ${datadDir}/combined/ 99 ${combinedVersion} 99 true | tee ${datadDir}/combined/cross-sectiont99z99.txt
'
: '
echo Daisy Tracker Cross-section Extraction
cd ${scriptDir}
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} Enu | tee ${datadDir}/combined/cross-sectiont99z99Daisy_Enu.txt
./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} x | tee ${datadDir}/combined/cross-sectiont99z99Dais_x.txt
./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pTmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pTmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pZmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pZmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} ThetamuDeg | tee ${datadDir}/combined/cross-sectiont99z99Daisy_ThetamuDeg.txt

echo Single Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection_single ${datadDir}/combined/ 26 ${combinedVersion} 2 | tee ${datadDir}/combined/cross-sectiont2z26.txt
./extractCrossSection_single ${datadDir}/combined/ 26 ${combinedVersion} 3 | tee ${datadDir}/combined/cross-sectiont3z26.txt
./extractCrossSection_single ${datadDir}/combined/ 26 ${combinedVersion} 5 | tee ${datadDir}/combined/cross-sectiont5z26.txt

./extractCrossSection_single ${datadDir}/combined/ 82 ${combinedVersion} 2 | tee ${datadDir}/combined/cross-sectiont2z82.txt
./extractCrossSection_single ${datadDir}/combined/ 82 ${combinedVersion} 3 | tee ${datadDir}/combined/cross-sectiont3z82.txt
./extractCrossSection_single ${datadDir}/combined/ 82 ${combinedVersion} 4 | tee ${datadDir}/combined/cross-sectiont4z82.txt
./extractCrossSection_single ${datadDir}/combined/ 82 ${combinedVersion} 5 | tee ${datadDir}/combined/cross-sectiont5z82.txt

echo Plot Single Target Cross-section
cd ${datadDir}/combined/
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 2 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 3 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 5 26 ${combinedVersion} 1

python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 2 82 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 3 82 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 4 82 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 5 82 ${combinedVersion} 1

echo Plot Single Target Cross-section Comparison Iron and Lead
python ${plottingDir}plotXsection_dataMCratio_single.py ${datadDir}/combined/ 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_dataMCratio_single.py ${datadDir}/combined/ 82 ${combinedVersion} 1

echo Plot Target Cross-section
cd ${datadDir}/combined/
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 235 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 2345 82 ${combinedVersion} 1

echo Plot Tracker Cross-section
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 99 99 ${combinedVersion} 1

'

echo Plot Tracker Daisy Cross-section
cd ${datadDir}/combined/
#python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/combined/ ${combinedVersion} 1 Enu
python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/combined/ ${combinedVersion} 1 x
python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/combined/ ${combinedVersion} 1 pTmu1D
#python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/combined/ ${combinedVersion} 1 pZmu1D
#python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/combined/ ${combinedVersion} 1 ThetamuDeg
: '

echo Plot Stacked Target Cross-section
cd ${datadDir}/combined/
python ${plottingDir}plotXsection_combinedTarget_stacked+ratio.py ${datadDir}/combined/ 235 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_stacked+ratio.py ${datadDir}/combined/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_stacked+ratio.py ${datadDir}/combined/ 2345 82 ${combinedVersion} 1

echo Plot Stacked Tracker Cross-section
python ${plottingDir}plotXsection_combinedTarget_stacked+ratio.py ${datadDir}/combined/ 99 99 ${combinedVersion} 1



echo Plot Target Data/MC Cross-section ratios
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 235 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 2345 82 ${combinedVersion} 1

echo Plot Tracker Data/MC Cross-section ratios
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 99 99 ${combinedVersion} 1


echo Plot Daisy Target/Tracker Ratios
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1 Enu
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1 Enu
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1 Enu

python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1 x
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1 x
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1 x 

python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1 pTmu1D
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1 pTmu1D
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1 pTmu1D

'
: '
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1 pZmu1D
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1 pZmu1D
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1 pZmu1D 

#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1 ThetamuDeg
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1 ThetamuDeg
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1 ThetamuDeg

# plot ratios with intType
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 0
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 0
#python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 0

echo Plot Non-Daisy Target/Tracker Ratios
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 26 ${combinedVersion} 1
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 06 ${combinedVersion} 1
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 82 ${combinedVersion} 1

# plot ratios with intType
#python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 26 ${combinedVersion} 0
#python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 06 ${combinedVersion} 0
#python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 82 ${combinedVersion} 0
'
cd /minerva/app/users/anezkak/MAT_GitHub/
