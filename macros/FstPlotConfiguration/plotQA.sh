#!/bin/bash
date

#. ./plotQA.sh hv config

if [ $# -eq 6 ]
then
  hv=$1
  isSavePed=$2
  isApplyCMNCorr=$3
  nFstHitsCut=$4
  numOfUsedTimeBins=$5
  config=$6

  folder=./figures/${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}
  mkdir -p ${folder} 

  # echo "Plot Number of Raw Hits!!"
  root -l -b -q plotNumOfRawHits.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/NumOfRawHits.pdf ${folder}/NumOfRawHits_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Plot Signal QA!!"
  root -l -b -q plotSignalQA.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/SignalQA.pdf ${folder}/SignalQA_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Plot Ped Noise QA!!"
  root -l -b -q plotNoiseQA.C\(\"${hv}\",\"Ped\"\)
  mv ./figures/PedNoiseQA.pdf ${folder}/PedNoiseQA_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Plot Data Noise QA!!"
  root -l -b -q plotNoiseQA.C\(\"${hv}\",\"Data\"\)
  mv ./figures/DataNoiseQA.pdf ${folder}/DataNoiseQA_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Plot Residual of Fst Cluster Tracks from 2-Layer tracking!!"
  root -l -b -q plotResidual_FSTClusterTracks_2Layer.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/Residual_FSTClusterTracks_2Layer.pdf ${folder}/Residual_FSTClusterTracks_2Layer_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Calculate Efficiency of Fst Cluster Tracks from 2-Layer tracking!!"
  root -l -b -q calTrackClusterEfficiency_2Layer.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/Efficiency_TrackCluster_2Layer.pdf ${folder}/Efficiency_TrackCluster_2Layer_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Plot Event Display from 2-Layer tracking!!"
  root -l -b -q plotEventDisplay_2Layer.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/EventDisplay_2Layer.pdf ${folder}/EventDisplay_2Layer_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Plot Residual of Fst Cluster Tracks from 3-Layer tracking!!"
  root -l -b -q plotResidual_FSTClusterTracks_3Layer.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/Residual_FSTClusterTracks_3Layer.pdf ${folder}/Residual_FSTClusterTracks_3Layer_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Calculate Efficiency of Fst Cluster Tracks from 3-Layer tracking!!"
  root -l -b -q calTrackClusterEfficiency_3Layer.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/Efficiency_TrackCluster_3Layer.pdf ${folder}/Efficiency_TrackCluster_3Layer_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf

  # echo "Plot Event Display from 3-Layer tracking!!"
  root -l -b -q plotEventDisplay_3Layer.C\(\"${hv}\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},${numOfUsedTimeBins}\)
  mv ./figures/EventDisplay_3Layer.pdf ${folder}/EventDisplay_3Layer_${hv}_Th${nFstHitsCut}Tb${numOfUsedTimeBins}_${config}.pdf
fi
