#!/usr/local/bin/perl
use Config::Simple;
use XML::DOM;
#use strict;
#use warnings;

my $properties = new Config::Simple('config/01_properties.ini');

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

	open output,">../services/html.gfi" or die "Can't open the output file! See";
	
	print output "<?map props>";
	for (my $i = 0; $i < $n; $i++) {
		my $node = $nodes->item ($i);
		my $elementTable = $node->getAttribute ("table");
		my $zeichenLaenge = length($elementTable);
		my $filename = substr($elementTable,3,$zeichenLaenge);
		my $name = substr($elementTable,3,$zeichenLaenge);
		my $elementName = $node->getAttribute ("name");
		my $zeichenLaenge = length($elementName);
		my $title = substr($elementName,6,$zeichenLaenge);	
		print output "XE_".$title."=".$title."\n";
	}
	
	print output "<?map ftname>";
	for (my $i = 0; $i < $n; $i++) {
		my $node = $nodes->item ($i);
		my $elementTable = $node->getAttribute ("table");
		my $zeichenLaenge = length($elementTable);
		my $filename = substr($elementTable,3,$zeichenLaenge);
		my $name = substr($elementTable,3,$zeichenLaenge);
		my $elementName = $node->getAttribute ("name");
		my $zeichenLaenge = length($elementName);
		my $title = substr($elementName,6,$zeichenLaenge);	
		print output "XE_".$title."=".$title."\n";
	}
}