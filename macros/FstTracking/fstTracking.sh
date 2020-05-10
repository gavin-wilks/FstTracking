#!/bin/bash
date

#. ./fstTracking.sh isApplyCMNCorr nFstHitsCut

if [ $# -eq 2 ]
then
  isSavePed=true
  isApplyCMNCorr=$1
  nFstHitsCut=$2

  # HV70V
  # root -l -b -q doFstTracking.C\(\"HV70V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},3\)
  # root -l -b -q doFstTracking.C\(\"HV70V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},2\)
  # root -l -b -q doFstTracking.C\(\"HV70V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},1\)

  # HV140V
  root -l -b -q doFstTracking.C\(\"HV140V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},3\)
  root -l -b -q doFstTracking.C\(\"HV140V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},2\)
  root -l -b -q doFstTracking.C\(\"HV140V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},1\)

  # HV200V
  root -l -b -q doFstTracking.C\(\"HV200V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},3\)
  root -l -b -q doFstTracking.C\(\"HV200V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},2\)
  root -l -b -q doFstTracking.C\(\"HV200V\",${isSavePed},${isApplyCMNCorr},${nFstHitsCut},1\)
fi
