# ThunderBolt #

ThunderBolt AS2 is a logger extension for Flash ActionScript 2 based on [MTASC](http://www.mtasc.org/#trace)´s trace facilitiy and the superb [Firebug](http://www.getfirebug.com) add-on for [Firefox](http://www.getfirefox.com).

#### Features: ####

  * Detailed information (class, file, line number, time, frame)
  * Log levels (info, warning, error, fatal)
  * Interactive tree view for complex object structures
  * Profiling (time spend during code execution)
  * Collapsible grouped output
  * Interactive console (inspect and modify object on runtime)

#### Screenshot ####

![http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_sample.gif](http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_sample.gif)

### Online Sample ###

_[See a sample application in action.](http://flash-thunderbolt.googlecode.com/svn/trunk/as2/example/deploy/thunderbolt.html)_

### Download ###

There are three ways to get the source files:
  * [Download zipped ActionScript Package](http://flash-thunderbolt.googlecode.com/svn/trunk/as2/thunderbolt_classes.zip)
  * [Browse subversion repository](http://flash-thunderbolt.googlecode.com/svn/).
  * [Checkout the subversion repository](http://code.google.com/p/flash-thunderbolt/source)

### More Screenshots ###

**Console output**

![http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_output.gif](http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_output.gif)

**Console inspect**

![http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_inspect.gif](http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_inspect.gif)

**Console details**

![http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_details.gif](http://flash-thunderbolt.googlecode.com/svn/trunk/as2/docs/img/console_details.gif)

### Debug Information ###

| `description` | `my.package.MyClass::myMethod[123] : type @ 18:59:59` |
|:--------------|:------------------------------------------------------|
| `file`        | `./path/to/my/class/file.as`                          |
| `fullClass`   | `my.package.MyClass`                                  |
| `frame`       | `12`                                                  |
| `line`        | `123`                                                 |
| `method`      | `myMethod`                                            |
| `time`        | `18:59:59`                                            |
| `type`        | `string`                                              |

### Log Levels ###

By passing an extra literal to your `trace` actions, you can achieve multiple debug levels.

| d | debug | `trace('d This is a simple debug message.');` |
|:--|:------|:----------------------------------------------|
| i | info  | `trace('i An info icon will appear next to this line.');` |
| w | warn  | `trace('w This message is highlighted.');`    |
| e | error | `trace('e Red and highlited messages.');`     |


### Debug in Browser ###

Run this two commands to get more information on your objects during runtime:

```
// inspect obejcts and set attributes
ThundeBolt.inspect("Sample.APP.profileObject"); 				// inspect object
ThundeBolt.set("_root.logo._x", 20); 						// set new position
ThundeBolt.set("_root.logo.label.text", "Live hacking made possible!"); 	// change text
```
```
// set context for later inspection
ThundeBolt.cd("_root.logo.label"); 						// set new context
ThundeBolt.inspect("_x"); 							// x position of current content
ThundeBolt.cd(".."); 								// select parent movieclip
```
```
// execute methods
ThundeBolt.run("Sample.APP.randomizeAlpha(100)"); 				// run a method
ThundeBolt.run("Sample.APP.restoreAlpha()"); 					// run another method
```
```
// test performance
ThundeBolt.profile("Sample.APP.profileObject"); 				// start profiling for all methods in object
ThundeBolt.run("Sample.APP.profileObject.method2()"); 				// execute profiling test
ThundeBolt.profileEnd(); 							// stop profiling and see results
```

### Acknowledgment ###

  * [Manfred Weber](http://manfred.dschini.org/)
  * [Sebastian Wichmann](http://www.flashhilfe.de/)
  * [Jens Krause](http://www.websector.de/)