#!/usr/local/bin/perl
use Config::Simple;
use XML::DOM;
#use strict;
#use warnings;

my $properties = new Config::Simple('00_properties.ini');
@epsg = $properties->param('epsg.epsg');
my $filename = $properties->param('filename.themes');

my $xmlParser = new XML::DOM::Parser;
my $inputFile = '../datasources/feature/xerleben_demo.xml';
my $file = $xmlParser->parsefile ($inputFile);

&parseThemes($file);

sub parseThemes {
	my $file = shift @_;
	my $nodes = $file->getElementsByTagName ("FeatureTypeMapping");
	my $n = $nodes->getLength;
	return if $n < 1;
	open output,">../themes/".$filename.".xml" or die "Can't open the output file!";
	print output "<Themes configVersion='3.2.0' xmlns='http://www.deegree.org/themes/standard' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:d='http://www.deegree.org/metadata/description' xmlns:s='http://www.deegree.org/metadata/spatial' xsi:schemaLocation='http://www.deegree.org/themes/standard http://schemas.deegree.org/themes/3.2.0/themes.xsd'>";
	for (my $i = 0; $i < $n; $i++) {
		my $node = $nodes->item ($i);

		my $elementTable = $node->getAttribute ("table");
		my $zeichenLaenge = length($elementTable);
		my $filename = substr($elementTable,3,$zeichenLaenge)."."."xml";	
		my $name = substr($elementTable,3,$zeichenLaenge);
		print output "\t<LayerStoreId>" . $name . "</LayerStoreId>\n";
	}
		print output "\t<Theme>\n";
		print output "\t\t<Identifier>xerleben</Identifier>\n";
		print output "\t\t<d:Title>Root theme</d:Title>\n";
		print output "\t\t<s:CRS>@epsg</s:CRS>\n";
		for (my $i = 0; $i < $n; $i++) {
			my $node = $nodes->item ($i);
			#&fileName;
			my $elementTable = $node->getAttribute ("table");
			my $zeichenLaenge = length($elementTable);
			my $filename = substr($elementTable,3,$zeichenLaenge)."."."xml";	
			#&title;
			my $elementName = $node->getAttribute ("name");
			my $zeichenLaenge = length($elementName);
			my $title = substr($elementName,6,$zeichenLaenge);	
			my $name = substr($elementTable,3,$zeichenLaenge);
			print output "\t\t<Theme>\n";
			print output "\t\t\t<Identifier>" . $name . "</Identifier>\n";
			print output "\t\t\t<d:Title>XE " . $title . "</d:Title>\n";
			print output "\t\t\t<Layer>" . $name . "</Layer>\n";
			print output "\t\t</Theme>\n";
		}		
		print output "\t</Theme>\n";
	print output "</Themes>\n";
}