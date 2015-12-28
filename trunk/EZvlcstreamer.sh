#!/bin/bash
# Script  created by
# Brett Boston bboston7@gmail.com
clear
echo "
EZ vlc streamer  Copyright (C) 2009  Brett Boston
This program comes with ABSOLUTELY NO WARRANTY; for details type 'show w'.
This is free software, and you are welcome to redistribute it
under certain conditions; type 'show c' for details.



######################
#EZ vlc streamer 0.14#
######################"

echo "
This script was designed by Brett Boston for creating a queue of items to be streamed in VLC 1.x.  This is currently not possible to do in the gui environment.
"

echo "Please put the file paths to the files you would like to stream.  Separate each file path with a space.  When done, press [ENTER]"

read files

echo "
This script only allows for HTTP streaming.  Please place the ip address or URL of your servers destination then press [ENTER].  If unsure, put 0.0.0.0 or leave the field blank which will cause your computer to listen to all requests (recomended)

ip address or URL:"
read address

echo "
Lastly, please put the port you would like to use.  This is typically 8080, but some ISPs block that port.  If you have troubles, simply use a different port.

port:"
read port

echo "
On the recieving computer(s), use vlc to tune to the http stream "your.ip.address:$port"  The stream will start as soon as you hit [ENTER].
"

read dummy

echo vlc -vvv $files --sout "'#transcode{vcodec=theo,acodec=vorb,vb=800,ab=128channels=2,samplerate=44100}: standard{access=http,mux=ogg,dst=$address:$port}'" --sout-keep| tee .EZ.sh


sh .EZ.sh

rm .EZ.sh

echo "

##########################################################
Thank you for using EZ stream 0.14
##########################################################
"
