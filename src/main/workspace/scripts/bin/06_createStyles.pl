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

&parseStyles($file);

sub parseStyles {
	my $file = shift @_;
	my $nodes = $file->getElementsByTagName ("FeatureTypeMapping");
	my $n = $nodes->getLength;
	return if $n < 1;
	
	for (my $i = 0; $i < $n; $i++) {
		my $node = $nodes->item ($i);

		my $elementTable = $node->getAttribute ("table");
		my $zeichenLaenge = length($elementTable);
		my $filename = substr($elementTable,3,$zeichenLaenge)."."."xml";
		
		my $elementName = $node->getAttribute ("name");
		my $zeichenLaenge = length($elementName);
		my $title = substr($elementName,6,$zeichenLaenge);	
		my $name = substr($elementTable,3,$zeichenLaenge);
		
		open output,">../styles/$filename" or die "Can't open the output file! See";
		print output "<FeatureTypeStyle xmlns='http://www.opengis.net/se' xmlns:ogc='http://www.opengis.net/ogc' xmlns:deegreeogc='http://www.deegree.org/ogc' xmlns:sed='http://www.deegree.org/se' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:xe='http://www.xerleben.de' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xsi:schemaLocation='http://www.opengis.net/se http://schemas.opengis.net/se/1.1.0/FeatureStyle.xsd http://www.deegree.org/se http://schemas.deegree.org/se/1.1.0/Symbolizer-deegree.xsd'>";
		print output "\t<Name>XE ".$title."</Name>\n";
		print output "\t<FeatureTypeName>xe:XE_".$title."</FeatureTypeName>\n";
			print output "\t<Rule>\n";
				print output "\t\t<Name>".$name."_point</Name>\n";
				print output "\t\t<Description>\n";
					print output "\t\t\t<Title>XE ".$title."</Title>\n";
				print output "\t\t</Description>\n";
				print output "\t\t<PointSymbolizer>\n";
					print output "\t\t\t<Geometry>\n";
						print output "\t\t\t\t<ogc:PropertyName>xe:lageAnfasspunkt</ogc:PropertyName>\n";
					print output "\t\t\t</Geometry>\n";
					print output "\t\t\t<Graphic>\n";
						print output "\t\t\t\t<ExternalGraphic>\n";
							print output "\t\t\t\t\t<OnlineResource xmlns:xlink='http://www.w3.org/1999/xlink' xlink:type='simple' xlink:href='../symbols/png/XE_"."$title".".png'/>\n";
							print output "\t\t\t\t\t<Format>image/png</Format>\n";
						print output "\t\t\t\t</ExternalGraphic>\n";
						print output "\t\t\t\t<Size>80</Size>\n";
					print output "\t\t\t</Graphic>\n";
				print output "\t\t</PointSymbolizer>\n";
			print output "\t</Rule>\n";
		print output "</FeatureTypeStyle>\n";
	}
}