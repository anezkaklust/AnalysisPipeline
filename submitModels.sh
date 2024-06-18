#!/bin/bash

indir=1D_modelComparison
basedir=/minerva/app/users/${USER}/MAT_GitHub

# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02a_02_11a/ 
# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02b_02_11a/ 
# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10a_02_11a/ 
# /pnfs/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10b_02_11a/ 

# carbon iron lead water
echo "GENIE"

echo G18_02a_02_11a
echo ============== Carbon ==============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802a_carbon root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02a_02_11a/carbon/flat_GENIE_G18_02a_02_11a_50M.root"

echo ============== Iron ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802a_iron root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02a_02_11a/iron/flat_GENIE_G18_02a_02_11a_50M.root"

echo ============== Lead ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802a_lead root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02a_02_11a/lead/flat_GENIE_G18_02a_02_11a_50M.root"

echo ============== Tracker =============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802a_tracker root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/tracker/G18_02a_02_11a/tracker/flat_GENIE_1000k_tune_G18_02a_02_11a_50MCombined_RHC.root"

cd /minerva/app/users/anezkak/MAT_GitHub/
rm eventLoop_NONE_wrapper_tag_default_*.sh

echo G18_02b_02_11a
echo ============== Carbon ==============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802b_carbon root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02b_02_11a/carbon/flat_GENIE_G18_02b_02_11a_50M.root"

echo ============== Iron ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802b_iron root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02b_02_11a/iron/flat_GENIE_G18_02b_02_11a_50M.root"

echo ============== Lead ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802b_lead root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_02b_02_11a/lead/flat_GENIE_G18_02b_02_11a_50M.root"

echo ============== Tracker =============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1802b_tracker root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/tracker/G18_02b_02_11a/tracker/flat_GENIE_1000k_tune_G18_02b_02_11a_50Mcombined.root"

cd /minerva/app/users/anezkak/MAT_GitHub/
rm eventLoop_NONE_wrapper_tag_default_*.sh

echo G18_10a_02_11a
echo ============== Carbon ==============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810a_carbon root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10a_02_11a/carbon/flat_GENIE_G18_10a_02_11a_50M.root"

echo ============== Iron ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810a_iron root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10a_02_11a/iron/flat_GENIE_G18_10a_02_11a_50M.root"

echo ============== Lead ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810a_lead root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10a_02_11a/lead/flat_GENIE_G18_10a_02_11a_50M.root "

echo ============== Tracker =============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810a_tracker root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/tracker/G18_10a_02_11a/tracker/flat_GENIE_1000k_tune_G18_10a_02_11a_50Mcombined_rhc.root"

cd /minerva/app/users/anezkak/MAT_GitHub/
rm eventLoop_NONE_wrapper_tag_default_*.sh

echo G18_10b_02_11a
echo ============== Carbon ==============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810b_carbon root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10b_02_11a/carbon/flat_GENIE_G18_10b_02_11a_50M.root"

echo ============== Iron ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810b_iron root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10b_02_11a/iron/flat_GENIE_G18_10b_02_11a_50M.root"

echo ============== Lead ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810b_lead root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/nuclear/G18_10b_02_11a/lead/flat_GENIE_G18_10b_02_11a_50M.root "

echo ============== Tracker =============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py G1810b_tracker root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/GENIE/Medium_Energy/RHC/v3_0_6/tracker/G18_10b_02_11a/tracker/flat_GENIE_1000k_tune_G18_10b_02_11a_50Mcombined_rhc.root"

cd /minerva/app/users/anezkak/MAT_GitHub/
rm eventLoop_NONE_wrapper_tag_default_*.sh

# /pnfs/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/LFG_ma105
# /pnfs/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/SF_ma103

# carbon iron lead water
echo "NEUT"

echo LFG_ma105
echo ============== Carbon ==============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py LFGma105_carbon root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/LFG_ma105/carbon/flat_NEUT_tune_LFG_maqe1.05_50M.root"

echo ============== Iron ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py LFGma105_iron root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/LFG_ma105/iron/flat_NEUT_tune_LFG_maqe1.05_50M.root"

echo ============== Lead ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py LFGma105_lead root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/LFG_ma105/lead/flat_NEUT_tune_LFG_maqe1.05_50M.root"

echo ============== Tracker =============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py LFGma105_tracker root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/tracker/LFG_ma105/tracker/flat_NEUT_tune_LFG_maqe1.05_50M.root"

cd /minerva/app/users/anezkak/MAT_GitHub/
rm eventLoop_NONE_wrapper_tag_default_*.sh

echo SF_ma103
echo ============== Carbon ==============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py SFma103_carbon root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/SF_ma103/carbon/flat_NEUT_tune_SF_maqe1.03_50M.root"

echo ============== Iron ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py SFma103_iron root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/SF_ma103/iron/flat_NEUT_tune_SF_maqe1.03_50M.root"

echo ============== Lead ================
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py SFma103_lead root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/nuclear/SF_ma103/lead/flat_NEUT_tune_SF_maqe1.03_50M.root"

echo ============== Tracker =============
echo ====================================
python SubmitJobsToGrid_MAT_Tutorial.py --outdir /pnfs/minerva/persistent/users/${USER}/${indir}/ --stage eventLoop --basedir ${basedir} --runcommand "python modelComparison/plotXSecFromNUISANCE.py SFma103_tracker root://fndca1.fnal.gov:1094/pnfs/fnal.gov/usr/minerva/persistent/Models/NEUT/Medium_Energy/RHC/v5.4.1/tracker/SF_ma103/tracker/flat_NEUT_tune_SF_maqe105_50M.root"

cd /minerva/app/users/anezkak/MAT_GitHub/
rm eventLoop_NONE_wrapper_tag_default_*.sh





cd /minerva/app/users/anezkak/MAT_GitHub/










