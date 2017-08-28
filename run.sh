#!/bin/bash

# define genesis block
HEIGHT=0
DIFFICULTY=0

while true; do
    # start building blocks

    # output to terminal current block height
    echo "Current block height: $HEIGHT"

    # define block filename
    FILENAME="block_"$HEIGHT".txt"

    VARIABLENAME="test$HEIGHT"
    
    # search for POW
    # hashcash --help for list of options
    time hashcash -P -b $DIFFICULTY -m -r $VARIABLENAME > $FILENAME

    # write new block to file
    cat $FILENAME | tr -d "\n" | shasum | tee -a $FILENAME

    # define next block height
    let HEIGHT=HEIGHT+1
    
    # increase difficulty
    let DIFFICULTY=DIFFICULTY+1
done



