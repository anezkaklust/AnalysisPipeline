#!/bin/bash

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data2/users/anezkak/2023/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

# for all playlists
#for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
for playlist in minervame6A
do
    dirpwd=/pnfs/minerva/persistent/users/anezkak/${playlist}/
    cd ${dirpwd}
    #cp */*.root . 
    cd ${datadDir}
    savedir="${now}_${playlist}"
    mkdir -p ${savedir} && cd ${savedir}
    pwd

    echo Event Loop
    mkdir -p "EventLoop"
    cd "EventLoop"
    #echo Copy event loop root files to data2
    #cp ${dirpwd}/EventSelection*.root .
    echo Event Loop plots
    #python ${plottingDir}plotCVError.py ${dirpwd} 2 26 ${playlist}
    #python ${plottingDir}plotCVError.py ${dirpwd} 2 82 ${playlist} 
    #python ${plottingDir}plotCVError.py ${dirpwd} 3 26 ${playlist} 
    #python ${plottingDir}plotCVError.py ${dirpwd} 3 06 ${playlist} 
    #python ${plottingDir}plotCVError.py ${dirpwd} 3 82 ${playlist} 
    #python ${plottingDir}plotCVError.py ${dirpwd} 4 82 ${playlist} 
    #python ${plottingDir}plotCVError.py ${dirpwd} 5 26 ${playlist} 
    #python ${plottingDir}plotCVError.py ${dirpwd} 5 82 ${playlist} 
    #python ${plottingDir}plotCVError.py ${dirpwd} 99 99 ${playlist} 

    echo Background breakdown Targets
    # Doesn't work right now, not all bkgs are mnvh1ds - some are sbs
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 2 26 ${playlist}
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 2 82 ${playlist} 
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 3 26 ${playlist} 
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 3 06 ${playlist} 
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 3 82 ${playlist} 
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 4 82 ${playlist} 
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 5 26 ${playlist} 
    #python ${plottingDir}plotStackedBkg_target.py ${dirpwd} 5 82 ${playlist}

    echo Background breakdown Tracker
    # Doesn't work right now, not all bkgs are mnvh1ds -  sbs
    #python ${plottingDir}plotStackedBkg_tracker.py ${dirpwd} ${playlist}

    echo Event Loop Tracker Daisy
    #python ${plottingDir}plotDaisyDistrib.py ${dirpwd} ${playlist} 
    #python ${plottingDir}plotDaisyDistrib_withBkg.py ${dirpwd} ${playlist} 
    cd ..



    echo Migration
    mkdir -p "Migration"
    cd "Migration"
    #echo Copy migration files to data2
    #cp ${dirpwd}/Migration*.root .
    echo Migration plots
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 2 26 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 2 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 3 26 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 3 06 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 3 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 4 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 5 26 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 5 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${dirpwd} 99 99 ${playlist}

    echo Migration Tracker Daisy
    #python ${plottingDir}plotDaisyMigrationMatrix.py ${dirpwd} ${playlist} 
    cd ..

    echo Efficiency plots
    mkdir -p "Efficiency"
    cd "Efficiency"
    #echo Copy efficiency files to data2
    #cp ${dirpwd}/Efficiency*.root .
    echo Efficiency plots
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 2 26 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 2 82 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 3 26 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 3 06 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 3 82 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 4 82 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 5 26 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 5 82 ${playlist}
    #python ${plottingDir}plotEfficiency.py ${dirpwd} 99 99 ${playlist}

    echo Efficiency Tracker Daisy
    #python ${plottingDir}plotDaisyEfficiency.py ${dirpwd} ${playlist} 

    cd ..

    echo Plastic sidebands Scale Factors
    mkdir -p "PlastisSidebands"
    cd "PlastisSidebands"
    cd ${scaleFacDir}
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t2_z26.txt
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t2_z82.txt
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z26.txt
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z06.txt
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t3_z82.txt
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t4_z82.txt
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t5_z26.txt
    #./getScaleFactors_PlasticSB ${dirpwd}/ ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/plasticSidebands_t5_z82.txt
    
    echo Plot Scale Factors
    cd ${datadDir}/${savedir}/PlastisSidebands
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
    cd ..
    
    echo Background Subtraction Targets
    mkdir -p "BackgroundSubtracted"
    cd "BackgroundSubtracted"
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} 
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} 
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist}
    #python ${scriptDir}BackgroundSubtraction.py ${dirpwd} ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} 
    
    echo Background Subtraction Tracker
    #python ${scriptDir}BackgroundSubtraction_Tracker.py ${dirpwd} ${playlist} 

    echo Background Subtraction Tracker Daisy
    #python ${scriptDir}BackgroundSubtraction_Tracker_Daisy.py ${dirpwd} ${playlist}

    echo Plot Background Subtracted Event Selections
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 26 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 82 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 26 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 06 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 82 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 4 82 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 26 ${playlist} 
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 82 ${playlist} 
    
    echo Plot Background Subtracted Event Selection Tracker
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 99 99 ${playlist} 
     
    echo Plot Background Subtracted Event Selection Tracker Daisy 
    #python ${plottingDir}plotDaisyDistrib_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted ${playlist} 

    cd ..

    echo Target Cross-section Extraction
    cd ${scriptDir}
    #./extractCrossSection ${datadDir}/${savedir} 26 | tee ${datadDir}/${savedir}/cross-sectiont235z26.txt
    #./extractCrossSection  ${datadDir}/${savedir} 6 | tee ${datadDir}/${savedir}/cross-sectiont3z06.txt
    #./extractCrossSection ${datadDir}/${savedir} 82 | tee ${datadDir}/${savedir}/cross-sectiont2345z82.txt
    echo Tracker Cross-section Extraction
    #./extractCrossSection ${datadDir}/${savedir} 99 99 | tee ${datadDir}/${savedir}/cross-sectiont99z99.txt


    echo Daisy Tracker Cross-section Extraction
    #./extractCrossSection_tracker_daisy ${datadDir}/${savedir} 99 99 | tee ${datadDir}/${savedir}/cross-sectiont99z99Daisy.txt
    
    echo Plot Target Cross-section
    cd ${datadDir}/${savedir}
    python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 235 26 ${playlist} 
    python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 3 06 ${playlist} 
    python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 2345 82 ${playlist} 

    echo Plot Tracker Daisy Cross-section
    python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/${savedir} ${playlist} 

    echo Plot Daisy Target/Tracker Ratios
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 26 ${playlist} 1
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 06 ${playlist} 1
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 82 ${playlist} 1

    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 26 ${playlist} 0
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 06 ${playlist} 0
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 82 ${playlist} 0
    
    cd /minerva/app/users/anezkak/MAT_GitHub/
    #cd /minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting
done