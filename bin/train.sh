#!/bin/bash
gpu=0

#ROOT=`/home/lincoln/kaggle-rsna-intracranial-hemorrhage/`
#cd $ROOT

root=/test
cd $root
pwd

train() {
    model=$1
    fold=$2

    conf=./conf/${model}.py
    python -m src.cnn.main train ${conf} --fold ${fold} --gpu ${gpu}
}

#train model100 0
#train model100 1
#train model100 2
#train model100 3
#train model100 4
#train model100 5
#train model100 6
#train model100 7

#train model110 0
#train model110 1
#train model110 2
#train model110 3
#train model110 4
#train model110 5
#train model110 6
#train model110 7

#train model120 0
#train model120 1
#train model120 2
train model120 3
#train model120 4
#train model120 5
#train model120 6
#train model120 7

#train model130 0
#train model130 1
#train model130 2
#train model130 3
#train model130 4
#train model130 5
#train model130 6
#train model130 7

