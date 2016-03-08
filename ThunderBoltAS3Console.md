# ThunderBolt AS3 Console #

![http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_inaction.png](http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_inaction.png)

### What is the ThunderBolt AS3 Console? ###

ThunderBolt AS3 Console is an [Adobe AIR](http://www.adobe.com/products/air/) application to use ThunderBolt AS3 without Firebug. That means, you can use ThunderBolt AS3 without opening your application within Firefox, which is very important for logging any AIR application using Thunderbolt AS3.

For logging without Firebug, ThunderBolt AS3 uses the well-known trace() methods in a special manner, which are stored in the flashlog.txt. ThunderBolt AS3 Console reads this file and displays all information using different log views in a same way as Firebug it does.

Full source is available, which based on [Mozilla Public License 1.1.](http://www.mozilla.org/MPL/MPL-1.1.html).



### Install instruction ###

Just grab the [latest version of ThunderBolt AS3 Console](http://code.google.com/p/flash-thunderbolt/downloads/list) and run its AIR install file. For this issue you have to installed the latest [Adobe® AIR™ runtime](http://www.adobe.com/products/air/).


### Usage ###
First of all: To use ThunderBolt AS3 Console you have to check if you've installed the [Flash Debug Player 9.0.115 or above](http://www.adobe.com/support/flashplayer/downloads.html).

Run the ThunderBoltAS3Console.app and follow the instruction to point out the [flashlog.txt](http://livedocs.adobe.com/flex/3/html/logging_04.html).

Log your application  as described here: [ThunderBolt AS3 for logging ActionScript 3 including Flex 2/3 projects](http://code.google.com/p/flash-thunderbolt/wiki/ThunderBoltAS3)

**Note:** ThunderBolt AS3 Console uses the latest version of ThunderBolt AS3 version 2.0 or above, which is located within the .zip package mentioned above as well!

### Behind the scenes ###
ThunderBolt AS3 Console is an [Adobe AIR](http://www.adobe.com/products/air/) application developed by [Jens Krause](http://www.websector.de/blog/) (aka sectore).


The architecture based on [Tom Bray’s easyMVC concept](http://www.tombray.com/category/easymvc/), which helps to build a well structured application as quick as possible using the MVC pattern.

ThunderBolt AS3 Console uses the following libraries as well:
  * [Yahoo! UI Library TreeView](http://developer.yahoo.com/yui/treeview/) for the logging tree. Well, it based on HTML and JavaScript using the [AIR based HTML component](http://livedocs.adobe.com/flex/3/langref/mx/controls/HTML.html)
  * [Degrafa](http://www.degrafa.com/) for all the skinning stuff.


### Known issues ###

  * **"flashlog.txt" is not found on OS X ("Leopard")**

- Open your HOME folder (named as your username) and create a text file called mm.cfg
- Type the following lines into mm.cfg.
Note: type for {your\_username} your user name

```
TraceOutPutFileName=/Users/{your_username}/Library/Preferences/Macromedia/Flash Player/Logs/flashlog.txt
ErrorReportingEnable=1
TraceOutputFileEnable=1
MaxWarnings=10
```

- Create an empty text file called "flashlog.txt" and save it within the folder typed before: /Users/{your\_username}/Library/Preferences/Macromedia/Flash Player/Logs/

- Close all opened browser to restart your Flashplayer
- Open ThunderBolt AS3 Console and "connect" it with the flashlog.txt located in /Users/{your\_username}/Library/Preferences/Macromedia/Flash Player/Logs/

  * **On Windows**

On Windows the "flashlog.txt" is locked by an opened AIR app. That means, the ThunderBolt AS3 Logger can't log any information to "flashlog.txt" on Windows.

This is an known issues, which is already posted at Adobes Bug System: [AIR puts a read-only lock on flashlog.txt](http://bugs.adobe.com/jira/browse/SDK-14536). Oliver Goldman, an Engineer of the Adobe AIR Team, confirms this issue: ["Why does AIR lock the flashlog.txt on Windows?"](http://www.adobe.com/cfusion/webforums/forum/messageview.cfm?catid=697&threadid=1368880)

Sorry for all the Windows user :-(

### More screen shots ###

![http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_options.png](http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_options.png)

![http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_flashlog.png](http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_flashlog.png)

![http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_update.png](http://flash-thunderbolt.googlecode.com/svn/trunk/as3/images/tbConsole_update.png)