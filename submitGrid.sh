#!/bin/bash

echo Event Loop
source submitEventLoop.sh 1D | tee eventLoopSubmission.txt
echo Efficiency
source submitEfficiency.sh 1D | tee efficiencySubmission.txt
echo Migration
source submitMigration.sh 1D | tee migrationSubmission.txt
#echo Migration2D
#source submitMigration2D.sh | tee migrationSubmission2D.txt
echo Plastic Sidebands
source submitPlasticSidebands.sh 1D | tee plasticSubmission.txt

echo DONE