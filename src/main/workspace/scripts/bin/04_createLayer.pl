#!/usr/local/bin/perl
use Config::Simple;
use XML::DOM;
#use strict;
#use warnings;

my $properties = new Config::Simple('config/01_properties.ini');

@epsg = $properties->param('epsg.crs');
my $featurestore = $properties->param('filename.featurestore');

my $xmlParser = new XML::DOM::Parser;
my $inputFile = '../datasources/feature/'.$featurestore.'.xml';
my $file = $xmlParser->parsefile ($inputFile);

&parseLayer($file);

sub parseLayer {
	my $file = shift @_;
	my $nodes = $file->getElementsByTagName ("FeatureTypeMapping");
	my $n = $nodes->getLength;
	return if $n < 1;

	for (my $i = 0; $i < $n; $i++) {
		my $node = $nodes->item ($i);
		my $elementTable = $node->getAttribute ("table");
		my $zeichenLaenge = length($elementTable);
		my $filename = substr($elementTable,3,$zeichenLaenge);
		my $name = substr($elementTable,3,$zeichenLaenge);
		my $elementName = $node->getAttribute ("name");
		my $zeichenLaenge = length($elementName);
		my $title = substr($elementName,6,$zeichenLaenge);	
		open output,">../layers/".$filename.".xml" or die "Can't open the output file! See";
		print output "<FeatureLayers xmlns='http://www.deegree.org/layers/feature' xmlns:l='http://www.deegree.org/layers/base' xmlns:d='http://www.deegree.org/metadata/description' xmlns:s='http://www.deegree.org/metadata/spatial' xmlns:xe='http://www.xerleben.de' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation='http://www.deegree.org/layers/feature http://schemas.deegree.org/layers/feature/3.2.0/feature.xsd' configVersion='3.2.0'>\n";
			print output "\t<FeatureStoreId>".$featurestore."</FeatureStoreId>\n";
			print output "\t<FeatureLayer>\n";
				print output "\t\t<FeatureType xmlns:xe='http://www.xerleben.de'>xe:XE_".$title."</FeatureType>\n";
				print output "\t\t<l:Name>".$name."</l:Name>\n";
				print output "\t\t<d:Title>XE ".$title."</d:Title>\n";
				print output "\t\t<s:CRS>@epsg</s:CRS>\n";
				print output "\t\t<l:StyleRef>\n";
					print output "\t\t\t<l:StyleStoreId>".$name."</l:StyleStoreId>\n";
				print output "\t\t</l:StyleRef>\n";
			print output "\t</FeatureLayer>\n";
		print output "</FeatureLayers>\n";
	}
}