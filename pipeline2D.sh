#!/bin/bash
now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/panel_plottingConcise/
#datadDir=/minerva/data/users/anezkak/${now}/2D/
datadDir=/minerva/data/users/anezkak/02-02-2023/2D/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

mkdir -p ${datadDir}

# for all playlists
#for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
for playlist in minervame6A
do
    dirpwd=/pnfs/minerva/persistent/users/anezkak/1D/${playlist}/
    dirpwd2D=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists2D/
    cd ${dirpwd}
    #cp */*.root . 
    cd ${datadDir}
    savedir="${playlist}"
    mkdir -p ${savedir} && cd ${savedir}
    pwd
    #: '
    echo Event Loop plots
    cd ${datadDir}${savedir}/
    mkdir -p "EventLoop"
    cd "EventLoop"
    cd ${plottingDir}
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 2 26 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 2 82 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 3 26 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 3 06 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 3 82 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 4 82 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 5 26 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 5 82 ${playlist} 
    #./plotEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop 99 99 ${playlist} 
    #./plotDaisyEventSelection2D ${dirpwd} ${datadDir}${savedir}/EventLoop ${playlist} 
    
    echo Event Loop Fractional Error plots
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 2 26 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 2 82 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 3 26 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 3 06 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 3 82 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 4 82 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 5 26 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 5 82 ${playlist} 
    #./plotFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop 99 99 ${playlist} 
    #./plotDaisyFractionalError2D ${dirpwd} ${datadDir}${savedir}/EventLoop ${playlist} 
    
    #'
    echo Migration
    cd ${datadDir}${savedir}/
    mkdir -p "Migration"
    cd "Migration"
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
    cd ${plottingDir}
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 2 26 ${playlist} 
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 2 82 ${playlist} 
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 3 26 ${playlist} 
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 3 06 ${playlist}
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 3 82 ${playlist}
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 4 82 ${playlist} 
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 5 26 ${playlist}
    #./plotEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency 5 82 ${playlist} 
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 99 99 ${playlist} 
    #./plotDaisyEfficiencyNumDenom2D ${dirpwd} ${datadDir}${savedir}/Efficiency ${playlist}    
   
    echo Efficiency
    cd ${datadDir}${savedir}/Efficiency
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 2 26 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 2 82 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 3 26 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 3 06 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 3 82 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 4 82 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 5 26 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 5 82 ${playlist} 
    #python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 99 99 ${playlist} 
    #python ${plottingDir}/plotDaisyEfficiency2D.py ${dirpwd} ${playlist} 
    
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
    
    echo Background Subtraction Targets
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} 
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} 
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist}  

    echo Plot Background Subtracted Event Selections
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 26 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 82 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 26 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 06 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 82 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 4 82 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 26 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 82 ${playlist} 

    echo Target Cross-section Extraction
    #./extractCrossSection.cxx  ${datadDir}/${savedir} 26 235
    #./extractCrossSection.cxx ${datadDir}/${savedir} 06 3
    #./extractCrossSection.cxx ${datadDir}/${savedir} 82 2345



    cd /minerva/app/users/anezkak/MAT_GitHub/
    #cd /minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting
done