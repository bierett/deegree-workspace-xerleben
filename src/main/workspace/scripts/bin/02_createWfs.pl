#!/usr/local/bin/perl
use Config::Simple;
#use strict;
#use warnings;

my $properties = new Config::Simple('config/01_properties.ini');

my $filename = $properties->param('filename.wfs');
@epsg = $properties->param('epsg.crs');

open output,">../services/".$filename.".xml" or die "Can't open the output file! See";

print output "<?xml version='1.0' encoding='UTF-8'?>\n";
print output "<deegreeWFS xmlns='http://www.deegree.org/services/wfs' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' configVersion='3.2.0' xsi:schemaLocation='http://www.deegree.org/services/wfs http://schemas.deegree.org/services/wfs/3.2.0/wfs_configuration.xsd'>\n";
	print output "\t<SupportedVersions>\n";
		print output "\t\t<Version>1.0.0</Version>\n";
		print output "\t\t<Version>1.1.0</Version>\n";
		print output "\t\t<Version>2.0.0</Version>\n";
	print output "\t</SupportedVersions>\n";
	print output "\t<EnableTransactions>true</EnableTransactions>\n";
	print output "\t<DisableResponseBuffering>true</DisableResponseBuffering>\n";
	foreach(@epsg) {
		print output "\t<QueryCRS>".$_."</QueryCRS>\n";
	}
print output "</deegreeWFS>";