SNAPSHOT_FILE=$1
if [ -z $SNAPSHOT_FILE ]; then
    echo -e "${RED}Snapshot file not provided. Exiting...${CLEAN}"
    exit 1
fi


lz4 -d $SNAPSHOT_FILE | tar -C $OSMOSIS_HOME/ -xvf -