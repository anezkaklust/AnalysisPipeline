#!/bin/bash

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"


plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
datadDir=/minerva/data/users/anezkak/10-25-2023_v430_p4/1D/
scaleFacDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/plasticBackground/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/

# How many files do we have?
#cd /pnfs/minerva/persistent/users/anezkak/1D_v1-nonrespi/
#du -a | cut -d/ -f2 | sort | uniq -c | sort -nr

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
# for all playlists
#for playlist in minervame5A minervame6A minervame6B minervame6D minervame6G minervame6I 
#for playlist in minervame6A

# PLOTTING combined stuff
cd ${datadDir}/combined/

echo Event Selection plots
cd "EventSelection"

python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 2 26 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 2 82 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 3 26 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 3 06 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 3 82 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 4 82 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 5 26 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 5 82 ${combinedVersion} 1
python ${plottingDir}countNEvents.py ${datadDir}/combined/EventSelection/ 99 99 ${combinedVersion} 1



cd /minerva/app/users/anezkak/MAT_GitHub/
