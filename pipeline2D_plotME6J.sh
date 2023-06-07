#!/bin/bash
now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/panel_plottingConcise/
#datadDir=/minerva/data/users/anezkak/${now}/2D/
datadDir=/minerva/data/users/anezkak/${now}/2D/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/
dirpwd=/pnfs/minerva/persistent/users/anezkak/1D/minervame5A

mkdir -p ${datadDir}

dirpwd2D=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists2D/

cd ${dirpwd}
cd ${datadDir}

playlist="minervame5A"
savedir="combined"
mkdir -p ${savedir} && cd ${savedir}
pwd
#: '
echo Event Loop with bkg breakdown plots
cd ${datadDir}${savedir}/

mkdir -p "EventSelection"
cd "EventSelection"
cp ${dirpwd}/Event*.root .
cd ${plottingDir}
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 2 26 ${playlist} 0
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 2 82 ${playlist} 0
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 3 26 ${playlist} 0
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 3 06 ${playlist} 0
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 3 82 ${playlist} 0
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 4 82 ${playlist} 0
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 5 26 ${playlist} 0
./plotEventSelection2D_Target ${dirpwd} ${datadDir}${savedir}/EventSelection 5 82 ${playlist} 0
./plotEventSelection2D_Tracker ${dirpwd} ${datadDir}${savedir}/EventSelection 99 99 ${playlist} 0
./plotDaisyEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventSelection ${playlist} 

echo Event Loop with intType breakdown plots
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 2 26 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 2 82 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 3 26 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 3 06 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 3 82 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 4 82 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 5 26 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 5 82 ${playlist} 0
./plotEventSelection2D_intType ${dirpwd} ${datadDir}${savedir}/EventSelection 99 99 ${playlist} 0

echo Event Loop Fractional Error plots
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 2 26 ${playlist}
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 2 82 ${playlist}
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 3 26 ${playlist}
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 3 06 ${playlist}
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 3 82 ${playlist} 
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 4 82 ${playlist} 
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 5 26 ${playlist} 
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 5 82 ${playlist} 
./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection 99 99 ${playlist} 
./plotDaisyFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventSelection ${playlist} 
: '
echo Migration
cd ${datadDir}${savedir}/
mkdir -p "Migration"
cd "Migration"
cp ${dirpwd}/Migration*.root .
#echo Copy migration files to data
#cp ${dirpwd2D}/Migration*.root .
echo Migration plots

python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 2 26 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 2 82 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 3 26 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 3 06 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 3 82 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 4 82 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 5 26 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 5 82 ${playlist}
python ${plottingDir}plotMigrationMatrix2D.py ${datadDir}${savedir}/Migration 99 99 ${playlist}
echo Migration Tracker Daisy
python ${plottingDir}plotDaisyMigrationMatrix2D.py ${datadDir}${savedir}/Migration ${playlist}

echo Efficiency Numerator Denominator plots
cd ${datadDir}${savedir}/
mkdir -p "Efficiency"
cd "Efficiency"
cp ${dirpwd}/Efficiency*.root .
cd ${plottingDir}
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 2 26 ${playlist} 0
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 2 82 ${playlist} 0
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 3 26 ${playlist} 0
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 3 06 ${playlist} 0
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 3 82 ${playlist} 0
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 4 82 ${playlist} 0
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 5 26 ${playlist} 0
./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 5 82 ${playlist} 0
./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 99 99 ${playlist} 0
./plotDaisyEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency ${playlist} 0  

echo Efficiency
cd ${datadDir}${savedir}/Efficiency
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 2 26 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 2 82 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 3 26 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 3 06 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 3 82 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 4 82 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 5 26 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 5 82 ${playlist} 
python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 99 99 ${playlist} 
python ${plottingDir}/plotDaisyEfficiency2D.py ${dirpwd} ${playlist} 

echo Plastic sidebands Scale Factors
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t2_z26.txt
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t2_z82.txt
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z26.txt
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z06.txt
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z82.txt
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t4_z82.txt
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t5_z26.txt
#./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t5_z82.txt

echo Plot Scale Factors
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t2_z26.txt
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t2_z82.txt
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t3_z26.txt
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t3_z06.txt
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t3_z82.txt
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t4_z82.txt
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t5_z26.txt
#python ${plottingDir}printScaleFactors.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t5_z82.txt

echo Plot Untuned And Tuned Plastic Sidebands
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} 
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} 
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} 
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} 
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} 
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} 
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} 
#python ${plottingDir}plotbkgStack+ratio_sidebands.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} 

#echo Background Subtraction Targets

cd ${datadDir}/${savedir}
mkdir -p "BackgroundSubtracted"
cd "BackgroundSubtracted"
# TARGETS not Ready
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist}
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} 
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist}
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist}
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} 
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist}
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist}
#python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} 

echo Background Subtraction Tracker
python ${scriptDir}BackgroundSubtraction2D_Tracker.py ${datadDir}${savedir} ${playlist} 

echo Background Subtraction Tracker Daisy
python ${scriptDir}BackgroundSubtraction2D_Tracker_Daisy.py ${datadDir}${savedir} ${playlist} 

cd ${plottingDir}
echo Plot Background Subtracted Event Selections Tracker
./plotBkgSubtracted2D ${datadDir}${savedir}/BackgroundSubtracted ${datadDir}${savedir}/BackgroundSubtracted 99 99 ${playlist} 0

echo Plot Fractional Errors Background Subtracted Event Selections
echo Data
./plotFractionalError2D_BkgSubtractedData ${datadDir}${savedir}/BackgroundSubtracted ${datadDir}${savedir}/BackgroundSubtracted 99 99 ${playlist} 

echo MC
./plotFractionalError2D_BkgSubtractedMC ${datadDir}${savedir}/BackgroundSubtracted ${datadDir}${savedir}/BackgroundSubtracted 99 99 ${playlist} 

echo Plot Background Subtracted Event Selections Tracker Daisy
./plotDaisyBkgSubtracted2D ${datadDir}${savedir}/BackgroundSubtracted ${datadDir}${savedir}/BackgroundSubtracted ${playlist} 0


echo Target Cross-section Extraction
#./extractCrossSection.cxx  ${datadDir}/${savedir} 26 235
#./extractCrossSection.cxx ${datadDir}/${savedir} 06 3
#./extractCrossSection.cxx ${datadDir}/${savedir} 82 2345
: '

cd /minerva/app/users/anezkak/MAT_GitHub/
#cd /minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting
