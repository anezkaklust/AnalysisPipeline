#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/panel_plottingConcise/
datadDir=/minerva/data/users/anezkak/06-06-2023_v1-nonrespi/2D/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists2D/
anaDir1D=/minerva/data/users/anezkak/06-05-2023_v1-nonrespi/1D/combined/
migrationDir=/pnfs/minerva/persistent/users/anezkak/2D_v1-nonrespi/

# How many files do we have?
cd ${migrationDir}
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
<< 'MULTILINE-COMMENT'
mkdir -p ${datadDir}
cd ${datadDir}
mkdir -p combined

cd ${datadDir}/combined/
echo Event Selection
mkdir -p EventSelection
cd EventSelection
cp ${anaDir1D}/EventSelection/*.root .

cd ${datadDir}/combined/

echo Efficiency
mkdir -p Efficiency
cd Efficiency
cp ${anaDir1D}/Efficiency/*.root .

cd ${datadDir}/combined/

echo Background Subtracted
mkdir -p BackgroundSubtracted
cd BackgroundSubtracted

python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 2 26 ${combinedVersion} 
python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 2 82 ${combinedVersion} 
python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 3 06 ${combinedVersion} 
python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 3 26 ${combinedVersion} 
python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 3 82 ${combinedVersion} 
python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 4 82 ${combinedVersion} 
python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 5 26 ${combinedVersion}  
python ${scriptDir}/BackgroundSubtraction2D_Target.py ${datadDir}/combined/ 5 82 ${combinedVersion} 

python ${scriptDir}/BackgroundSubtraction2D_Tracker.py ${datadDir}/combined/  ${combinedVersion}
python ${scriptDir}/BackgroundSubtraction2D_Tracker_Daisy.py  ${datadDir}/combined/  ${combinedVersion}

cd ${datadDir}

echo Migration

for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
do
    dirpwd=${migrationDir}/${playlist}/
    cd ${dirpwd}
    cp migration*/*.root .
    rm -r migration*/

    cd ${datadDir}
    savedir="${playlist}"
    mkdir -p ${savedir} && cd ${savedir}
    pwd

    echo Working on this ${playlist}

    echo Migration
    cd ${datadDir}/${savedir}
    mkdir -p "Migration"
    cd "Migration"
    echo Copy migration files to data
    cp ${dirpwd}/Migration*.root .
      
    cd /minerva/app/users/anezkak/MAT_GitHub/

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
    
    cd /minerva/app/users/anezkak/MAT_GitHub/

done

# Combine root files from different playlist 

echo Combine root files from different playlists
echo First combine backtround subtracted event rates
cd ${datadDir}/combined/

echo Check number of files
echo "CHECK THIS!! IMPORTANT"
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

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
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt99z99 Migration_${combinedVersion}_t99_z99_sys.root

echo Combine migrations
cd ${datadDir}/combined/

#rm -r ${datadDir}/combined/Migrationt*

cd ${datadDir}/combined/

mkdir -p "Migration"
cd "Migration"
mv ${datadDir}/combined/Migration2D_${combinedVersion}*.root .
mv ${datadDir}/combined/Migration2D_Daisy_${combinedVersion}*.root .
MULTILINE-COMMENT
cd ${datadDir}/combined/
MULTILINE-COMMENT
# PLOTTING combined stuff
# Combine root files from different playlist 
<< 'MULTILINE-COMMENT'


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
echo Plot Background Subtracted Event Selections Targets w/o plastic sideband
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 26 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 26 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 26 ${combinedVersion} 1

./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 2 82 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 82 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 4 82 ${combinedVersion} 1
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 5 82 ${combinedVersion} 1

./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 3 6 ${combinedVersion} 1

echo Plot Background Subtracted Event Selections Tracker
./plotBkgSubtracted2D ${datadDir}/combined/BackgroundSubtracted ${datadDir}/combined/BackgroundSubtracted 99 99 ${combinedVersion} 1
MULTILINE-COMMENT
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
<< 'MULTILINE-COMMENT'
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

MULTILINE-COMMENT
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

