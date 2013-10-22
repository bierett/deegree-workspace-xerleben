#!/usr/local/bin/perl
use Config::Simple;
#use strict;
#use warnings;

my $properties = new Config::Simple('00_properties.ini');
my $url = $properties->param('jdbc.Url');
my $user = $properties->param('jdbc.User');
my $password = $properties->param('jdbc.Password');

print "<?xml version='1.0' encoding='UTF-8'?>\n";
print "<JDBCConnection configVersion='3.0.0' xmlns='http://www.deegree.org/jdbc' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation='http://www.deegree.org/jdbc http://schemas.deegree.org/jdbc/3.0.0/jdbc.xsd'>\n";
	print "\t<Url>". $url ."</Url>\n";
	print "\t<User>". $user ."</User>\n";
	print "\t<Password>". $password ."</Password>\n";
	print "\t<ReadOnly>false</ReadOnly>\n";
print "</JDBCConnection>";