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

<< 'MULTILINE-COMMENT'
cd ${datadDir}

echo Event Loop, Efficiency, Migration and Plastic

#for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
for playlist in minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J

do
    dirpwd=${pnfsDir}/${playlist}/
    cd ${dirpwd}
    cp eventloopt*/*.root .
    cp efficiency*/*.root .
    cp migration*/*.root .
    cp plastic*/*.root .
    
    rm -r eventloopt*/
    rm -r migration*/
    rm -r efficiency*/
    rm -r plastic*/

    cd ${datadDir}
    savedir="${playlist}"
    mkdir -p ${savedir} && cd ${savedir}
    pwd

    echo Working on this ${playlist}

    echo Event Loop
    cd ${datadDir}/${savedir}
    cd ${datadDir}/${savedir}
    mkdir -p "EventSelection"
    cd "EventSelection"
    echo Copy event loop root files to data
    cp ${dirpwd}/EventSelection*.root .

    # make mkdir for combined playlists
    echo "------------------------------------"
    echo "Make mkdir for combined playlists"

    echo "Event Loop"
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

    echo Efficiency 
    cd ${datadDir}/${savedir}
    mkdir -p "Efficiency"
    cd "Efficiency"
    echo Copy efficiency files to data
    cp ${dirpwd}/Efficiency*.root .

    # make mkdir for combined playlists
    echo "------------------------------------"
    echo "Make mkdir for combined playlists"

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

    echo Migration
    cd ${datadDir}/${savedir}
    mkdir -p "Migration"
    cd "Migration"
    echo Copy migration files to data
    cp ${dirpwd}/Migration*.root .
      
    # make mkdir for combined playlists
    echo "------------------------------------"
    echo "Make mkdir for combined playlists"

    echo "Migration"
    mkdir -p ${datadDir}/combined/Migrationt02z26
    cd ${datadDir}/combined/Migrationt02z26
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t2_z26_sys.root .
    
    mkdir -p ${datadDir}/combined/Migrationt02z82
    cd ${datadDir}/combined/Migrationt02z82
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t2_z82_sys.root .
    
    mkdir -p ${datadDir}/combined/Migrationt03z26
    cd ${datadDir}/combined/Migrationt03z26
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t3_z26_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt03z06
    cd ${datadDir}/combined/Migrationt03z06
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t3_z06_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt03z82
    cd ${datadDir}/combined/Migrationt03z82
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t3_z82_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt04z82
    cd ${datadDir}/combined/Migrationt04z82
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t4_z82_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt05z26
    cd ${datadDir}/combined/Migrationt05z26
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t5_z26_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt05z82
    cd ${datadDir}/combined/Migrationt05z82
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t5_z82_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt99z99
    cd ${datadDir}/combined/Migrationt99z99
    cp ${datadDir}/${savedir}/Migration/Migration2D_${playlist}_t99_z99_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt99z99Daisy
    cd ${datadDir}/combined/Migrationt99z99Daisy
    cp ${datadDir}/${savedir}/Migration/Migration2D_Daisy_${playlist}_t99_z99_sys.root .

    echo Plastic
    cd ${datadDir}/${savedir}
    mkdir -p "Plastic"
    cd "Plastic"
    echo Copy plastic files to data
    cp ${dirpwd}/PlasticBkg2D*.root .
      
    # make mkdir for combined playlists
    echo "------------------------------------"
    echo "Make mkdir for combined playlists"

    echo "Migration"
    mkdir -p ${datadDir}/combined/Plastict02z26
    cd ${datadDir}/combined/Plastict02z26
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t2_z26_sys.root .
    
    mkdir -p ${datadDir}/combined/Plastict02z82
    cd ${datadDir}/combined/Plastict02z82
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t2_z82_sys.root .
    
    mkdir -p ${datadDir}/combined/Plastict03z26
    cd ${datadDir}/combined/Plastict03z26
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t3_z26_sys.root .

    mkdir -p ${datadDir}/combined/Plastict03z06
    cd ${datadDir}/combined/Plastict03z06
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t3_z06_sys.root .

    mkdir -p ${datadDir}/combined/Plastict03z82
    cd ${datadDir}/combined/Plastict03z82
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t3_z82_sys.root .

    mkdir -p ${datadDir}/combined/Plastict04z82
    cd ${datadDir}/combined/Plastict04z82
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t4_z82_sys.root .

    mkdir -p ${datadDir}/combined/Plastict05z26
    cd ${datadDir}/combined/Plastict05z26
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t5_z26_sys.root .

    mkdir -p ${datadDir}/combined/Plastict05z82
    cd ${datadDir}/combined/Plastict05z82
    cp ${datadDir}/${savedir}/Plastic/PlasticBkg2D_${playlist}_t5_z82_sys.root .
    
    cd /minerva/app/users/anezkak/MAT_GitHub/

