#!/usr/bin/perl -w
use File::Copy;
use strict;
use 5.010;

my @filelist = "*";

foreach (@filelist){
        my ($name) = /(.+)(��꺯|�����).pdf/;
        unless (-e $name){
                 mkdir $name;
        }
        move ($_,$name);
}