#!/bin/bash

echo Event Loop
source submitEventLoop.sh amudiswarp | tee eventLoopSubmission.txt
echo Efficiency
source submitEfficiency.sh  amudiswarp | tee efficiencySubmission.txt
echo Plastic Sidebands
source submitPlasticSidebands.sh  amudiswarp | tee plasticSubmission.txt

echo DONE