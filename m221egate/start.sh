#!/usr/bin/env bash

export PYTHONPATH=$PYTHONPATH:$HOME/src/scrambler-droplet/src/
echo $PYTHONPATH

if [ "x${1}" == "xbg" ]
then
	d=$PWD
	echo "Starting with production config in bg"
	mkdir -p $HOME/var
	cd $HOME/var/
	python $d/start-m221egate.py $d/prod.cfg > /dev/null 2>&1 < /dev/zero &
else
	python start-m221egate.py
fi

