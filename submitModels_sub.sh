#!/bin/bash

indir=1D_modelComparison_check
basedir=/minerva/app/users/${USER}/MAT_GitHub

# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02a_02_11a/ 
# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02b_02_11a/ 
# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10a_02_11a/ 
# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10b_02_11a/ 

# carbon iron lead water
echo "NEUT"

echo SF_ma103
echo ============== Carbon ==============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py SFma103_carbon root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/SF_ma103/carbon/flat_NEUT_tune_SF_maqe1.03_50M.root"

cd /minerva/app/users/anezkak/MAT_GitHub/
rm eventLoop_NONE_wrapper_tag_default_*.sh




cd /minerva/app/users/anezkak/MAT_GitHub/










