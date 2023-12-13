#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

label=1D_v1_p4

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

# for all playlists
#for playlist in minervame5A
for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J


do
    dirpwd=/pnfs/minerva/persistent/users/anezkak/${label}/${playlist}/
    echo ${dirpwd}
    cd ${dirpwd}
    cp efficiency*/*.root .
    # clean up the directories from the grid submissions
    rm -r efficiency*/

    cd ${datadDir}
    savedir="${playlist}"
    mkdir -p ${savedir} && cd ${savedir}
    pwd

    echo Working on this ${playlist}


    echo Efficiency
    cd ${datadDir}/${savedir}
    mkdir -p "Efficiency"
    cd "Efficiency"
    echo Copy efficiency files to data
    cp ${dirpwd}/Efficiency*.root .
    echo Efficiency plots

    ##############################################################################################
    ############### Move to dirs per playlist in which we combine stuff ##########################
    ##############################################################################################

    cd /minerva/app/users/anezkak/MAT_GitHub/

    # make mkdir for combined playlists
    echo "------------------------------------"
    echo "Make mkdir for combined playlists"
  
    echo "Efficiency"
    mkdir -p ${datadDir}/combined/Efficiencyt02z26
    cd ${datadDir}/combined/Efficiencyt02z26
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t2_z26_nosys.root .
    
    mkdir -p ${datadDir}/combined/Efficiencyt02z82
    cd ${datadDir}/combined/Efficiencyt02z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t2_z82_nosys.root .
    
    mkdir -p ${datadDir}/combined/Efficiencyt03z26
    cd ${datadDir}/combined/Efficiencyt03z26
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t3_z26_nosys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt03z06
    cd ${datadDir}/combined/Efficiencyt03z06
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t3_z06_nosys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt03z82
    cd ${datadDir}/combined/Efficiencyt03z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t3_z82_nosys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt04z82
    cd ${datadDir}/combined/Efficiencyt04z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t4_z82_nosys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt05z26
    cd ${datadDir}/combined/Efficiencyt05z26
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t5_z26_nosys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt05z82
    cd ${datadDir}/combined/Efficiencyt05z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t5_z82_nosys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt99z99
    cd ${datadDir}/combined/Efficiencyt99z99
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t99_z99_nosys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt99z99Daisy
    cd ${datadDir}/combined/Efficiencyt99z99Daisy
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_Daisy_${playlist}_t99_z99_nosys.root .
    
    cd /minerva/app/users/anezkak/MAT_GitHub/

done

# Combine root files from different playlist 

echo Combine root files from different playlists
cd ${datadDir}/combined/

echo Check number of files
echo "CHECK THIS!! IMPORTANT"
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr


echo Combine efficiencies
# Need to have it here until I fix it because using POT from bkg subtracted
# Need to combine before I combine bkg subtracted, otherwise index out of range
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z26 ${OGDir}/combined/BackgroundSubtractedt02z26/ ../Efficiency_${combinedVersion}_t2_z26_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z82 ${OGDir}/combined/BackgroundSubtractedt02z82/ ../Efficiency_${combinedVersion}_t2_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z26 ${OGDir}/combined/BackgroundSubtractedt03z26/ ../Efficiency_${combinedVersion}_t3_z26_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z06 ${OGDir}/combined/BackgroundSubtractedt03z06/ ../Efficiency_${combinedVersion}_t3_z06_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z82 ${OGDir}/combined/BackgroundSubtractedt03z82/ ../Efficiency_${combinedVersion}_t3_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt04z82 ${OGDir}/combined/BackgroundSubtractedt04z82/ ../Efficiency_${combinedVersion}_t4_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z26 ${OGDir}/combined/BackgroundSubtractedt05z26/ ../Efficiency_${combinedVersion}_t5_z26_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z82 ${OGDir}/combined/BackgroundSubtractedt05z82/ ../Efficiency_${combinedVersion}_t5_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99 ${OGDir}/combined/BackgroundSubtractedt99z99/ ../Efficiency_${combinedVersion}_t99_z99_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99Daisy ${OGDir}/combined/BackgroundSubtractedt99z99Daisy/ ../Efficiency_Daisy_${combinedVersion}_t99_z99_sys.root
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

# clean up 
#rm -r ${datadDir}/combined/EventSelectiont*
#rm -r ${datadDir}/combined/BackgroundSubtractedt*
#rm -r ${datadDir}/combined/Migrationt*
#rm -r ${datadDir}/combined/Efficiencyt*

cd ${datadDir}/combined/

mkdir -p "Efficiency"
cd "Efficiency"
mv ${datadDir}/combined/Efficiency_${combinedVersion}*.root .
mv ${datadDir}/combined/Efficiency_Daisy_${combinedVersion}*.root .


# PLOTTING combined stuff
cd ${datadDir}/combined/

#echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection ${datadDir}/combined/ 26 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont235z26.txt
./extractCrossSection ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont3z06.txt
./extractCrossSection ${datadDir}/combined/ 82 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont2345z82.txt
#echo Tracker Cross-section Extraction
./extractCrossSection ${datadDir}/combined/ 99 ${combinedVersion} 99 true | tee ${datadDir}/combined/cross-sectiont99z99.txt

#echo Daisy Tracker Cross-section Extraction
#cd ${scriptDir}
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} Enu | tee ${datadDir}/combined/cross-sectiont99z99Daisy_Enu.txt
./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} x | tee ${datadDir}/combined/cross-sectiont99z99Dais_x.txt
./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pTmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pTmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} pZmu1D | tee ${datadDir}/combined/cross-sectiont99z99Daisy_pZmu1D.txt
#./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} ThetamuDeg | tee ${datadDir}/combined/cross-sectiont99z99Daisy_ThetamuDeg.txt


cd /minerva/app/users/anezkak/MAT_GitHub/

