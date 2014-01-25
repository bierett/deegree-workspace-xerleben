#!/usr/local/bin/perl
use Config::Simple;
#use strict;
#use warnings;

my $properties = new Config::Simple('config/01_properties.ini');

my $filename = $properties->param('filename.wms');
my $themes = $properties->param('filename.themes');

open output,">../services/".$filename.".xml" or die "Can't open the output file! See";

print output "<?xml version='1.0' encoding='UTF-8'?>\n";
print output "<wms:deegreeWMS configVersion='3.2.0' xmlns:wms='http://www.deegree.org/services/wms' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:dgws='http://www.deegree.org/webservices' xsi:schemaLocation='http://www.deegree.org/services/wms http://schemas.deegree.org/services/wms/3.2.0/wms_configuration.xsd'>\n";
	print output "\t<wms:ServiceConfiguration>\n";
		print output "\t\t<wms:ThemeId>".$themes."</wms:ThemeId>\n";
	print output "\t</wms:ServiceConfiguration>\n";
print output "</wms:deegreeWMS>";