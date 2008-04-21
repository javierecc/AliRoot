#!/bin/bash
cd $WORK/QATest
rm -f *.root *.C *.log
ln -si $ALICE_ROOT/test/QA/Config.C Config.C
aliroot -b -q $ALICE_ROOT/test/QA/sim.C > sim.log 2>&1
alienroot -b -q $ALICE_ROOT/test/QA/simqa.C > simqa.log 2>&1
aliroot -b -q $ALICE_ROOT/test/QA/rec.C > rec.log 2>&1
alienroot -b -q $ALICE_ROOT/test/QA/recqa.C > recqa.log 2>&1
alienroot -b -q $ALICE_ROOT/test/QA/tag.C > tag.log 2>&1
cd $WORK/QATest/data
aliroot -b -q  > rawqa.log 2>&1 << EOF
.x  $ALICE_ROOT/test/QA/rootlogon.C
.L $ALICE_ROOT/test/QA/rawqa.C+
rawqa(21950, 1)
EOF
exit