done

# Combine root files from different playlist 

echo Combine root files from different playlists
echo First combine backtround subtracted event rates
cd ${datadDir}/combined/

echo Check number of files
echo "CHECK THIS!! IMPORTANT"
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

echo Combine efficiencies
# Need to have it here until I fix it because using POT from bkg subtracted
# Need to combine before I combine bkg subtracted, otherwise index out of range
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z26 ${datadDir}/combined/EventSelectiont02z26/ ../Efficiency_${combinedVersion}_t2_z26_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt02z82 ${datadDir}/combined/EventSelectiont02z82/ ../Efficiency_${combinedVersion}_t2_z82_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z26 ${datadDir}/combined/EventSelectiont03z26/ ../Efficiency_${combinedVersion}_t3_z26_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z06 ${datadDir}/combined/EventSelectiont03z06/ ../Efficiency_${combinedVersion}_t3_z06_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt03z82 ${datadDir}/combined/EventSelectiont03z82/ ../Efficiency_${combinedVersion}_t3_z82_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt04z82 ${datadDir}/combined/EventSelectiont04z82/ ../Efficiency_${combinedVersion}_t4_z82_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z26 ${datadDir}/combined/EventSelectiont05z26/ ../Efficiency_${combinedVersion}_t5_z26_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt05z82 ${datadDir}/combined/EventSelectiont05z82/ ../Efficiency_${combinedVersion}_t5_z82_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99 ${datadDir}/combined/EventSelectiont99z99/ ../Efficiency_${combinedVersion}_t99_z99_sys.root
python ${scriptDir1D}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Efficiencyt99z99Daisy ${datadDir}/combined/EventSelectiont99z99Daisy/ ../Efficiency_Daisy_${combinedVersion}_t99_z99_sys.root

cd ${datadDir}/combined/

mkdir -p "Efficiency"
cd "Efficiency"
mv ${datadDir}/combined/Efficiency*.root .

echo Combine event loops
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont99z99Daisy/ ../EventSelection_daisy_${combinedVersion}_t99_z99_sys.root

python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont02z26/ ../EventSelection_${combinedVersion}_t2_z26_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont02z82/ ../EventSelection_${combinedVersion}_t2_z82_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont03z26/ ../EventSelection_${combinedVersion}_t3_z26_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont03z06/ ../EventSelection_${combinedVersion}_t3_z06_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont03z82/ ../EventSelection_${combinedVersion}_t3_z82_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont04z82/ ../EventSelection_${combinedVersion}_t4_z82_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont05z26/ ../EventSelection_${combinedVersion}_t5_z26_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont05z82/ ../EventSelection_${combinedVersion}_t5_z82_sys.root
python ${scriptDir1D}combinePlaylistHistos.py ${datadDir}/combined/EventSelectiont99z99/ ../EventSelection_${combinedVersion}_t99_z99_sys.root

cd ${datadDir}/combined/

mkdir -p "EventSelection"
cd "EventSelection"
mv ${datadDir}/combined/EventSelection*.root .

echo Combine migrations
cd ${datadDir}/combined/
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt02z26 ../Migration2D_${combinedVersion}_t2_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt02z82 ../Migration2D_${combinedVersion}_t2_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt03z26 ../Migration2D_${combinedVersion}_t3_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt03z06 ../Migration2D_${combinedVersion}_t3_z06_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt03z82 ../Migration2D_${combinedVersion}_t3_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt04z82 ../Migration2D_${combinedVersion}_t4_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt05z26 ../Migration2D_${combinedVersion}_t5_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt05z82 ../Migration2D_${combinedVersion}_t5_z82_sys.root
cd ${datadDir}/combined/
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt99z99 ../Migration2D_${combinedVersion}_t99_z99_sys.root

