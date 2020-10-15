#!/bin/bash

man passwd;
man /etc/passwd;
man -f passwd;
man -k passwd;

date;
pwd;
ls;
ll;
history;

myname=henridebel;
echo $myname;
echo mijn eigen naam is $myname
export $myname;

alias mybirthdate="cal 7 1997";
alias manual="man man"