#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/07-10-2023_v430/1D_neutron20Mevwarp
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

mkdir -p ${datadDir}

# How many files do we have?
cd /pnfs/minerva/persistent/users/anezkak/1D_v430_neutron20Mev/
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

# for all playlists
#for playlist in minervame5A minervame6A minervame6B minervame6D minervame6G minervame6I 
#for playlist in minervame5A
for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J


do
    dirpwd=/pnfs/minerva/persistent/users/anezkak/1D_v430_neutron20Mev/${playlist}/
    echo ${dirpwd}
    cd ${dirpwd}
    cp eventloopt*/*.root .
    cp efficiency*/*.root .
    cp plastic*/Plastic*.root .
    # clean up the directories from the grid submissions
    rm -r eventloopt*/
    rm -r efficiency*/
    rm -r plastic*/

    cd ${datadDir}
    savedir="${playlist}"
    mkdir -p ${savedir} && cd ${savedir}
    pwd

    echo Working on this ${playlist}

    echo Event Loop
    cd ${datadDir}/${savedir}
    mkdir -p "EventSelection"
    cd "EventSelection"
    echo Copy event loop root files to data
    cp ${dirpwd}/EventSelection*.root .

    echo Efficiency plots
    cd ${datadDir}/${savedir}
    mkdir -p "Efficiency"
    cd "Efficiency"
    echo Copy efficiency files to data
    cp ${dirpwd}/Efficiency*.root .
    echo Efficiency plots
  

    echo Plastic sidebands Scale Factors
    cd ${datadDir}/${savedir}
    mkdir -p "PlastisSidebands"
    cd "PlastisSidebands"
    cp ${dirpwd}/PlasticBkg*.root .
    cd ${scaleFacDir}
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t2_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t2_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z06.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t4_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t5_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t5_z82.txt

    
    echo Background Subtraction Targets
    cd ${datadDir}/${savedir}
    mkdir -p "BackgroundSubtracted"
    cd "BackgroundSubtracted"
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} 
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} 
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} 
    
    echo Background Subtraction Tracker
    python ${scriptDir}BackgroundSubtraction_Tracker.py ${datadDir}/${savedir} ${playlist} 

    echo Background Subtraction Tracker Daisy
    python ${scriptDir}BackgroundSubtraction_Tracker_Daisy.py ${datadDir}/${savedir} ${playlist}

   
    cd /minerva/app/users/anezkak/MAT_GitHub/

    # make mkdir for combined playlists
    echo "------------------------------------"
    echo "Make mkdir for combined playlists"

    echo "Event Selection"
    mkdir -p ${datadDir}/combined/EventSelectiont02z26
    cd ${datadDir}/combined/EventSelectiont02z26
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t2_z26_sys.root .
    
    mkdir -p ${datadDir}/combined/EventSelectiont02z82
    cd ${datadDir}/combined/EventSelectiont02z82
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t2_z82_sys.root .
    
    mkdir -p ${datadDir}/combined/EventSelectiont03z26
    cd ${datadDir}/combined/EventSelectiont03z26
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t3_z26_sys.root .

    mkdir -p ${datadDir}/combined/EventSelectiont03z06
    cd ${datadDir}/combined/EventSelectiont03z06
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t3_z06_sys.root .

    mkdir -p ${datadDir}/combined/EventSelectiont03z82
    cd ${datadDir}/combined/EventSelectiont03z82
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t3_z82_sys.root .

    mkdir -p ${datadDir}/combined/EventSelectiont04z82
    cd ${datadDir}/combined/EventSelectiont04z82
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t4_z82_sys.root .

    mkdir -p ${datadDir}/combined/EventSelectiont05z26
    cd ${datadDir}/combined/EventSelectiont05z26
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t5_z26_sys.root .

    mkdir -p ${datadDir}/combined/EventSelectiont05z82
    cd ${datadDir}/combined/EventSelectiont05z82
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t5_z82_sys.root .

    mkdir -p ${datadDir}/combined/EventSelectiont99z99
    cd ${datadDir}/combined/EventSelectiont99z99
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_${playlist}_t99_z99_sys.root .

    mkdir -p ${datadDir}/combined/EventSelectiont99z99Daisy
    cd ${datadDir}/combined/EventSelectiont99z99Daisy
    cp ${datadDir}/${savedir}/EventSelection/EventSelection_daisy_${playlist}_t99_z99_sys.root .

    echo "Background subtracted"
    mkdir -p ${datadDir}/combined/BackgroundSubtractedt02z26
    cd ${datadDir}/combined/BackgroundSubtractedt02z26
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t2_z26_sys.root .
    
    mkdir -p ${datadDir}/combined/BackgroundSubtractedt02z82
    cd ${datadDir}/combined/BackgroundSubtractedt02z82
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t2_z82_sys.root .
    
    mkdir -p ${datadDir}/combined/BackgroundSubtractedt03z26
    cd ${datadDir}/combined/BackgroundSubtractedt03z26
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t3_z26_sys.root .

    mkdir -p ${datadDir}/combined/BackgroundSubtractedt03z06
    cd ${datadDir}/combined/BackgroundSubtractedt03z06
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t3_z06_sys.root .

    mkdir -p ${datadDir}/combined/BackgroundSubtractedt03z82
    cd ${datadDir}/combined/BackgroundSubtractedt03z82
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t3_z82_sys.root .

    mkdir -p ${datadDir}/combined/BackgroundSubtractedt04z82
    cd ${datadDir}/combined/BackgroundSubtractedt04z82
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t4_z82_sys.root .

    mkdir -p ${datadDir}/combined/BackgroundSubtractedt05z26
    cd ${datadDir}/combined/BackgroundSubtractedt05z26
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t5_z26_sys.root .

    mkdir -p ${datadDir}/combined/BackgroundSubtractedt05z82
    cd ${datadDir}/combined/BackgroundSubtractedt05z82
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t5_z82_sys.root .

    mkdir -p ${datadDir}/combined/BackgroundSubtractedt99z99
    cd ${datadDir}/combined/BackgroundSubtractedt99z99
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_${playlist}_t99_z99_sys.root .

    mkdir -p ${datadDir}/combined/BackgroundSubtractedt99z99Daisy
    cd ${datadDir}/combined/BackgroundSubtractedt99z99Daisy
    cp ${datadDir}/${savedir}/BackgroundSubtracted/BkgSubtracted_EventSelection_daisy_${playlist}_t99_z99_sys.root .
  
    echo "Efficiency"
    mkdir -p ${datadDir}/combined/Efficiencyt02z26
    cd ${datadDir}/combined/Efficiencyt02z26
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t2_z26_sys.root .
    
    mkdir -p ${datadDir}/combined/Efficiencyt02z82
    cd ${datadDir}/combined/Efficiencyt02z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t2_z82_sys.root .
    
    mkdir -p ${datadDir}/combined/Efficiencyt03z26
    cd ${datadDir}/combined/Efficiencyt03z26
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t3_z26_sys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt03z06
    cd ${datadDir}/combined/Efficiencyt03z06
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t3_z06_sys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt03z82
    cd ${datadDir}/combined/Efficiencyt03z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t3_z82_sys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt04z82
    cd ${datadDir}/combined/Efficiencyt04z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t4_z82_sys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt05z26
    cd ${datadDir}/combined/Efficiencyt05z26
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t5_z26_sys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt05z82
    cd ${datadDir}/combined/Efficiencyt05z82
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t5_z82_sys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt99z99
    cd ${datadDir}/combined/Efficiencyt99z99
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_${playlist}_t99_z99_sys.root .

    mkdir -p ${datadDir}/combined/Efficiencyt99z99Daisy
    cd ${datadDir}/combined/Efficiencyt99z99Daisy
    cp ${datadDir}/${savedir}/Efficiency/Efficiency_Daisy_${playlist}_t99_z99_sys.root .
    
    cd /minerva/app/users/anezkak/MAT_GitHub/

