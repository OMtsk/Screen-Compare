#!/bin/bash

#trap 'cd .. ; sudo umount ./image_dir; exit 1' 1 2 3 15
trap 'rm -r /tmp/scomp &> /dev/null; exec 99<&~ ;exit 1' 1 2 3 15

if [ $# -ne 1 ]; then
	echo 'scomp SERIAL_DEVICE'
	exit 1
fi

#
# DIR    - Temporary Images which created from 'import' and 'compose' commands.
# WAIT   - Wait a 'WAIT' seconds. 
# SERIAL - Serial device. It's like '/dev/ttyUSB0'. When the two images different, execute 'echo 1 > SERIAL' command.
#

DIR="/tmp/scomp"
WAIT=2
SERIAL=$1

if [[ ! -e ${SERIAL} ]]; then
	echo 'Invalid serial device'
	exit 1
fi

if [[ ! -e "/tmp" ]]; then
	echo 'There is no /tmp'
	exit 1
fi

mkdir ${DIR}

stty 9600 -F ${SERIAL}
exec 99<>${SERIAL}

#echo ${SERIAL}
#echo 'Mount tmpfs...'
#sudo mount -t tmpfs -o size=3m /dev/shm ./image_dir
#cd ${DIR}

#echo 'Import First Screen Capture...'
#import -window root $DIR/first.jpg
xwd -root > $DIR/first.xwd
convert $DIR/first.xwd $DIR/first.jpg
rm $DIR/first.xwd

#Start Loop 
while true
do
	#echo 'Sleeping 5s...'
	sleep $WAIT

	#echo 'I waking up now, import next Screen Capture...'
	#import -window root $DIR/next.jpg
	xwd -root > $DIR/next.xwd
	convert $DIR/next.xwd $DIR/next.jpg
	rm $DIR/next.xwd

	#echo 'Compare Images...'
	composite -compose difference $DIR/first.jpg $DIR/next.jpg $DIR/diff.jpg

	ret=$(identify -format "%[mean]" $DIR/diff.jpg)
	#echo 'Results'
	#echo -e ${ret}

	if [ "${ret}" != "0" ]; then
		#echo 'Difference Image'
		#DO SOMETHING
		printf "1\r" > ${SERIAL}
	fi

	#echo 'Prepare next...' 
	rm $DIR/first.jpg
	rm $DIR/diff.jpg
	mv $DIR/next.jpg $DIR/first.jpg
done
#End Loop

#echo 'END THIS SCRIPT'
#cd ..
#sudo umount ./image_dir




