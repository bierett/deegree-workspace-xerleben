#!/usr/local/bin/perl
use Config::Simple;
#use strict;
#use warnings;

my $properties = new Config::Simple('00_properties.ini');

my $wfs_filename = $properties->param('filename.wfs');

open output,">../services/".$wfs_filename.".xml" or die "Can't open the output file! See";

print output "<?xml version='1.0' encoding='UTF-8'?>\n";
print output "<deegreeWFS xmlns='http://www.deegree.org/services/wfs' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' configVersion='3.2.0' xsi:schemaLocation='http://www.deegree.org/services/wfs http://schemas.deegree.org/services/wfs/3.2.0/wfs_configuration.xsd'>\n";
	print output "\t<SupportedVersions>\n";
		print output "\t\t<Version>1.0.0</Version>\n";
		print output "\t\t<Version>1.1.0</Version>\n";
		print output "\t\t<Version>2.0.0</Version>\n";
	print output "\t</SupportedVersions>\n";
	print output "\t<EnableTransactions>true</EnableTransactions>\n";
	print output "\t<DisableResponseBuffering>true</DisableResponseBuffering>\n";
	print output "\t<QueryCRS>EPSG:25832</QueryCRS>\n";
	print output "\t<QueryCRS>EPSG:4326</QueryCRS>\n";
print output "</deegreeWFS>";