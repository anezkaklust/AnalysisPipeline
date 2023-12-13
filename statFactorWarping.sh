#!/bin/bash
now=$(date +%m-%d-%Y)
printf "%s\n" "$now"

# MC POT 4.90536230826e+21
# Data POT 1.04668796278e+21

# MC POT/Data POT = 4.68655653136
smallf=4.68655653136

plottingDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/plotting/
#datadDir=/minerva/data/users/anezkak/${now}/1D_nonrespiwarp20Gev/
datadDir=/minerva/data/users/anezkak/07-10-2023_v430/1D/
scriptDir=/minerva/app/users/anezkak/MAT_GitHub/NSFNukeCCInclusive/ana/make_hists/
CVfiles=/minerva/data/users/anezkak/07-10-2023_v430/1D/combined/
#/minerva/data/users/anezkak/03-04-2023/1D/combined/
warp="cv"

mkdir -p ${datadDir}

combinedVersion="minervame5A6A6B6C6D6E6F6G6H6I6J"
#combinedVersion="minervame5A"

# Determining small f
echo Run Warping Studies - Determine small f factor!
mkdir -p ${datadDir}/combined/fStudy/
cd ${scriptDir}/warpingStudies/

#source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 2 26 ${combinedVersion} ${warp} ${smallf}

#source runTransWarpDaisy_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 99 99 ${combinedVersion} ${warp} ${smallf}

: << 'COMMENT'
echo Run Warping Studies - Determine small f factor!
mkdir -p ${datadDir}/combined/fStudy/
cd ${scriptDir}/warpingStudies/

source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 2 26 ${combinedVersion} ${warp} ${smallf}
source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 3 26 ${combinedVersion} ${warp} ${smallf}
source runTransWarp_smallf.sh ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 5 26 ${combinedVersion} ${warp} ${smallf}

source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/  3 06 ${combinedVersion} ${warp} ${smallf}

source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 2 82 ${combinedVersion} ${warp} ${smallf}
source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 3 82 ${combinedVersion} ${warp} ${smallf}
source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 4 82 ${combinedVersion} ${warp} ${smallf}
source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 5 82 ${combinedVersion} ${warp} ${smallf}

source runTransWarp_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 99 99 ${combinedVersion} ${warp} ${smallf}
source runTransWarpDaisy_smallf.sh  ${datadDir}/combined/  ${CVfiles} ${datadDir}/combined/fStudy/ 99 99 ${combinedVersion} ${warp} ${smallf}
#: << 'COMMENT'
COMMENT
echo Process with different unfactors
cd ${datadDir}/combined/fStudy/

: << 'COMMENT'
# Enu 
for unf in 3 4 5 6 7 8 9 10 11 12 13 14 15 18 20 21 22 23 24 25 
do
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t4_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z06_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_0.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_1.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_2.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_3.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_4.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_5.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_6.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_7.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_8.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_9.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_10.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_11.root --uncfactor ${unf} --f ${smallf}

done


# x
echo Bjorken x
for unf in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 18 20 21 22 23
do
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t4_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z06_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_0.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_1.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_2.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_3.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_4.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_5.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_6.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_7.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_8.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_9.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_10.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_x_11.root --uncfactor ${unf} --f ${smallf}
done
: << 'COMMENT'
COMMENT

# pZmu1D
echo pZmu1D
for unf in 4 5.8 5.9 6 6.7 6.8 6.9 7.8 7.9 8 8.1 8.5 9 9.5 14 15 15.5 35
do
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t4_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z06_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_0.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_1.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_2.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_3.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_4.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_5.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_6.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_7.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_8.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_9.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_10.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pZmu1D_11.root --uncfactor ${unf} --f ${smallf}

done
#COMMENT
: << 'COMMENT'
# pTmu1D
echo pTmu1D
for unf in 500 1000 10000 100000
#for unf in 34
do
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}

    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t4_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}

    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z06_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}

    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D.root --uncfactor ${unf} --f ${smallf}

    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_0.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_1.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_2.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_3.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_4.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_5.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_6.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_7.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_8.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_9.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_10.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 10 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_pTmu1D_11.root --uncfactor ${unf} --f ${smallf}

done
: << 'COMMENT'
#COMMENT
# ThetamuDeg
echo ThetamuDeg
for unf in  10000 100000 1000000 10000000
do
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}

    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t2_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t4_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t5_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}

    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t3_z06_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}

    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg.root --uncfactor ${unf} --f ${smallf}

    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_0.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_1.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_2.root --uncfactor ${unf} --f ${smallf}
    python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_3.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_4.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_5.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_6.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_7.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_8.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_9.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_10.root --uncfactor ${unf} --f ${smallf}
    #python ${plottingDir}/warpingStudies/ProcessMCSampleSizeScan.py --n_uni 100 --iters 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,40,50,60,70,80,90,100 --input Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_ThetamuDeg_11.root --uncfactor ${unf} --f ${smallf}

done

: << 'COMMENT'
echo Plot different unfactors
cd ${datadDir}/combined/fStudy/
#: << 'COMMENT'
echo Enu
find . -name "Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
find . -name "Warping_t3_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
find . -name "Warping_t5_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +

find . -name "Warping_t2_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
find . -name "Warping_t3_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
find . -name "Warping_t4_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
find . -name "Warping_t5_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +

find . -name "Warping_t3_z06_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +

find . -name "Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu.root*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +


echo Plot different unfactors
cd ${datadDir}/combined/fStudy/

for petal in 0 1 2 3 4 5 6 7 8 9 10 11
do
    find . -name "Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_Enu_${petal}.root*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan_daisy.py {} +
done



#for var in x pTmu1D pZmu1D ThetamuDeg
#do
#    find . -name "Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
#done
COMMENT
echo Plot different unfactors
cd ${datadDir}/combined/fStudy/
pwd
#for var in x pTmu1D pZmu1D ThetamuDeg
for var in pZmu1D

do
    find . -name "Warping_t2_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
    find . -name "Warping_t3_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
    find . -name "Warping_t5_z26_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +

    find . -name "Warping_t2_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
    find . -name "Warping_t3_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
    find . -name "Warping_t4_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +
    find . -name "Warping_t5_z82_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +

    find . -name "Warping_t3_z06_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +

    find . -name "Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}.root*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan.py {} +

    for petal in 0 1 2 3 4 5 6 7 8 9 10 11
    do
        find . -name "Warping_t99_z99_minervame5A6A6B6C6D6E6F6G6H6I6J_cv_${var}_${petal}.root*.txt" -exec python ${plottingDir}/warpingStudies/PlotMCSampleSizeScan_daisy.py {} +
    done
done

cd /minerva/app/users/anezkak/MAT_GitHub/
