#!/bin/bash

if [ "$1" == "batal" ]
then
	rsync -avu --delete ~/eclipseworkspace/angel-app/gate gate@batal:
else
	rsync -avu --delete ~/eclipseworkspace/angel-app/gate pol@missioneternity.org:
fi

