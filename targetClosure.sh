#!/bin/bash

# 1) Efficiency numerator == unfolded MC treated as data
	# From cross-section root file
		# unfolded_3_mc_Enu 
			# Number stands for target
		# efficiency_numerator_3_Enu
# 2) Efficiency denominator == var_xsec_evRate
    #From cross-section root file
		# simEventRate_3_Enu
	# From runXSecLooper_NukeCC.cxx
	    # what I get from running that
# 3) MC selected signal in reco var == projection of migration matrix onto reco axis
    #From event loop and from migration matrix root files
# 4)Extracted cross-section from eff denominator (sim event rate) == GENIE xSec cross-section
	# Can do multitarget
    # From cross-section root file 
	    # simEventRate_crossSection_total_mc_Enu (total)
		# simEventRate_crossSection_mc_Enu (differential)
	# From runXSecLooper_NukeCC_multitarget.cxx

now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

playlist="minervame6A"

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/closure/
#datadDir=/minerva/data/users/anezkak/${now}/1D/
datadDir=/minerva/data/users/anezkak/06-05-2023_v1-nonrespi/1D/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/closureTest/
playlistDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/include/playlists/



cd ${datadDir}
savedir="closure_${playlist}"
mkdir -p ${savedir} && cd ${savedir}
pwd

# Efficiency numerator/Unfolded

python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 3 06 minervame6A 3
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 235 26 minervame6A 2
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 235 26 minervame6A 3
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 235 26 minervame6A 5
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 2345 82 minervame6A 2
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 2345 82 minervame6A 3
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 2345 82 minervame6A 4
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 2345 82 minervame6A 5
python ${plottingDir}ratios_efficiencyNum_unfolded.py ${datadDir}/${playlist}/ 99 99 minervame6A 99

# Selected signal/Migration Reco Projection
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 3 06 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 2 26 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 3 26 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 5 26 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 2 82 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 3 82 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 4 82 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 5 82 minervame6A
python ${plottingDir}ratios_selSignalReco_migrationRecoProj.py ${datadDir}/${playlist}/ 99 99 minervame6A

# Efficiency denominator/var_xSec_EvRate
cd ${scriptDir}
./runXSecLooper_NukeCC ${datadDir}/${savedir} 3 6 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC ${datadDir}/${savedir} 2 26 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC ${datadDir}/${savedir} 3 26 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC ${datadDir}/${savedir} 5 26 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC ${datadDir}/${savedir} 2 82 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC ${datadDir}/${savedir} 3 82 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC ${datadDir}/${savedir} 4 82 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC ${datadDir}/${savedir} 5 82 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt

cd ${scriptDir}
./runXSecLooper_CCIncForTracker ${datadDir}/${savedir} ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt

cd ${datadDir}/${savedir}
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 3 06 minervame6A 3 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 235 26 minervame6A 2 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 235 26 minervame6A 3 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 235 26 minervame6A 5 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 2345 82 minervame6A 2 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 2345 82 minervame6A 3 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 2345 82 minervame6A 4 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 2345 82 minervame6A 5 1
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 99 99 minervame6A 99 1


# Efficiency denominator/var_xSec_EvRate multitarget
cd ${scriptDir}
./runXSecLooper_NukeCC_multitarget ${datadDir}/${savedir} 26 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt
./runXSecLooper_NukeCC_multitarget ${datadDir}/${savedir} 82 ${playlistDir}${playlist}_mc_DualVertex_FullDetector_p3.txt

cd ${datadDir}/${savedir}
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 235 26 minervame6A 235 0
python ${plottingDir}ratios_efficiencyDenom_GENIEXSecEvRate.py ${datadDir} 2345 82 minervame6A 2345 0

# xSec/GENIE var_xSec multitarget
cd ${datadDir}/${savedir}
python ${plottingDir}ratios_xSec_GENIEXSec.py ${datadDir} 3 06 minervame6A 
python ${plottingDir}ratios_xSec_GENIEXSec.py ${datadDir} 235 26 minervame6A
python ${plottingDir}ratios_xSec_GENIEXSec.py ${datadDir} 2345 82 minervame6A 
python ${plottingDir}ratios_xSec_GENIEXSec.py ${datadDir} 99 99 minervame6A 

cd /minerva/app/users/anezkak/MAT_GitHub