cd ${datadDir}/combined/Migrationt99z99Daisy
#madd ../Migration2D_Daisy_${combinedVersion}_t99_z99_sys.root Migration2D_Daisy_minervame5A_t99_z99_sys.root  Migration2D_Daisy_minervame6A_t99_z99_sys.root  Migration2D_Daisy_minervame6B_t99_z99_sys.root Migration2D_Daisy_minervame6C_t99_z99_sys.root  Migration2D_Daisy_minervame6D_t99_z99_sys.root  Migration2D_Daisy_minervame6E_t99_z99_sys.root Migration2D_Daisy_minervame6F_t99_z99_sys.root  Migration2D_Daisy_minervame6G_t99_z99_sys.root   Migration2D_Daisy_minervame6H_t99_z99_sys.root Migration2D_Daisy_minervame6I_t99_z99_sys.root  Migration2D_Daisy_minervame6J_t99_z99_sys.root
madd ../Migration2D_Daisy_${combinedVersion}_t99_z99_sys.root  Migration2D_Daisy_minervame6A_t99_z99_sys.root  Migration2D_Daisy_minervame6B_t99_z99_sys.root Migration2D_Daisy_minervame6C_t99_z99_sys.root  Migration2D_Daisy_minervame6D_t99_z99_sys.root  Migration2D_Daisy_minervame6E_t99_z99_sys.root Migration2D_Daisy_minervame6F_t99_z99_sys.root  Migration2D_Daisy_minervame6G_t99_z99_sys.root   Migration2D_Daisy_minervame6H_t99_z99_sys.root Migration2D_Daisy_minervame6I_t99_z99_sys.root  Migration2D_Daisy_minervame6J_t99_z99_sys.root

# madd <cmobined> <root files I want to combine?

#rm -r ${datadDir}/combined/Migrationt*

cd ${datadDir}/combined/

mkdir -p "Migration"
cd "Migration"
mv ${datadDir}/combined/Migration*.root .
#mv ${datadDir}/combined/*/Migration2D_Daisy_${combinedVersion}*.root .

cd ${datadDir}/combined/


echo Combine plastic
cd ${datadDir}/combined/
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict02z26 ../PlasticBkg2D_${combinedVersion}_t2_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict02z82 ../PlasticBkg2D_${combinedVersion}_t2_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict03z26 ../PlasticBkg2D_${combinedVersion}_t3_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict03z06 ../PlasticBkg2D_${combinedVersion}_t3_z06_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict03z82 ../PlasticBkg2D_${combinedVersion}_t3_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict04z82 ../PlasticBkg2D_${combinedVersion}_t4_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict05z26 ../PlasticBkg2D_${combinedVersion}_t5_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Plastict05z82 ../PlasticBkg2D_${combinedVersion}_t5_z82_sys.root

cd ${datadDir}/combined/

mkdir -p "Plastic"
cd "Plastic"
mv ${datadDir}/combined/PlasticBkg2D*.root .

#rm -r ${datadDir}/combined/Plastict*
MULTILINE-COMMENT
#<< 'MULTILINE-COMMENT'
cd ${datadDir}/combined/

echo Get Scale Factors
cd ${scriptDir}/plasticBackground2D/

./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 2 26 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t2_z26.txt
./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 3 26 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t3_z26.txt
./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 5 26 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t5_z26.txt

./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 3 6 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t3_z06.txt

./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 2 82 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t2_z82.txt
./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 3 82 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t3_z82.txt
./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 4 82 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t4_z82.txt
./getScaleFactors2D_PlasticSB ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/ 5 82 ${combinedVersion} 1 2>&1 | tee ${datadDir}/combined/Plastic/plasticScaleFactors_t5_z82.txt

cd ${datadDir}/combined/
echo Background Subtracted
mkdir -p BackgroundSubtracted
cd BackgroundSubtracted

python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 2 26 ${combinedVersion} 1
python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 3 26 ${combinedVersion} 1
python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 5 26 ${combinedVersion} 1

python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 3 06 ${combinedVersion} 1

