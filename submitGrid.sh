#!/bin/bash

echo Event Loop
source submitEventLoop.sh | tee eventLoopSubmission.txt
echo Efficiency
source submitEfficiency.sh | tee efficiencySubmission.txt
echo Migration
source submitMigration.sh | tee migrationSubmission.txt
echo Migration2D
source submitMigration2D.sh | tee migrationSubmission2D.txt
echo Plastic Sidebands
source submitPlasticSidebands.sh | tee plasticSubmission.txt

echo DONE