#!/bin/bash

# clean folder and define genesis block
rm block_*.txt
HEIGHT=0
DIFFICULTY=0

while true; do
    # start building blocks

    # output to terminal current block height
    echo "Current block height: $HEIGHT"
    echo "Current difficulty: $DIFFICULTY"

    # define block filename
    FILENAME="block_"$HEIGHT".txt"

    VARIABLENAME="test$HEIGHT"
    
    # search for POW and measure time
    # hashcash --help for list of options

    START_TIME=$SECONDS
    OUTPUT=$(hashcash -P -b $DIFFICULTY -m -r $VARIABLENAME)
    ELAPSED_TIME=$(($SECONDS - $START_TIME))
        
    # announce new block
    echo "BLOCK FOUND!!!"
    echo "Elapsed time:" $ELAPSED_TIME "SECONDS"

    # write block to file
    HEADER1=$(echo $OUTPUT)
    HEADER2=$(echo $OUTPUT | shasum)
    echo $HEADER1 >> $FILENAME
    echo $HEADER2 >> $FILENAME
    
    # define next block height
    let HEIGHT=HEIGHT+1
    let DIFFICULTY=DIFFICULTY+1

done