done

# Combine root files from different playlist 

echo Combine root files from different playlists
echo First combine backtround subtracted event rates
cd ${datadDir}/combined/

echo Check number of files
echo "CHECK THIS!! IMPORTANT"
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont02z26/ ../EventSelection_${combinedVersion}_t2_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont02z82/ ../EventSelection_${combinedVersion}_t2_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont03z26/ ../EventSelection_${combinedVersion}_t3_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont03z06/ ../EventSelection_${combinedVersion}_t3_z06_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont03z82/ ../EventSelection_${combinedVersion}_t3_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont04z82/ ../EventSelection_${combinedVersion}_t4_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont05z26/ ../EventSelection_${combinedVersion}_t5_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont05z82/ ../EventSelection_${combinedVersion}_t5_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont99z99/ ../EventSelection_${combinedVersion}_t99_z99_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont99z99Daisy/ ../EventSelection_daisy_${combinedVersion}_t99_z99_sys.root


echo Combine efficiencies
# Need to have it here until I fix it because using POT from bkg subtracted
# Need to combine before I combine bkg subtracted, otherwise index out of range
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z26 ${datadDir}/combined/BackgroundSubtractedt02z26/ ../Efficiency_${combinedVersion}_t2_z26_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z82 ${datadDir}/combined/BackgroundSubtractedt02z82/ ../Efficiency_${combinedVersion}_t2_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z26 ${datadDir}/combined/BackgroundSubtractedt03z26/ ../Efficiency_${combinedVersion}_t3_z26_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z06 ${datadDir}/combined/BackgroundSubtractedt03z06/ ../Efficiency_${combinedVersion}_t3_z06_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z82 ${datadDir}/combined/BackgroundSubtractedt03z82/ ../Efficiency_${combinedVersion}_t3_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt04z82 ${datadDir}/combined/BackgroundSubtractedt04z82/ ../Efficiency_${combinedVersion}_t4_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z26 ${datadDir}/combined/BackgroundSubtractedt05z26/ ../Efficiency_${combinedVersion}_t5_z26_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z82 ${datadDir}/combined/BackgroundSubtractedt05z82/ ../Efficiency_${combinedVersion}_t5_z82_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99 ${datadDir}/combined/BackgroundSubtractedt99z99/ ../Efficiency_${combinedVersion}_t99_z99_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99Daisy ${datadDir}/combined/BackgroundSubtractedt99z99Daisy/ ../Efficiency_Daisy_${combinedVersion}_t99_z99_sys.root
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