python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 2 82 ${combinedVersion} 1
python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 3 82 ${combinedVersion} 1
python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 4 82 ${combinedVersion} 1
python ${scriptDir}/BackgroundSubtraction2D_Target_Scaled.py ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 5 82 ${combinedVersion} 1


python ${scriptDir}/BackgroundSubtraction2D_Tracker.py ${datadDir}/combined/  ${combinedVersion}
python ${scriptDir}/BackgroundSubtraction2D_Tracker_Daisy.py  ${datadDir}/combined/  ${combinedVersion}

<< 'MULTILINE-COMMENT'
echo Plot Scale Factors and Sidebands
cd ${plottingDir}
echo Untuned Sidebands
# untuned sidebands
./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 26  ${combinedVersion} 1
./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 26  ${combinedVersion} 1
./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 26  ${combinedVersion} 1

./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 6  ${combinedVersion} 1

./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 82  ${combinedVersion} 1
./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 82  ${combinedVersion} 1
./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  4 82  ${combinedVersion} 1
./plotEventSelection2D_UntunedTargetSidebands  ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 82  ${combinedVersion} 1

echo Untuned Sidebands MC error
# untuned sidebands MC error (regUS and regDS)
./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 26  ${combinedVersion} 1
./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 26  ${combinedVersion} 1
./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 26  ${combinedVersion} 1

./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 6  ${combinedVersion} 1

./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 82  ${combinedVersion} 1
./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 82  ${combinedVersion} 1
./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  4 82  ${combinedVersion} 1
./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 82  ${combinedVersion} 1

echo Scale Factor
# plot scale factor
./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 26  ${combinedVersion} 1
./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 26  ${combinedVersion} 1
./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 26  ${combinedVersion} 1

./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 6  ${combinedVersion} 1

./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 82  ${combinedVersion} 1
./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 82  ${combinedVersion} 1
./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  4 82  ${combinedVersion} 1
./plotPlasticScaleFactor2D ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 82  ${combinedVersion} 1


echo Scale Factor MC error
# plot scale factor sys error
./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 26 ${combinedVersion}
./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 26 ${combinedVersion}
./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 26 ${combinedVersion}

./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 6 ${combinedVersion}

./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 82 ${combinedVersion}
./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 82 ${combinedVersion}
./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  4 82 ${combinedVersion}
./plotFractionalError2D_ScaleFactor ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 82 ${combinedVersion}


echo Tuned Sidebands
# tuned sidebands
./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 26 ${combinedVersion} 1
./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 26 ${combinedVersion} 1
./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 26 ${combinedVersion} 1

./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 6 ${combinedVersion} 1

./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 82 ${combinedVersion} 1
./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 82 ${combinedVersion} 1
./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  4 82 ${combinedVersion} 1
./plotEventSelection2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 82 ${combinedVersion} 1

echo Tuned Sidebands MC error
# tuned sidebands MC error (regUS and regDS)
./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 26 ${combinedVersion}
./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 26 ${combinedVersion}
./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 26 ${combinedVersion}

./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 6 ${combinedVersion}

./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  2 82 ${combinedVersion}
./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  3 82 ${combinedVersion}
./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  4 82 ${combinedVersion}
./plotFractionalError2D_TunedTargetSidebands ${datadDir}/combined/Plastic/ ${datadDir}/combined/Plastic/  5 82 ${combinedVersion}

# PLOTTING combined stuff

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

echo Plot Event Loop with intType breakdown plots
cd ${plottingDir}
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 26 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 2 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 26 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 06 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 3 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 4 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 26 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 5 82 ${combinedVersion} 1
./plotEventSelection2D_intType ${datadDir}/combined/EventSelection ${datadDir}/combined/EventSelection 99 99 ${combinedVersion} 1

echo Plot Event Loop Fractional Error plots
cd ${plottingDir}
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

echo Plot Event Loop w/ Scaled Plastic
cd ${plottingDir}
./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 2 26 ${combinedVersion} 1
./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 3 26 ${combinedVersion} 1
./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 5 26 ${combinedVersion} 1

./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 3 6 ${combinedVersion} 1

./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 2 82 ${combinedVersion} 1
./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 3 82 ${combinedVersion} 1
./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 4 82 ${combinedVersion} 1
./plotEventSelection2D_Target_ScaledPlastic ${datadDir}/combined/EventSelection ${datadDir}/combined/Plastic 5 82 ${combinedVersion} 1

