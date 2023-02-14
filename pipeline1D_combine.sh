#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
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
    #echo Event Loop plots
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 2 26 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 2 82 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 3 26 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 3 06 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 3 82 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 4 82 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 5 26 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 5 82 ${playlist} 0
    #python ${plottingDir}plotCVError.py ${datadDir}/${savedir}/EventSelection/ 99 99 ${playlist} 0
    #echo Background breakdown Targets
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 2 26 ${playlist} 0
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 2 82 ${playlist} 0 
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 3 26 ${playlist} 0
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 3 06 ${playlist} 0
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 3 82 ${playlist} 0
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 4 82 ${playlist} 0
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 5 26 ${playlist} 0
    #python ${plottingDir}plotStackedBkg_target.py ${datadDir}/${savedir}/EventSelection/ 5 82 ${playlist} 0
    #echo Background breakdown Tracker
    #python ${plottingDir}plotStackedBkg_tracker.py ${datadDir}/${savedir}/EventSelection/ ${playlist} 0
    #echo Event Loop Tracker Daisy
    #python ${plottingDir}plotDaisyDistrib.py ${datadDir}/${savedir}/EventSelection/ ${playlist} 0
    #python ${plottingDir}plotDaisyDistrib_withBkg.py ${datadDir}/${savedir}/EventSelection/ ${playlist} 0
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
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 2 26 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 2 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 3 26 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 3 06 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 3 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 4 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 5 26 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 5 82 ${playlist}
    #python ${plottingDir}plotMigrationMatrix.py ${datadDir}/${savedir}/Migration/ 99 99 ${playlist}
    #echo Migration Tracker Daisy
    #python ${plottingDir}plotDaisyMigrationMatrix.py ${datadDir}/${savedir}/Migration/ ${playlist} 
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
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 2 26 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 2 82 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 3 26 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 3 06 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 3 82 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 4 82 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 5 26 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 5 82 ${playlist} 0
    #python ${plottingDir}plotEfficiency.py ${datadDir}/${savedir}/Efficiency/ 99 99 ${playlist} 0
    #echo Efficiency Tracker Daisy
    #python ${plottingDir}plotDaisyEfficiency.py ${datadDir}/${savedir}/Efficiency/ ${playlist} 0
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################
  

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
    
    
    ##############################################################################################
    ##################################### PLOTTING ###############################################
    ##############################################################################################
    #echo Plot Scale Factors
    #cd ${datadDir}/${savedir}/PlastisSidebands
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t2_z26.txt
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t2_z82.txt
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t3_z26.txt
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t3_z06.txt
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t3_z82.txt
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t4_z82.txt
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t5_z26.txt
    #python ${plottingDir}printScaleFactors.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} | tee ${datadDir}/${savedir}/PlastisSidebands/scaleFactors_t5_z82.txt
    #echo Plot Untuned And Tuned Plastic Sidebands
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 26 ${playlist} 
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 2 82 ${playlist} 
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 26 ${playlist} 
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 06 ${playlist} 
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 3 82 ${playlist} 
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 4 82 ${playlist} 
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 26 ${playlist} 
    #python ${plottingDir}plotbkgStack+ratio_sidebands.py ${datadDir}/${savedir}/PlastisSidebands/ ${datadDir}/${savedir}/PlastisSidebands 5 82 ${playlist} 
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################


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

   
    ##############################################################################################
    ##################################### PLOTTING ###############################################
    ##############################################################################################
    #echo Plot Background Subtracted Event Selections
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 26 ${playlist} 0
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 2 82 ${playlist} 0
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 26 ${playlist} 0
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 06 ${playlist} 0
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 3 82 ${playlist} 0
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 4 82 ${playlist} 0
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 26 ${playlist} 0
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 5 82 ${playlist} 0
    #echo Plot Background Subtracted Event Selection Tracker
    #python ${plottingDir}plotCVError_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted 99 99 ${playlist} 0
    #echo Plot Background Subtracted Event Selection Tracker Daisy 
    #python ${plottingDir}plotDaisyDistrib_bkgSubtracted.py ${datadDir}/${savedir}/BackgroundSubtracted ${playlist} 0
    ##############################################################################################
    ################################### END of Plotting ##########################################
    ##############################################################################################


    
    ##############################################################################################
    ############################# Single playlist cross-section ##################################
    ##############################################################################################

    #echo Target Cross-section Extraction
    #cd ${scriptDir}
    #./extractCrossSection ${datadDir}/${savedir} 26 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont235z26.txt
    #./extractCrossSection  ${datadDir}/${savedir} 6 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont3z06.txt
    #./extractCrossSection ${datadDir}/${savedir} 82 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont2345z82.txt
    
    #echo Tracker Cross-section Extraction
    #./extractCrossSection ${datadDir}/${savedir} 99 ${playlist} 99 true | tee ${datadDir}/${savedir}/cross-sectiont99z99.txt

    #echo Daisy Tracker Cross-section Extraction
    #./extractCrossSection_tracker_daisy ${datadDir}/${savedir} 99 99 ${playlist} | tee ${datadDir}/${savedir}/cross-sectiont99z99Daisy.txt
    
    #echo Plot Target Cross-section
    #cd ${datadDir}/${savedir}
    #python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 235 26 ${playlist} 0
    #python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 3 06 ${playlist} 0
    #python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 2345 82 ${playlist} 0
    
    #echo Plot Tracker Cross-section
    #python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/${savedir} 99 99 ${playlist} 0

    #echo Plot Tracker Daisy Cross-section
    #python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/${savedir} ${playlist} 0

    #echo Plot Daisy Target/Tracker Ratios
    #python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 26 ${playlist} 1
    #python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 06 ${playlist} 1
    #python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 82 ${playlist} 1

    #python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 26 ${playlist} 0
    #python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 06 ${playlist} 0
    #python ${plottingDir}ratiosXsec.py ${datadDir}/${savedir} 82 ${playlist} 0

    #echo Plot Non-Daisy Target/Tracker Ratios
    #python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 26 ${playlist} 1
    #python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 06 ${playlist} 1
    #python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 82 ${playlist} 1

    # plot ratios with intType
    #python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 26 ${playlist} 0
    #python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 06 ${playlist} 0
    #python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/${savedir} 82 ${playlist} 0


    ##############################################################################################
    ######################## End of single playlist cross-section ################################
    ##############################################################################################

    ##############################################################################################
    ############### Move to dirs per playlist in which we combine stuff ##########################
    ##############################################################################################

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

    echo "Migration"
    mkdir -p ${datadDir}/combined/Migrationt02z26
    cd ${datadDir}/combined/Migrationt02z26
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t2_z26_sys.root .
    
    mkdir -p ${datadDir}/combined/Migrationt02z82
    cd ${datadDir}/combined/Migrationt02z82
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t2_z82_sys.root .
    
    mkdir -p ${datadDir}/combined/Migrationt03z26
    cd ${datadDir}/combined/Migrationt03z26
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t3_z26_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt03z06
    cd ${datadDir}/combined/Migrationt03z06
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t3_z06_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt03z82
    cd ${datadDir}/combined/Migrationt03z82
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t3_z82_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt04z82
    cd ${datadDir}/combined/Migrationt04z82
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t4_z82_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt05z26
    cd ${datadDir}/combined/Migrationt05z26
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t5_z26_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt05z82
    cd ${datadDir}/combined/Migrationt05z82
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t5_z82_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt99z99
    cd ${datadDir}/combined/Migrationt99z99
    cp ${datadDir}/${savedir}/Migration/Migration_${playlist}_t99_z99_sys.root .

    mkdir -p ${datadDir}/combined/Migrationt99z99Daisy
    cd ${datadDir}/combined/Migrationt99z99Daisy
    cp ${datadDir}/${savedir}/Migration/Migration_Daisy_${playlist}_t99_z99_sys.root .
  
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

