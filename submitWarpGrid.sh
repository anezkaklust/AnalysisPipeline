#!/bin/bash

echo Event Loop
source submitEventLoop.sh enuratio 2>&1| tee eventLoopSubmission_enuratio.txt
echo Efficiency
source submitEfficiency.sh enuratio 2>&1| tee efficiencySubmission_enuratio.txt
echo Plastic Sidebands
source submitPlasticSidebands.sh enuratio 2>&1| tee plasticSubmission_enuratio.txt

echo DONE