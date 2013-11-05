#!/bin/sh
rm -f ../jdbc/*
rm -f ../services/*
rm -f ../layers/*
rm -f ../themes/*
rm -f ../styles/*

perl 01_createJdbc.pl
perl 02_createWfs.pl
perl 04_createLayer.pl
perl 05_createThemes.pl
perl 06_createStyles.pl
perl 07_createWms.pl
perl 08_createMetada.pl