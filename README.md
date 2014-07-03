# deegree-workspace-xerleben

## XErleben Schema

The XErleben schema (abbr. XE) is a GML application schema. The schema is divided into 8 sub-schemes and can be download as a zip archive from [XErleben] [1].
Have a look at [XErleben Complex Workspace](#deegree-workspace-xerleben-complex) to use the full GML application schema with complex FeatureTypes . If you want to use non-complex FeatureTypes have a look at [XErleben Syn Workspace](#deegree-workspace-xerleben-syn).

## XErleben Complex Workspace

The XErleben Complex Workspace is based on the complex XErleben GML application schema (using complex FeatureTypes).

### Set up workspace

#### Configuration
Please configure the Perl script in:

	~/deegree-workspace-xerleben/deegree-workspace-xerleben-complex/scripts/config/01_properties.ini
	
For exapmle:

	[jdbc]
	url="jdbc:postgresql://localhost:5432/xerleben"
	user=postgres
	password=postgres

	[metadata_wfs]
	title=XErleben WFS
	abstract=Web Feature Service Demonstration XErleben

#### Execute

Run the command to create the XErleben workspace:

	chmod a+x
	./createWorkspace.sh
	
inside this directory:

	~/deegree-workspace-xerleben/deegree-workspace-xerleben-complex/scripts/

While execution, the following directories are created:

	jdbc/
	layers/
	services/
	styles/
	themes/
	
Hint: The FeatureStore configuration is required.

## XErleben Syn Workspace

The XErleben Syn Workspace is based on an ESRI ShapeFile (using non-complex FeatureTypes).

  [1]: http://www.xerleben.de