python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt02z26/ ../BkgSubtracted_EventSelection_${combinedVersion}_t2_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt02z82/ ../BkgSubtracted_EventSelection_${combinedVersion}_t2_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt03z26/ ../BkgSubtracted_EventSelection_${combinedVersion}_t3_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt03z06/ ../BkgSubtracted_EventSelection_${combinedVersion}_t3_z06_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt03z82/ ../BkgSubtracted_EventSelection_${combinedVersion}_t3_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt04z82/ ../BkgSubtracted_EventSelection_${combinedVersion}_t4_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt05z26/ ../BkgSubtracted_EventSelection_${combinedVersion}_t5_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt05z82/ ../BkgSubtracted_EventSelection_${combinedVersion}_t5_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt99z99/ ../BkgSubtracted_EventSelection_${combinedVersion}_t99_z99_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/BackgroundSubtractedt99z99Daisy/ ../BkgSubtracted_EventSelection_daisy_${combinedVersion}_t99_z99_sys.root

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
rm -r ${datadDir}/combined/EventSelectiont*
rm -r ${datadDir}/combined/BackgroundSubtractedt*
rm -r ${datadDir}/combined/Efficiencyt*

cd ${datadDir}/combined/

mkdir -p "EventSelection"
cd "EventSelection"
mv ${datadDir}/combined/EventSelection_${combinedVersion}*.root .
mv ${datadDir}/combined/EventSelection_daisy_${combinedVersion}*.root .

cd ${datadDir}/combined/

mkdir -p "BackgroundSubtracted"
cd "BackgroundSubtracted"
mv ${datadDir}/combined/BkgSubtracted_EventSelection_${combinedVersion}*.root .
mv ${datadDir}/combined/BkgSubtracted_EventSelection_daisy_${combinedVersion}*.root .

cd ${datadDir}/combined/

mkdir -p "Efficiency"
cd "Efficiency"
mv ${datadDir}/combined/Efficiency_${combinedVersion}*.root .
mv ${datadDir}/combined/Efficiency_Daisy_${combinedVersion}*.root .

cd ${datadDir}/combined/

##########################################################
##########################################################
##########################################################

############  WARPING STUDY STARTS here  #################
##########################################################
##########################################################



cd /minerva/app/users/anezkak/MAT_GitHub

