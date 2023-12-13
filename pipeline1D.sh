#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
#datadDir=/minerva/data/users/anezkak/${now}/1D/
datadDir=/minerva/data/users/anezkak/02-02-2023/1D/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

mkdir -p ${datadDir}

# How many files do we have?
cd /pnfs/minerva/persistent/users/anezkak/1D
du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6ABDGI"
# for all playlists
for playlist in minervame5A minervame6A minervame6B minervame6D minervame6G minervame6I 
#for playlist in minervame6A
#for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
do
    dirpwd=/pnfs/minerva/persistent/users/anezkak/1D/${playlist}/
    cd ${dirpwd}
    cp eventloopt*/*.root .
    cp migration*/*.root .
    cp efficiency*/*.root .
    cp plastic*/*.root .
    # clean up the directories from the grid submissions
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
    mkdir -p "EventSelection"
    cd "EventSelection"
    echo Copy event loop root files to data
    cp ${dirpwd}/EventSelection*.root .
    

    ##############################################################################################
    ################################### PLOTTING #################################################
    ##############################################################################################
    echo Event Loop plots
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 2 26 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 2 82 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 3 26 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 3 06 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 3 82 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 4 82 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 5 26 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 5 82 ${playlist} 0
    python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 99 99 ${playlist} 0
    echo Background breakdown Targets
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 2 26 ${playlist} 0
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 2 82 ${playlist} 0 
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 3 26 ${playlist} 0
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 3 06 ${playlist} 0
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 3 82 ${playlist} 0
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 4 82 ${playlist} 0
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 5 26 ${playlist} 0
    python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 5 82 ${playlist} 0
    echo Background breakdown Tracker
    python ${plottingDir}plotStackedBkg_tracker.py ${datadDir}/${savedir}/EventSelection/ ${playlist} 0
    echo Event Loop Tracker Daisy
    python ${plottingDir}plotDaisyDistrib.py ${datadDir}/${savedir}/EventSelection/ ${playlist} 0
    python ${plottingDir}plotDaisyDistrib_withBkg.py ${datadDir}/${savedir}/EventSelection/ ${playlist} 0
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################     


    echo Migration
    cd ${datadDir}/${savedir}
    mkdir -p "Migration"
    cd "Migration"
    echo Copy migration files to data
    cp ${dirpwd}/Migration*.root .
    echo Migration plots
      

    ##############################################################################################
    ##################################### PLOTTING ###############################################
    ##############################################################################################
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 2 26 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 2 82 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 3 26 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 3 06 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 3 82 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 4 82 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 5 26 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 5 82 ${playlist}
    python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 99 99 ${playlist}
    echo Migration Tracker Daisy
    python ${plottingDir}plotDaisyMigrationMatrix.py ${datadDir}/${savedir}/Migration/ ${playlist} 
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################


    echo Efficiency plots
    cd ${datadDir}/${savedir}
    mkdir -p "Efficiency"
    cd "Efficiency"
    echo Copy efficiency files to data
    cp ${dirpwd}/Efficiency*.root .
    echo Efficiency plots

      
    ##############################################################################################
    ##################################### PLOTTING ###############################################
    ##############################################################################################
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 2 26 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 2 82 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 3 26 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 3 06 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 3 82 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 4 82 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 5 26 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 5 82 ${playlist} 0
    python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 99 99 ${playlist} 0
    echo Efficiency Tracker Daisy
    python ${plottingDir}plotDaisyEfficiency.py ${datadDir}/${savedir}/Efficiency/ ${playlist} 0
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################
  

    echo Plastic sidebands Scale Factors
    cd ${datadDir}/${savedir}
    mkdir -p "PlasticSidebands"
    cd "PlasticSidebands"
    cp ${dirpwd}/PlasticBkg*.root .
    cd ${scaleFacDir}
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 26 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t2_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t2_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 26 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t3_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 06 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t3_z06.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t3_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 4 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t4_z82.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 26 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t5_z26.txt
    ./getScaleFactors_PlasticSB ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/plasticSidebands_t5_z82.txt
    
    
    ##############################################################################################
    ##################################### PLOTTING ###############################################
    ##############################################################################################
    echo Plot Scale Factors
    cd ${datadDir}/${savedir}/PlasticSidebands
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 26 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t2_z26.txt
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t2_z82.txt
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 26 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t3_z26.txt
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 06 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t3_z06.txt
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t3_z82.txt
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 4 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t4_z82.txt
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 26 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t5_z26.txt
    python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 82 ${playlist} | tee ${datadDir}/${savedir}/PlasticSidebands/scaleFactors_t5_z82.txt
    echo Plot Untuned And Tuned Plastic Sidebands
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 26 ${playlist} 
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 2 82 ${playlist} 
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 26 ${playlist} 
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 06 ${playlist} 
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 3 82 ${playlist} 
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 4 82 ${playlist} 
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 26 ${playlist} 
    python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlasticSidebands/ ${datadDir}/${savedir}/PlasticSidebands 5 82 ${playlist} 
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################


    echo Background Subtraction Targets
    cd ${datadDir}/${savedir}
    mkdir -p "BackgroundSubtracted"
    cd "BackgroundSubtracted"
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 2 26 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 2 82 ${playlist} 
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 3 26 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 3 06 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 3 82 ${playlist} 
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 4 82 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 5 26 ${playlist}
    python ${scriptDir}BackgroundSubtraction.py ${datadDir}/${savedir} ${datadDir}/${savedir}/PlasticSidebands 5 82 ${playlist} 
    
    echo Background Subtraction Tracker
    python ${scriptDir}BackgroundSubtraction_Tracker.py ${datadDir}/${savedir} ${playlist} 

    echo Background Subtraction Tracker Daisy
    python ${scriptDir}BackgroundSubtraction_Tracker_Daisy.py ${datadDir}/${savedir} ${playlist}

   
    ##############################################################################################
    ##################################### PLOTTING ###############################################
    ##############################################################################################
    echo Plot Background Subtracted Event Selections
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 26 ${playlist} 0
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 82 ${playlist} 0
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 26 ${playlist} 0
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 06 ${playlist} 0
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 82 ${playlist} 0
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 4 82 ${playlist} 0
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 26 ${playlist} 0
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 82 ${playlist} 0
    echo Plot Background Subtracted Event Selection Tracker
    python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 99 99 ${playlist} 0
    echo Plot Background Subtracted Event Selection Tracker Daisy 
    python ${plottingDir}plotDaisyDistrib_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted ${playlist} 0
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################


    
    ##############################################################################################
    ############################# Single playlist cross-section ##################################
    ##############################################################################################

    echo Target Cross-section Extraction
    cd ${scriptDir}
    ./extractCrossSection ${datadDir}/${savedir} 26 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont235z26.txt
    ./extractCrossSection  ${datadDir}/${savedir} 6 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont3z06.txt
    ./extractCrossSection ${datadDir}/${savedir} 82 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont2345z82.txt
    
    echo Tracker Cross-section Extraction
    ./extractCrossSection ${datadDir}/${savedir} 99 ${playlist} 99 true | tee ${datadDir}/${savedir}/cross-sectiont99z99.txt

    echo Daisy Tracker Cross-section Extraction
    ./extractCrossSection_tracker_daisy ${datadDir}/${savedir} 99 99 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont99z99Daisy.txt
    
    echo Plot Target Cross-section
    cd ${datadDir}/${savedir}
    python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 235 26 ${playlist} 0
    python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 3 06 ${playlist} 0
    python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 2345 82 ${playlist} 0
    
    echo Plot Tracker Cross-section
    python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 99 99 ${playlist} 0

    echo Plot Tracker Daisy Cross-section
    python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/${savedir} ${playlist} 0

    echo Plot Daisy Target/Tracker Ratios
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 26 ${playlist} 1
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 06 ${playlist} 1
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 82 ${playlist} 1

    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 26 ${playlist} 0
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 06 ${playlist} 0
    python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 82 ${playlist} 0

    echo Plot Non-Daisy Target/Tracker Ratios
    python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 26 ${playlist} 1
    python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 06 ${playlist} 1
    python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 82 ${playlist} 1

    # plot ratios with intType
    python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 26 ${playlist} 0
    python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 06 ${playlist} 0
    python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 82 ${playlist} 0


    ##############################################################################################
    ######################## End of single playlist cross-section ################################
    ##############################################################################################

    ##############################################################################################
    ############### Move to dirs per playlist in which we combine stuff ##########################
    ##############################################################################################

    cd /minerva/app/users/anezkak/MAT_GitHub/

done