echo Combine migrations
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt02z26 ../Migration_${combinedVersion}_t2_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt02z82 ../Migration_${combinedVersion}_t2_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt03z26 ../Migration_${combinedVersion}_t3_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt03z06 ../Migration_${combinedVersion}_t3_z06_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt03z82 ../Migration_${combinedVersion}_t3_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt04z82 ../Migration_${combinedVersion}_t4_z82_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt05z26 ../Migration_${combinedVersion}_t5_z26_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt05z82 ../Migration_${combinedVersion}_t5_z82_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt99z99 Migration_${combinedVersion}_t99_z99_sys.root
python ${scriptDir}/combinePlaylistHistos_forDaisyNOW.py ${datadDir}/combined/Migrationt99z99Daisy ${datadDir}/combined/Migrationt99z99  ../Migration_Daisy_${combinedVersion}_t99_z99_sys.root
python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt99z99 ../Migration_${combinedVersion}_t99_z99_sys.root
#python ${scriptDir}combinePlaylistHistos.py ${datadDir}/combined/Migrationt99z99Daisy Migration_Daisy_${combinedVersion}_t99_z99_sys.root

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
rm -r ${datadDir}/combined/Migrationt*
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

mkdir -p "Migration"
cd "Migration"
mv ${datadDir}/combined/Migration_${combinedVersion}*.root .
mv ${datadDir}/combined/Migration_Daisy_${combinedVersion}*.root .

