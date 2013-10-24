#!/usr/local/bin/perl
use Config::Simple;
#use strict;
#use warnings;

my $properties = new Config::Simple('00_properties.ini');
my $url = $properties->param('jdbc.url');
my $user = $properties->param('jdbc.user');
my $password = $properties->param('jdbc.password');

my $filename = $properties->param('filename.jdbc');

open output,">../jdbc/".$filename.".xml" or die "Can't open the output file! See";

print output "<?xml version='1.0' encoding='UTF-8'?>\n";
print output "<JDBCConnection configVersion='3.0.0' xmlns='http://www.deegree.org/jdbc' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation='http://www.deegree.org/jdbc http://schemas.deegree.org/jdbc/3.0.0/jdbc.xsd'>\n";
	print output "\t<Url>". $url ."</Url>\n";
	print output "\t<User>". $user ."</User>\n";
	print output "\t<Password>". $password ."</Password>\n";
	print output "\t<ReadOnly>false</ReadOnly>\n";
print output "</JDBCConnection>";