#!/bin/bash

echo Event Loop
source submitEventLoop.sh 1D_v1-nonrespi  2>&1 | tee eventLoopSubmission_1D_v1-nonrespi.txt
echo Efficiency
source submitEfficiency.sh 1D_v1-nonrespi 2>&1 | tee efficiencySubmission_1D_v1-nonrespi.txt
echo Migration
source submitMigration.sh 1D_v1-nonrespi 2>&1 | tee migrationSubmission_1D_v1-nonrespi.txt
echo Plastic Sidebands
source submitPlasticSidebands.sh 1D_v1-nonrespi 2>&1 | tee plasticSubmission_1D_v1-nonrespi.txt

echo DONE