cd ${datadDir}/combined/

mkdir -p "Efficiency"
cd "Efficiency"
mv ${datadDir}/combined/Efficiency_${combinedVersion}*.root .
mv ${datadDir}/combined/Efficiency_Daisy_${combinedVersion}*.root .

cd ${datadDir}/combined/

# PLOTTING combined stuff
# Combine root files from different playlist 
echo Combine root files from different playlists
echo First combine backtround subtracted event rates
cd ${datadDir}/combined/

# PLOTTING combined stuff
echo Event Selection plots
cd "EventSelection"
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1
python ${plottingDir}plotCVError.py ${datadDir}/combined/EventSelection/ 99 99 ${combinedVersion} 1

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
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 2 26 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 2 82 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 3 26 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 3 06 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 3 82 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 4 82 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 5 26 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 5 82 ${combinedVersion} 1
python ${plottingDir}plotEfficiency.py ${datadDir}/combined/Efficiency 99 99 ${combinedVersion} 1

echo Efficiency Tracker Daisy
python ${plottingDir}plotDaisyEfficiency.py ${datadDir}/combined/Efficiency ${combinedVersion} 1

echo Target Cross-section Extraction
cd ${scriptDir}
./extractCrossSection ${datadDir}/combined/ 26 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont235z26.txt
./extractCrossSection ${datadDir}/combined/ 6 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont3z06.txt
./extractCrossSection ${datadDir}/combined/ 82 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont2345z82.txt
echo Tracker Cross-section Extraction
./extractCrossSection ${datadDir}/combined/ 99 ${combinedVersion} 99 true | tee ${datadDir}/combined/cross-sectiont99z99.txt

echo Daisy Tracker Cross-section Extraction
cd ${scriptDir}
./extractCrossSection_tracker_daisy ${datadDir}/combined/ 99 99 ${combinedVersion} | tee ${datadDir}/combined/cross-sectiont99z99Daisy.txt

echo Plot Target Cross-section
cd ${datadDir}/combined/
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 235 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 2345 82 ${combinedVersion} 1

echo Plot Tracker Cross-section
python ${plottingDir}plotXsection_combinedTarget.py ${datadDir}/combined/ 99 99 ${combinedVersion} 1

echo Plot Tracker Daisy Cross-section
python ${plottingDir}plotXsection_trackerDaisy.py ${datadDir}/combined/ ${combinedVersion} 1

echo Plot Stacked Target Cross-section
cd ${datadDir}/combined/
python ${plottingDir}plotXsection_combinedTarget_stacked.py ${datadDir}/combined/ 235 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_stacked.py ${datadDir}/combined/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_stacked.py ${datadDir}/combined/ 2345 82 ${combinedVersion} 1

echo Plot Stacked Tracker Cross-section
python ${plottingDir}plotXsection_combinedTarget_stacked.py ${datadDir}/combined/ 99 99 ${combinedVersion} 1

echo Plot Target Data/MC Cross-section ratios
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 235 26 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 3 06 ${combinedVersion} 1
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 2345 82 ${combinedVersion} 1

echo Plot Tracker Data/MC Cross-section ratios
python ${plottingDir}plotXsection_combinedTarget_dataMCratio.py ${datadDir}/combined/ 99 99 ${combinedVersion} 1

echo Plot Daisy Target/Tracker Ratios
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 1
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 1
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 1

# plot ratios with intType
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 26 ${combinedVersion} 0
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 06 ${combinedVersion} 0
python ${plottingDir}ratiosXsec.py ${datadDir}/combined/ 82 ${combinedVersion} 0

echo Plot Non-Daisy Target/Tracker Ratios
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 26 ${combinedVersion} 1
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 06 ${combinedVersion} 1
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 82 ${combinedVersion} 1

# plot ratios with intType
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 26 ${combinedVersion} 0
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 06 ${combinedVersion} 0
python ${plottingDir}ratiosXsec_noDaisy.py ${datadDir}/combined/ 82 ${combinedVersion} 0

cd /minerva/app/users/anezkak/MAT_GitHub/