cd ${datadDir}/combined/

echo Plot Background Subtracted Event Selections
cd "BackgroundSubtracted"
cd ${plottingDir}
echo Plot Background Subtracted Event Selections Targets
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1

./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1

./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 6 ${combinedVersion} 1

echo Plot Background Subtracted Event Selections Targets
./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1

./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1

./plotBkgSubtracted2D_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 6 ${combinedVersion} 1

echo Plot Background Subtracted Event Selections Tracker
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1
#MULTILINE-COMMENT
echo Plot Fractional Errors Background Subtracted Event Selections
echo Data
cd ${plottingDir}
./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 06 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedData ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1

echo Data - not constrained
./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedData_NotConstrained ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 06 ${combinedVersion} 1

echo MC
./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedMC  ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 06 ${combinedVersion} 1

./plotFractionalError2D_BkgSubtractedMC ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1

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
./plotEfficiencyNumDenom ${datadDir}/combined/Efficiency ${datadDir}/combined/Efficiency 99 99 ${combinedVersion} 1
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

echo Migration plots
cd ${datadDir}/combined/Migration
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 2 26 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 2 82 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 3 26 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 3 06 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 3 82 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 4 82 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 5 26 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 5 82 ${combinedVersion} 
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}/combined/Migration 99 99 ${combinedVersion} 

echo Migration Tracker Daisy
cd ${datadDir}/combined/Migration
python ${plottingDir}plotDaisyMigrationMatrix2D.py ${datadDir}/combined/Migration ${combinedVersion} 

MULTILINE-COMMENT
echo Extract Cross-Section
cd ${scriptDir}
echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection2D ${datadDir}/combined/ 26 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont235z26.txt
./extractCrossSection2D ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont3z06.txt
./extractCrossSection2D ${datadDir}/combined/ 82 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont2345z82.txt
echo Tracker Cross-section Extraction
./extractCrossSection2D ${datadDir}/combined/ 99 ${combinedVersion} 99 true | tee ${datadDir}/combined/cross-sectiont99z99.txt

echo Daisy Tracker Cross-section Extraction
cd ${scriptDir}
./extractCrossSection2D_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont99z99Daisy.txt

echo Plot Cross-Section
cd ${plottingDir}
./plotCrossSection2D ${datadDir}/combined  ${datadDir}/combined/ 235 26 ${combinedVersion} 
./plotCrossSection2D ${datadDir}/combined  ${datadDir}/combined/ 2345 82 ${combinedVersion} 
./plotCrossSection2D ${datadDir}/combined  ${datadDir}/combined/ 3 06 ${combinedVersion}
./plotCrossSection2D ${datadDir}/combined  ${datadDir}/combined/ 99 99 ${combinedVersion} 


echo Plot Cross-Section Daisy
cd ${plottingDir}
./plotDaisyCrossSection2D ${datadDir}/combined ${datadDir}/combined carbon ${combinedVersion}  
./plotDaisyCrossSection2D ${datadDir}/combined ${datadDir}/combined iron ${combinedVersion}  
./plotDaisyCrossSection2D ${datadDir}/combined ${datadDir}/combined lead ${combinedVersion}  


echo Plot Cross-Section Fractional Error
cd ${plottingDir}
./plotFractionalError2D_CrossSection ${datadDir}/combined  ${datadDir}/combined/ 235 26 ${combinedVersion} 
./plotFractionalError2D_CrossSection ${datadDir}/combined  ${datadDir}/combined/ 2345 82 ${combinedVersion} 
./plotFractionalError2D_CrossSection ${datadDir}/combined  ${datadDir}/combined/ 3 06 ${combinedVersion}
./plotFractionalError2D_CrossSection ${datadDir}/combined  ${datadDir}/combined/ 99 99 ${combinedVersion} 

echo Plot Cross-Section Ratios
cd ${plottingDir}
./plotDaisyCrossSection_ratios ${datadDir}/combined ${datadDir}/combined ${combinedVersion} 

./plotDaisyCrossSection_ratios_separate ${datadDir}/combined ${datadDir}/combined carbon ${combinedVersion}
./plotDaisyCrossSection_ratios_separate ${datadDir}/combined ${datadDir}/combined iron ${combinedVersion}  
./plotDaisyCrossSection_ratios_separate ${datadDir}/combined ${datadDir}/combined lead ${combinedVersion} 

