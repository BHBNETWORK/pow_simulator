#!/bin/bash
# create genesis block

COUNTER=0
BITS=4
while [  $COUNTER -lt 10 ]; do
    echo "Block number: $COUNTER"
    FILENAME="mined_"$COUNTER".txt"
    VARIABLENAME="test$COUNTER"
    echo $VARIABLENAME
    time hashcash -b $BITS -m -r $VARIABLENAME > $FILENAME
    cat $FILENAME | tr -d "\n" | shasum
    let COUNTER=COUNTER+1
    let BITS=BITS+4
done



