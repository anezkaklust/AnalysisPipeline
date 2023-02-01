#!/bin/bash

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/panel_plottingConcise
datadDir=/minerva/data2/users/anezkak/2023/
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
    savedir="${now}_${playlist}_2D"
    mkdir -p ${savedir} && cd ${savedir}
    pwd

    echo Event Loop plots
    mkdir -p "EventLoop"
    cd "EventLoop"
    cd ${plottingDir}
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 2 26 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 2 82 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 3 26 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 3 06 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 3 82 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 4 82 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 5 26 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 5 82 ${playlist} 
    #./plotEventSelection ${dirpwd} ${datadDir}${savedir}/EventLoop 99 99 ${playlist} 
    
    echo Event Loop Fractional Error plots
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 2 26 ${playlist} 
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 2 82 ${playlist} 
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 3 26 ${playlist} 
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 3 06 ${playlist} 
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 3 82 ${playlist} 
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 4 82 ${playlist} 
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 5 26 ${playlist} 
    #./FractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 5 82 ${playlist} 
    #./plotFractionalError ${dirpwd} ${datadDir}${savedir}/EventLoop 99 99 ${playlist} 
    cd ${datadDir}${savedir}/

    #mkdir -p "Migration"
    #cd "Migration"
    #echo Migration plots
    #cd ${plottingDir}

    echo Efficiency Numerator Denominator plots
    mkdir -p "Efficiency"
    cd "Efficiency"
    cd ${plottingDir}
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 2 26 ${playlist} 
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 2 82 ${playlist} 
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 3 26 ${playlist} 
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 3 06 ${playlist}
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 3 82 ${playlist}
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 4 82 ${playlist} 
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 5 26 ${playlist}
    #./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 5 82 ${playlist} 
    ./plotEfficiencyNumDenom ${dirpwd} ${datadDir}${savedir}/Efficiency 99 99 ${playlist}    
   
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
    python ${plottingDir}/plotEfficiency2D.py ${dirpwd} 99 99 ${playlist} 

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