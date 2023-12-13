#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

label=1D_base_p4

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/10-25-2023_v430_p4/1D/${label}/
OGDir=/minerva/data/users/anezkak/10-25-2023_v430_p4/1D/ # for data POT because efficiencies don't have it
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/modelComparisons/

mkdir -p ${datadDir}

# How many files do we have?
cd /pnfs/minerva/persistent/users/anezkak/${label}/
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

#echo Combine efficiencies
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z26 ${datadDir}/combined/BackgroundSubtractedt02z26/ ../Efficiency_${combinedVersion}_t2_z26_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z82 ${datadDir}/combined/BackgroundSubtractedt02z82/ ../Efficiency_${combinedVersion}_t2_z82_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z26 ${datadDir}/combined/BackgroundSubtractedt03z26/ ../Efficiency_${combinedVersion}_t3_z26_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z06 ${datadDir}/combined/BackgroundSubtractedt03z06/ ../Efficiency_${combinedVersion}_t3_z06_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z82 ${datadDir}/combined/BackgroundSubtractedt03z82/ ../Efficiency_${combinedVersion}_t3_z82_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt04z82 ${datadDir}/combined/BackgroundSubtractedt04z82/ ../Efficiency_${combinedVersion}_t4_z82_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z26 ${datadDir}/combined/BackgroundSubtractedt05z26/ ../Efficiency_${combinedVersion}_t5_z26_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z82 ${datadDir}/combined/BackgroundSubtractedt05z82/ ../Efficiency_${combinedVersion}_t5_z82_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99 ${datadDir}/combined/BackgroundSubtractedt99z99/ ../Efficiency_${combinedVersion}_t99_z99_sys.root
#python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99Daisy ${datadDir}/combined/BackgroundSubtractedt99z99Daisy/ ../Efficiency_Daisy_${combinedVersion}_t99_z99_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt02z26 ../Efficiency_${combinedVersion}_t2_z26_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt02z82 ../Efficiency_${combinedVersion}_t2_z82_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt03z26 ../Efficiency_${combinedVersion}_t3_z26_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt03z06 ../Efficiency_${combinedVersion}_t3_z06_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt03z82 ../Efficiency_${combinedVersion}_t3_z82_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt04z82 ../Efficiency_${combinedVersion}_t4_z82_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt05z26 ../Efficiency_${combinedVersion}_t5_z26_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt05z82 ../Efficiency_${combinedVersion}_t5_z82_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt99z99 ../Efficiency_${combinedVersion}_t99_z99_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Efficiencyt99z99Daisy ../Efficiency_Daisy_${combinedVersion}_t99_z99_sys.root



# PLOTTING combined stuff
cd ${datadDir}/combined/

#echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection_modelComparison ${datadDir}/combined/ 26 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont235z26.txt
./extractCrossSection_modelComparison ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont3z06.txt
./extractCrossSection_modelComparison ${datadDir}/combined/ 82 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont2345z82.txt
#echo Tracker Cross-section Extraction
./extractCrossSection_modelComparison ${datadDir}/combined/ 99 ${combinedVersion} 99 true | tee ${datadDir}/combined/cross-sectiont99z99.txt

#echo Daisy Tracker Cross-section Extraction
#cd ${scriptDir}
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} Enu | tee ${datadDir}/combined/cross-sectiont99z99Daisy_Enu.txt
./extractCrossSection_tracker_daisy_modelComparison ${datadDir}/combined/ 99 99 ${combinedVersion} x | tee ${datadDir}/combined/cross-sectiont99z99Dais_x.txt
./extractCrossSection_tracker_daisy_modelComparison ${datadDir}/combined/ 99 99 ${combinedVersion} pTmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pTmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pZmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pZmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} ThetamuDeg | tee ${datadDir}/combined/cross-sectiont99z99Daisy_ThetamuDeg.txt


cd /minerva/app/users/anezkak/MAT_GitHub/

