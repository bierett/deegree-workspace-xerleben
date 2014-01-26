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

                        #Point
			print output "\t<Rule>\n";
                                print output "\t\t<Name>".$name."_point</Name>\n";
				print output "\t\t<Description>\n";
					print output "\t\t\t<Title>XE ".$title." (Point)</Title>\n";
				print output "\t\t</Description>\n";
				print output "\t\t<PointSymbolizer>\n";
					print output "\t\t\t<Geometry>\n";
						print output "\t\t\t\t<ogc:PropertyName>xe:lageAnfasspunkt</ogc:PropertyName>\n";
					print output "\t\t\t</Geometry>\n";
					print output "\t\t\t<Graphic>\n";

                                            print output "\t\t\t\t<Displacement>\n";
                                            print output "\t\t\t\t\t<DisplacementX>-5</DisplacementX>\n";
                                            print output "\t\t\t\t\t<DisplacementY>35</DisplacementY>\n";
                                            print output "\t\t\t\t</Displacement>\n";

						print output "\t\t\t\t<ExternalGraphic>\n";
							print output "\t\t\t\t\t<OnlineResource xmlns:xlink='http://www.w3.org/1999/xlink' xlink:type='simple' xlink:href='../symbols/png/XE_"."$title".".png'/>\n";
							print output "\t\t\t\t\t<Format>image/png</Format>\n";
						print output "\t\t\t\t</ExternalGraphic>\n";
						print output "\t\t\t\t<Size>80</Size>\n";
					print output "\t\t\t</Graphic>\n";
				print output "\t\t</PointSymbolizer>\n";

                                print output "\t\t<TextSymbolizer uom='pixel'>\n";
                                print output "\t\t\t<Label>\n";
                                print output "\t\t\t\t<ogc:PropertyName>xe:objektName</ogc:PropertyName>\n";
                                print output "\t\t\t</Label>\n";
                                print output "\t\t\t<Font>\n";
                                print output "\t\t\t\t<SvgParameter name='font-family'>Arial</SvgParameter>\n";
                                print output "\t\t\t\t<SvgParameter name='font-family'>Sans-Serif</SvgParameter>\n";
                                print output "\t\t\t\t<SvgParameter name='font-weight'>bold</SvgParameter>\n";
                                print output "\t\t\t\t<SvgParameter name='font-size'>13</SvgParameter>\n";
                                print output "\t\t\t</Font>\n";
                                print output "\t\t\t<LabelPlacement>\n";
                                print output "\t\t\t\t<PointPlacement>\n";
                                print output "\t\t\t\t\t<Displacement>\n";
                                print output "\t\t\t\t\t\t<DisplacementX>0</DisplacementX>\n";
                                print output "\t\t\t\t\t\t<DisplacementY>0</DisplacementY>\n";
                                print output "\t\t\t\t\t</Displacement>\n";
                                print output "\t\t\t\t</PointPlacement>\n";
                                print output "\t\t\t</LabelPlacement>\n";
                                print output "\t\t\t<Halo>\n";
                                print output "\t\t\t\t<Radius>1.2</Radius>\n";
                                print output "\t\t\t</Halo>\n";
                                print output "\t\t</TextSymbolizer>\n";

			print output "\t</Rule>\n";

                        #Line
                        print output "\t<Rule>\n";
				print output "\t\t<Name>".$name."_line</Name>\n";
				print output "\t\t<Description>\n";
					print output "\t\t\t<Title>XE ".$title." (Line)</Title>\n";
				print output "\t\t</Description>\n";
                                print output "\t\t<LineSymbolizer uom='meter'>\n";
                                    print output "\t\t\t<Geometry>\n";
                                        print output "\t\t\t\t<ogc:PropertyName>xe:lageVerlauf</ogc:PropertyName>\n";
                                    print output "\t\t\t</Geometry>\n";
                                    print output "\t\t\t<Stroke>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke'>#000000</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-opacity'>0.5</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-width'>1</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-linecap'>round</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-linejoin'>round</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-dasharray'>1 1</SvgParameter>\n";
                                    print output "\t\t\t</Stroke>\n";
                                print output "\t\t</LineSymbolizer>\n";
			print output "\t</Rule>\n";

                        #Polygon
                        print output "\t<Rule>\n";
				print output "\t\t<Name>".$name."_polygon</Name>\n";
				print output "\t\t<Description>\n";
					print output "\t\t\t<Title>XE ".$title." (Polygon)</Title>\n";
				print output "\t\t</Description>\n";
                                print output "\t\t<PolygonSymbolizer uom='meter'>\n";
                                    print output "\t\t\t<Geometry>\n";
                                        print output "\t\t\t\t<ogc:PropertyName>xe:lageFlaeche</ogc:PropertyName>\n";
                                    print output "\t\t\t</Geometry>\n";
                                    print output "\t\t\t<Fill>\n";
                                        print output "\t\t\t\t<SvgParameter name='fill'>#000000</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='fill-opacity'>0.5</SvgParameter>\n";
                                    print output "\t\t\t</Fill>\n";
                                    print output "\t\t\t<Stroke>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke'>#000000</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-opacity'>0.5</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-width'>1</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-linecap'>round</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-linejoin'>round</SvgParameter>\n";
                                        print output "\t\t\t\t<SvgParameter name='stroke-dasharray'>1 1</SvgParameter>\n";
                                    print output "\t\t\t</Stroke>\n";
                                print output "\t\t</PolygonSymbolizer>\n";
			print output "\t</Rule>\n";
		print output "</FeatureTypeStyle>\n";
	}
}