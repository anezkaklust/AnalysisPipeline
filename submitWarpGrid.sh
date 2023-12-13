#!/bin/bash

echo Event Loop
source submitEventLoop.sh 1D_v430_neutron20Mev 2>&1 | tee eventLoopSubmission_1D_v430_neutron20Mev.txt
echo Efficiency
source submitEfficiency.sh 1D_v430_neutron20Mev 2>&1 | tee efficiencySubmission_1D_v430_neutron20Mev.txt
echo Plastic Sidebands
source submitPlasticSidebands.sh 1D_v430_neutron20Mev 2>&1 | tee plasticSubmission_1D_v430_neutron20Mev.txt

echo DONE