/**
* Logging Flex and AS3 projects with Firebug using ThunderBolt AS3
* 
* @version	0.9.2
* @author	Jens Krause [www.websector.de]
* @date		07/21/07
* @see		http://www.websector.de/blog/?s=thunderbolt
* @see		http://code.google.com/p/flash-thunderbolt/
* @source	http://flash-thunderbolt.googlecode.com/svn/trunk/as3/
* 
* ***********************
* HAPPY LOGGING ;-)
* ***********************
* 
*/

package org.osflash.thunderbolt
{
	import flash.external.ExternalInterface;
	import flash.utils.describeType;
	
	/**
	* Thunderbolts AS3 Logger class
	*/
	public class Logger
	{
		//
		// Firebug supports 4 log levels only
		public static const INFO: String = "info";
		public static const WARN: String = "warn";
		public static const ERROR: String = "error";
		public static const LOG: String = "log";

		protected static const FIELD_SEPERATOR: String = " :: ";		
		protected static const MAX_DEPTH: int = 255;	
		private static var _stopLog: Boolean = false;

		private static var depth: int;	
		private static var logLevel: String;						

		public static var includeTime: Boolean = true;	

		/**
		 * Logs info messages including objects for calling Firebug
		 * 
		 * @param 	msg				log message 
		 * @param 	logObjects		log objects
		 * 
		 */		
		public static function info (msg: String = null, ... logObjects): void
		{
			Logger.trace(Logger.INFO, msg, logObjects);			
		}
		
		/**
		 * Logs warn messages including objects for calling Firebug
		 * 
		 * @param 	msg				log message 
		 * @param 	logObjects		log objects
		 * 
		 */		
		public static function warn (msg: String = null, ... logObjects): void
		{
			Logger.trace(Logger.WARN, msg, logObjects);			
		}

		/**
		 * Logs error messages including objects for calling Firebug
		 * 
		 * @param 	msg				log message 
		 * @param 	logObjects		log objects
		 * 
		 */		
		public static function error (msg: String = null, ... logObjects): void
		{
			Logger.trace(Logger.ERROR, msg, logObjects);			
		}
		
		/**
		 * Logs debug messages messages including objects for calling Firebug
		 * 
		 * @param 	msg				log message 
		 * @param 	logObjects		log objects
		 * 
		 */		
		public static function debug (msg: String = null, ... logObjects): void
		{
			Logger.trace(Logger.LOG, msg, logObjects);			
		}		
				 
		/**
		 * Calls Firebugs command line API to write log information
		 * 
		 * @param 	level			log level 
 		 * @param 	msg				log message 
		 * @param 	logObjects		log objects
		 */			 
		public static function trace (level: String, msg: String = null, ... logObjects): void
		{
		 	depth = 0;
		 	// get log level
		 	logLevel = level;
		 	// add log level to log messagef
		 	var logMsg: String = "[" + logLevel.toUpperCase() + "] ";
	    	// add time	to log message
    		if (includeTime) logMsg += getCurrentTime();
			// add message text to log message
		 	logMsg += (msg != null && msg.length) ? msg : "";
		 	// call Firebug		 	
		 	ExternalInterface.call("console." + logLevel, logMsg);
		 	// log objects	 	
			for (var i:uint = 0; i < logObjects.length; i++) 
			{
	        	Logger.logObject(logObjects[i]);
	    	}	 	
		}
				
		/**
		 * Logs nested instances and properties
		 * 
		 * @param 	logObj		log object
		 * @param 	id			short description of log object
		 */	
		private static function logObject (logObj: *, id: String = null): void
		{	
			
			
			if (depth < Logger.MAX_DEPTH)
			{
				++ depth;
				
				var propID: String = id || "";
				var description:XML = describeType(logObj);				
				var type: String = description.@name;
				
				if (primitiveType(type))
				{					
					var msg: String = (propID.length) 	? 	"[" + type + "] " + propID + " = " + logObj
														: 	"[" + type + "] " + logObj;
															
					ExternalInterface.call("console." + Logger.LOG, msg);
				}
				else if (type == "Object")
				{
				  	ExternalInterface.call("console.group", "[Object] " + propID);				  	
				  	for (var element: String in logObj)
				  	{
				  		logObject(logObj[element], element);				  		
				  	}
				  	ExternalInterface.call("console.groupEnd");
				}
				else if (type == "Array")
				{
				  	/* don't create a group on depth 1 when we are using the ... (rest) parameter calling by Logger.trace() ;-) */
				  	if (depth > 1) ExternalInterface.call("console.group", "[Array] " + propID);					  					  	
				  	for (var i: int = 0; i < logObj.length; i++)
				  	{
				  		logObject(logObj[i]);				  		
				  	}
				  	ExternalInterface.call("console.groupEnd");					  			
				}
				else
				{
					// log private props as well - thx Rob Herman [http://www.toolsbydesign.com] ;-)
					var list: XMLList = description..accessor;					
					
					if (list.length())
					{
						for each(var item: XML in list)
						{
							var propItem: String = item.@name;
							var typeItem: String = item.@type;							
							var access: String = item.@access;
							
							// log objects && properties accessing "readwrite" and "readonly" only 
							if (access && access != "writeonly") 
							{
								//TODO: filter classes
								// var classReference: Class = getDefinitionByName(typeItem) as Class;
								var valueItem: * = logObj[propItem];
								logObject(valueItem, propItem);
							}
						}					
					}
					else
					{
						logObject(logObj, type);					
					}
				}

			}
			else
			{
				// call one stop message only ;-)
				if (!_stopLog)
				{
					ExternalInterface.call("console." + Logger.WARN, "STOP LOGGING: More than " + depth + " nested objects or properties.");
					_stopLog = true;
				}			
			}									
		}
			
		/**
		 * Checking for primitive types
		 * 
		 * @param 	type				type of object
		 * @return 	isPrimitiveType 	isPrimitiveType
		 * 
		 */							
		private static function primitiveType (type: String): Boolean
		{
			var isPrimitiveType: Boolean;
			
			switch (type) 
			{
				case "Boolean":
				case "void":
				case "int":
				case "uint":
				case "Number":
				case "String":
				case "undefined":
				case "null":
					isPrimitiveType = true;
				break;			
				default:
					isPrimitiveType = false;
			}

			return isPrimitiveType;
		}

		/**
		 * Creates a valid time value
		 * @param 	number     	Hour, minute or second
		 * @return 	string 		A valid hour, minute or second
		 */
		 
		private static function getCurrentTime ():String
	    {
    		var currentDate: Date = new Date();
    		
			var currentTime: String = 	"time "
										+ timeToValidString(currentDate.getHours()) 
										+ ":"
										+ timeToValidString(currentDate.getHours()) 
										+ ":" 
										+ timeToValidString(currentDate.getMinutes()) 
										+ ":" 
										+ timeToValidString(currentDate.getSeconds()) 
										+ "." 
										+ timeToValidString(currentDate.getMilliseconds()) + FIELD_SEPERATOR;
			return currentTime;
	    }
	    		
		/**
		 * Creates a valid time value
		 * @param 	number     	Hour, minute or second
		 * @return 	string 		A valid hour, minute or second
		 */
		 
		private static function timeToValidString(timeValue: Number):String
	    {
	        return timeValue > 9 ? timeValue.toString() : "0" + timeValue.toString();
	    }
		
		
	}
}