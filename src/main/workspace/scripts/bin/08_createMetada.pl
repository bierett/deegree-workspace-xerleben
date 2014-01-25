#!/usr/local/bin/perl
use Config::Simple;
#use strict;
#use warnings;

my $properties = new Config::Simple('config/01_properties.ini');

my $filename = $properties->param('filename.metadata_wms');
my $title = $properties->param('metadata_wms.title');
my $abstract = $properties->param('metadata_wms.abstract');

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
		print output "\t\t<ProviderName>lat/lon GmbH</ProviderName>\n";
		print output "\t\t<ProviderSite>http://www.lat-lon.de</ProviderSite>\n";
		print output "\t\t<ServiceContact>\n";
			print output "\t\t\t<IndividualName>Danilo Bretschneider</IndividualName>\n";
			print output "\t\t\t<PositionName>Consultant</PositionName>\n";
			print output "\t\t\t<Phone>0228/18496-0</Phone>\n";
			print output "\t\t\t<Facsimile>0228/18496-29</Facsimile>\n";
			print output "\t\t\t<ElectronicMailAddress>bretschneider"."@"."lat-lon.de</ElectronicMailAddress>\n";
			print output "\t\t\t<Address>\n";
				print output "\t\t\t\t<DeliveryPoint>Aennchenstr. 19</DeliveryPoint>\n";
				print output "\t\t\t\t<City>Bonn</City>\n";
				print output "\t\t\t\t<AdministrativeArea>NRW</AdministrativeArea>\n";
				print output "\t\t\t\t<PostalCode>53177</PostalCode>\n";
				print output "\t\t\t\t<Country>Germany</Country>\n";
			print output "\t\t\t</Address>\n";
			print output "\t\t\t<OnlineResource>http://www.deegree.org</OnlineResource>\n";
			print output "\t\t\t<HoursOfService>24x7</HoursOfService>\n";
			print output "\t\t\t<ContactInstructions>Do not hesitate to call</ContactInstructions>\n";
			print output "\t\t\t<Role>PointOfContact</Role>\n";
		print output "\t\t</ServiceContact>\n";
	print output "\t</ServiceProvider>\n";
print output "</deegreeServicesMetadata>";

my $filename = $properties->param('filename.metadata_wfs');
my $title = $properties->param('metadata_wfs.title');
my $abstract = $properties->param('metadata_wfs.abstract');

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
		print output "\t\t<ProviderName>lat/lon GmbH</ProviderName>\n";
		print output "\t\t<ProviderSite>http://www.lat-lon.de</ProviderSite>\n";
		print output "\t\t<ServiceContact>\n";
			print output "\t\t\t<IndividualName>Danilo Bretschneider</IndividualName>\n";
			print output "\t\t\t<PositionName>Consultant</PositionName>\n";
			print output "\t\t\t<Phone>0228/18496-0</Phone>\n";
			print output "\t\t\t<Facsimile>0228/18496-29</Facsimile>\n";
			print output "\t\t\t<ElectronicMailAddress>bretschneider"."@"."lat-lon.de</ElectronicMailAddress>\n";
			print output "\t\t\t<Address>\n";
				print output "\t\t\t\t<DeliveryPoint>Aennchenstr. 19</DeliveryPoint>\n";
				print output "\t\t\t\t<City>Bonn</City>\n";
				print output "\t\t\t\t<AdministrativeArea>NRW</AdministrativeArea>\n";
				print output "\t\t\t\t<PostalCode>53177</PostalCode>\n";
				print output "\t\t\t\t<Country>Germany</Country>\n";
			print output "\t\t\t</Address>\n";
			print output "\t\t\t<OnlineResource>http://www.deegree.org</OnlineResource>\n";
			print output "\t\t\t<HoursOfService>24x7</HoursOfService>\n";
			print output "\t\t\t<ContactInstructions>Do not hesitate to call</ContactInstructions>\n";
			print output "\t\t\t<Role>PointOfContact</Role>\n";
		print output "\t\t</ServiceContact>\n";
	print output "\t</ServiceProvider>\n";
print output "</deegreeServicesMetadata>";