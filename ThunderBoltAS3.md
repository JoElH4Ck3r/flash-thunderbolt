![http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/ThunderBoltAS3_logo_wiki.png](http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/ThunderBoltAS3_logo_wiki.png)

# ThunderBolt AS3 #

ThunderBolt AS3 is a lightweight logger extension for Flex 2/3/4 and Flash ActionScript 3 applications using [Firebug](http://www.getfirebug.com) within [Firefox](http://www.mozilla.com/en-US/firefox/) as simple as possible.

It’s open source and based on the [Mozilla Public License 1.1.](http://www.mozilla.org/MPL/MPL-1.1.html)

### Using Flex Builder ###

1) In Flex Builder add the **ThunderBoltAS3\_Flex.swc** as your library file
(Flex Builder -> Your Project -> Properties -> Flex Build Path -> Library Path -> Add SWC)
or use the package located in org.osflash.thunderbolt

2a) Using ThunderBolt's **Logger.as** instance:

```
import org.osflash.thunderbolt.Logger;

var myNumber: int = 5;
var myString: String = "Lorem ipsum";
Logger.error ("Logging two objects: A number typed as int and a string", myNumber, myString);
```

2b) Or using **ThunderBoltTarget.as** based on the Flex Logging Framework:

```

<!--
	Using ThunderBoltTarget
	
	You can disable the time, level or category as follow:				
    includeTime = "false";
    includeLevel = "false";
    includeCategory = "false;"
    
    To use the TunderBolt AS3 Console set: 
    console="true"
    
    Using filters:          
	filters="{ ['ThunderBoltTargetExample'] }"
	
	Hide or show categories  
	includeCategory = true
	includeCategory = false
-->
	
<tb:ThunderBoltTarget id="tbTarget"
	xmlns:tb="org.osflash.thunderbolt.*"
	/>
```


### Using Flash CS3 ###

1) Create a new folder called "ThunderBoltAS3" in the Flash CS3 components folder located here

**OS X:** Mac HD:Application:Adobe Flash CS3:Configuration:Components

**WIN:** C:\Program Files\Adobe\Adobe Flash CS3\{lang}\Configuration\Components

Copy **ThunderBoltAS3\_Flash.swc** to it.

2) Open Flash IDE and select on the Component Panels (Windows -> Components) the Options menu  to refresh its view ("Reload"). You'll see a folder named "ThunderBoltAS3" within the Component Panel. Open this folder and drag the component called "Logger" to the Stage. Remove it. Then you'll have a ThunderBoltAS3 component in your library.


3) Using ThunderBolt's **Logger.as** instance:

```
import org.osflash.thunderbolt.Logger;

var myNumber: int = 5;
var myString: String = "Lorem ipsum";
Logger.error ("Logging two objects: A number typed as int and a string", myNumber, myString);
```

### Using Flash CS4 ###

1) Link the SWC called **ThunderBoltAS3\_Flash.swc** to your project using Flash CS 4:

File -> Publish Settings -> Flash -> Settings -> Library path -> Browse to SWC file (red icon) -> Select "ThunderBoltAS3\_Flash.swc" (which you have downloaded + saved before) -> Press "Ok"

2) For testing open Action window (Window -> Actions) and type the following lines:

```
import org.osflash.thunderbolt.Logger;

var myNumber: int = 5;
var myString: String = "Lorem ipsum";
Logger.error ("Logging two objects: A number typed as int and a string", myNumber, myString);
```

3) Publish movie (File -> Publish) and open generated HTML within Firefox



### Additional features ###

1) Get the info about the memory in use by Flash Player:

```
Logger.info(Logger.memorySnapshot());
```

2) Stop logging - which hides all outputs to Firebug:
```
// stop logging
Logger.hide = true;
// resume logging
Logger.hide = false;
```

3) Info about the version you're using:
```
Logger.about();
```


### Any issues with... ###

1)  ...Flash Player security sandbox?

If you have any security issues with the Flash Player security sandbox set on your HTML page the value of the "allowScriptAccess" parameter to "always".

Note: "For SWF files running locally, calls to ExternalInterface.call() is sucessful only if the SWF file and the containing web page (if there is one) are in the local-trusted security sandbox. Calls to these methods fail if the content is in the local-with-networking or local-with-filesystem sandbox." (@see: [Flash Player security: Controlling access to scripts in a host web page](http://livedocs.adobe.com/flex/3/html/05B_Security_14.html#131683))

For more information check Adobes Flex 3 Developer's Guide: "[About ExternalInterface API security in Flex](http://livedocs.adobe.com/flex/3/html/passingarguments_6.html)" and ["Flash Player security: Security sandboxes"](http://livedocs.adobe.com/flex/3/html/05B_Security_04.html#136901)

2) ...receiving empty messages in Firebugs console?

Please reload your site and try it again. It could be an issue connecting Firebug using ExternalInterface.

3) ...any else?

Feel free to post your issues on ThunderBolts [Issue page](http://code.google.com/p/flash-thunderbolt/issues/list) or describe it on [Google Thunderbolt Group](http://groups.google.com/group/flash-thunderbolt)

### Tutorials / Tips 'n' Tricks ###

You'll find [tutorials, tips and tricks for using ThunderBolt AS3](http://www.websector.de/blog/category/thunderbolt/) on [WS-Blog](http://www.websector.de/blog/).

### Live examples ###

[Live examples of ThunderBolt AS3 v.1.0 on WS-Blog](http://www.websector.de/blog/2007/10/14/thunderbolt-as3-10-released-a-lightweight-logging-tool-for-flex-2-and-flash-cs3-applications/)

### Download source ###

Grab [here](http://code.google.com/p/flash-thunderbolt/downloads/list) the latest ThunderBolt AS3 package.

### Author ###
[Jens Krause](http://www.websector.de/blog/) (aka sectore)