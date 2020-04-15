#!/bin/sh

sudo docker run --name=boinc-client -h server-two -p 31416 -v /home/richard/docker-resources/boinc/data:/var/lib/boinc-client bcleonard/boinc
