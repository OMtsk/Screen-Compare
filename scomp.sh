#!/bin/bash
mkdir /tmp/scomp
DIR="/tmp/scomp"
WAIT=5

#trap 'cd .. ; sudo umount ./image_dir; exit 1' 1 2 3 15
trap 'rm -r /tmp/scdiff &> /dev/null; exit 1' 1 2 3 15

#echo 'Mount tmpfs...'
#sudo mount -t tmpfs -o size=3m /dev/shm ./image_dir
#cd ${DIR}

#echo 'Import First Screen Capture...'
import -window root $DIR/first.jpg

#Start Loop 
while true
do
	#echo 'Sleeping 5s...'
	sleep $WAIT

	#echo 'I waking up now, import next Screen Capture...'
	import -window root $DIR/next.jpg

	#echo 'Compare Images...'
	composite -compose difference $DIR/first.jpg $DIR/next.jpg $DIR/diff.jpg

	ret=$(identify -format "%[mean]" $DIR/diff.jpg)
	#echo 'Results'
	#echo -e ${ret}

	if [ "${ret}" != "0" ]; then
		#echo 'Difference Image'
		echo
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




