#!/bin/bash

HATVAR=1

echo "Deploying command hats and $[HATVAR]"

for HOST in moore{00..24} sslab{00..24} xinu{00..21} sac{01..13} pod0-0 mc{01..18} escher{00..23}; do
	echo $HOST
	HATVAR=$RANDOM
	for var in {15465..15468}; do
		let "HATVAR %= 38";
		let "HATVAR += 1";
		echo "nohup curl http://choosemyhat.com/ --data-urlencode "day=$[var]" --data-urlencode "hat=$[HATVAR]" --data-urlencode "s=2" >/dev/null 2>&1 & exit" | ssh -o StrictHostKeyChecking=no crouleau@${HOST}.cs.purdue.edu >>/homes/crouleau/dumbassshit/errorshit.txt 2>&1 &
	done
done