echo Plot Cross-Section Ratios Fractional Uncertainty
cd ${plottingDir}
./plotFractionalError2D_CrossSectionRatio ${datadDir}/combined ${datadDir}/combined 235 26 ${combinedVersion} 
./plotFractionalError2D_CrossSectionRatio ${datadDir}/combined ${datadDir}/combined 2345 82 ${combinedVersion} 
./plotFractionalError2D_CrossSectionRatio ${datadDir}/combined ${datadDir}/combined 3 06 ${combinedVersion} 


echo Plot Unfolded
cd ${plottingDir}
./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 235 2 26 ${combinedVersion}
./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 235 3 26 ${combinedVersion}
./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 235 5 26 ${combinedVersion}

./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 2345 2 82 ${combinedVersion}
./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 2345 3 82 ${combinedVersion}
./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 2345 4 82 ${combinedVersion}
./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 2345 5 82 ${combinedVersion}

./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 3 3 6 ${combinedVersion}

./plotUnfolded2D ${datadDir}/combined/ ${datadDir}/combined 99 99 99 ${combinedVersion}



echo Plot Unfolded Eff Corrected
cd ${plottingDir}
./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 235 2 26 ${combinedVersion}
./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 235 3 26 ${combinedVersion}
./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 235 5 26 ${combinedVersion}

./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 2345 2 82 ${combinedVersion}
./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 2345 3 82 ${combinedVersion}
./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 2345 4 82 ${combinedVersion}
./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 2345 5 82 ${combinedVersion}

./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 3 3 6 ${combinedVersion}

./plotUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 99 99 99 ${combinedVersion}

echo Plot Total Unfolded Eff Corrected
cd ${plottingDir}

./plotTotalUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 235 26 ${combinedVersion}
./plotTotalUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 2345 82 ${combinedVersion}
./plotTotalUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 3 6 ${combinedVersion}
./plotTotalUnfoldedEffCorrected2D ${datadDir}/combined/ ${datadDir}/combined 99 99 ${combinedVersion}

echo Plot Total Unfolded Eff Corrected Fractional Uncertainty
cd ${plottingDir}
./plotFractionalError2D_TotalUnfoldedEffCorrected ${datadDir}/combined  ${datadDir}/combined/ 235 26 ${combinedVersion} 
./plotFractionalError2D_TotalUnfoldedEffCorrected ${datadDir}/combined  ${datadDir}/combined/ 2345 82 ${combinedVersion} 
./plotFractionalError2D_TotalUnfoldedEffCorrected ${datadDir}/combined  ${datadDir}/combined/ 3 06 ${combinedVersion}
./plotFractionalError2D_TotalUnfoldedEffCorrected ${datadDir}/combined  ${datadDir}/combined/ 99 99 ${combinedVersion} 

echo Plot Unfolded Eff Corrected Fractional Error
cd ${plottingDir}
./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 235 2 26 ${combinedVersion}
./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 235 3 26 ${combinedVersion}
./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 235 5 26 ${combinedVersion}

./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 2345 2 82 ${combinedVersion}
./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 2345 3 82 ${combinedVersion}
./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 2345 4 82 ${combinedVersion}
./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 2345 5 82 ${combinedVersion}

./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 3 3 6 ${combinedVersion}

./plotFractionalError2D_UnfoldedEffCorrected ${datadDir}/combined/ ${datadDir}/combined 99 99 99 ${combinedVersion}

echo Plot Unfolded Fractional Error
cd ${plottingDir}
./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 235 2 26 ${combinedVersion}
./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 235 3 26 ${combinedVersion}
./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 235 5 26 ${combinedVersion}

./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 2345 2 82 ${combinedVersion}
./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 2345 3 82 ${combinedVersion}
./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 2345 4 82 ${combinedVersion}
./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 2345 5 82 ${combinedVersion}

./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 3 3 6 ${combinedVersion}

./plotFractionalError2D_Unfolded ${datadDir}/combined/ ${datadDir}/combined 99 99 99 ${combinedVersion}

cd /minerva/app/users/anezkak/MAT_GitHub/

