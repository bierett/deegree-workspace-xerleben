#!/usr/local/bin/perl
use Config::Simple;
#use strict;
#use warnings;

my $properties = new Config::Simple('00_properties.ini');

my $filename = $properties->param('filename.metadata');
my $title = $properties->param('metadata.title');
my $abstract = $properties->param('metadata.abstract');

open output,">../services/".$filename.".xml" or die "Can't open the output file! See";

print output "<?xml version='1.0' encoding='UTF-8'?>\n";
print output "<deegreeServicesMetadata xmlns='http://www.deegree.org/services/metadata' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' configVersion='3.0.0' xsi:schemaLocation='http://www.deegree.org/services/metadata http://schemas.deegree.org/services/metadata/3.0.0/metadata.xsd'>\n";
	print output "\t<ServiceIdentification>\n";
		print output "\t\t<Title>".$title."</Title>\n";
		print output "\t\t<Abstract>".$abstract."</Abstract>\n";
		print output "\t\t<Fees>none</Fees>\n";
		print output "\t\t<AccessConstraints>none</AccessConstraints>\n";
	print output "\t</ServiceIdentification>\n";
	print output "\t<ServiceProvider>\n";
	print output "\t\t<ProviderName/>\n";
	print output "\t\t<ProviderSite>http://www.deegree.org</ProviderSite>\n";
	print output "\t\t<ServiceContact>\n";
	print output "\t\t\t<IndividualName>Danilo Bretschneider</IndividualName>\n";
	print output "\t\t\t<PositionName/>\n";
	print output "\t\t\t<Phone/>\n";
	print output "\t\t\t<Facsimile/>\n";
	print output "\t\t\t<ElectronicMailAddress>opensource [at] bretsch.net</ElectronicMailAddress>\n";
	print output "\t\t\t<Address>\n";
	print output "\t\t\t\t<DeliveryPoint/>\n";
	print output "\t\t\t\t<City>Bonn</City>\n";
	print output "\t\t\t\t<AdministrativeArea>NRW</AdministrativeArea>\n";
	print output "\t\t\t\t<PostalCode>53173</PostalCode>\n";
	print output "\t\t\t\t<Country>Germany</Country>\n";
	print output "\t\t\t</Address>\n";
	print output "\t\t\t<OnlineResource>http://www.deegree.org</OnlineResource>\n";
	print output "\t\t\t<HoursOfService>24x7</HoursOfService>\n";
	print output "\t\t\t<ContactInstructions>Do not hesitate to call</ContactInstructions>\n";
	print output "\t\t\t<Role>PointOfContact</Role>\n";
	print output "\t\t</ServiceContact>\n";
	print output "\t</ServiceProvider>\n";
print output "</deegreeServicesMetadata>";