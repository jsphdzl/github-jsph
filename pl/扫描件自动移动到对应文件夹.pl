#!/usr/bin/perl -w
use File::Copy;
use strict;
use 5.010;

my @filelist = "*";

foreach (@filelist){
        my ($name) = /(.+)(议标函|立项报告).pdf/;
        unless (-e $name){
                 mkdir $name;
        }
        move ($_,$name);
}