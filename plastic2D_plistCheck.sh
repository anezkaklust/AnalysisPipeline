#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/panel_plottingConcise/
datadDir=/minerva/data/users/anezkak/07-10-2023_v430/2D/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists2D/

for playlist in minervame5A minervame6A minervame6B minervame6C minervame6D minervame6E minervame6F minervame6G minervame6H minervame6I minervame6J
do
    echo Get Scale Factor
    cd ${scriptDir}/plasticBackground2D/
    ./getScaleFactors2D_PlasticSB ${datadDir}/${playlist}/Plastic/ ${datadDir}/${playlist}/Plastic/ 3 26 ${playlist} 0

    echo Plot
    cd ${plottingDir}
    # untuned sidebands
    ./plotEventSelection2D_UntunedTargetSidebands ${datadDir}/${playlist}/Plastic/ ${datadDir}/${playlist}/Plastic/ 3 26 ${playlist} 0

    # untuned sidebands MC error (regUS and regDS)
    ./plotFractionalError2D_UntunedTargetSidebands ${datadDir}/${playlist}/Plastic/ ${datadDir}/${playlist}/Plastic/ 3 26 ${playlist} 

    # plot scale factor
    ./plotPlasticScaleFactor2D ${datadDir}/${playlist}/Plastic/ ${datadDir}/${playlist}/Plastic/ 3 26 ${playlist} 0

    # plot scale factor sys error
    ./plotFractionalError2D_ScaleFactor ${datadDir}/${playlist}/Plastic/ ${datadDir}/${playlist}/Plastic/ 3 26 ${playlist} 

    # tuned sidebands
    ./plotEventSelection2D_TunedTargetSidebands ${datadDir}/${playlist}/Plastic/ ${datadDir}/${playlist}/Plastic/ 3 26 ${playlist} 0

    # tuned sidebands MC error (regUS and regDS)
    ./plotFractionalError2D_TunedTargetSidebands ${datadDir}/${playlist}/Plastic/ ${datadDir}/${playlist}/Plastic/ 3 26 ${playlist} 
done