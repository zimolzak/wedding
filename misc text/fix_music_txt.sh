#!/bin/sh

perl -pi -e 's/\r//g; s/\n/\r\n/g;' music.txt
