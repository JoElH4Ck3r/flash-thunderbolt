# Ant Build File for using ThunderBolt AS2 #

Use this [Ant file](http://ant.apache.org/manual/) in your projects to quickly enable debugging:

```
<target name="compile" description="Compile example swf using MTASC and Thunderbolt">
	
	<property name="target.swf" 			value="sample.swf"/>
	<property name="mainclass" 			value="Sample.as" />	

	<echo>Compile ${target.swf}</echo>
	<echo>Class: ${mainclass}</echo>	
	
	<exec executable="${mtasc.app}">

		<!-- add standard class paths -->
		<arg value="-cp"/>
		<arg value="${example.classpath}"/>

		<arg value="-cp"/>
		<arg value="${flash.classpath}"/>

		<!-- set output file -->
		<arg value="-swf"/>
		<arg value="${deploy.folder}\${target.swf}"/>
		
		<!-- call main entry point -->
		<arg value="-main"/>
		<arg value="${mainclass}"/>			
		
		<!-- add thunderbolt classes -->
		<arg value="-cp"/>
		<arg value="${thunderbolt.classpath}"/>
		
		<!-- set thunderbolt trace facility  -->
		<arg value="-trace"/>
		<arg value="org.osflash.thunderbolt.Logger.trace"/>
		<arg value="org/osflash/thunderbolt/Logger"/>
		
	</exec>
	
</target>
```