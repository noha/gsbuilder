#!/bin/bash


DIR=`dirname $0`
SCRIPTS_PATH="$DIR/scripts"
STONE_CREATOR=/opt/stone-creator
FRESH_EXTENT=""

#SCRIPTS=("$SCRIPTS_PATH/before.st")
SCRIPTS=()

while getopts ":i:n:s:f?" OPT ; do
        case "$OPT" in

        s) if [ -f "$SCRIPTS_PATH/$OPTARG.st" ] ; then
              SCRIPTS=("${SCRIPTS[@]}" "$SCRIPTS_PATH/$OPTARG.st")
           else
              echo "$(basename $0): invalid script ($OPTARG)"
              exit 1
           fi
        ;;
	f)
            FRESH_EXTENT="-f"
 	;;
	n)
            BUILD_NAME="$OPTARG$BUILD_NUMBER"
 	;;
   esac
done

SCRIPTS=("${SCRIPTS[@]}" "$SCRIPTS_PATH/after.st")

$STONE_CREATOR/bin/create-stone.sh -n $BUILD_NAME -d $WORKSPACE -u jenkins $FRESH_EXTENT -s 200000 -t 50000
. $WORKSPACE/env

rm $WORKSPACE/script.st

eval "echo \"$(< $SCRIPTS_PATH/before.st )\"" > $WORKSPACE/$BUILD_NAME-script.st

for FILE in "${SCRIPTS[@]}" ; do
	echo $FILE
	cat $FILE >> $WORKSPACE/$BUILD_NAME-script.st
	#eval "echo \"$(< $FILE )\"" >> $WORKSPACE/$BUILD_NAME-script.st
done 

startstone $BUILD_NAME -z $GEMSTONE_SYS_CONF -l $WORKSPACE/$BUILD_NAME-log.txt

$GEMSTONE/bin/topaz -l -T200000 < $WORKSPACE/$BUILD_NAME-script.st
STATE=$?
echo "state: $STATE"

stopstone $BUILD_NAME DataCurator swordfish

exit $STATE
