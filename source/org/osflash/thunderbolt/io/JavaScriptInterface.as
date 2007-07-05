import org.osflash.thunderbolt.Settings;
/**
 * @author Martin Kleppe <kleppe@gmail.com>
 */
class org.osflash.thunderbolt.io.JavaScriptInterface {

	private static var codeSnippet:String =  
	
		"var ThunderBolt = {" +
		
		"	storedTarget: null," +
		"	ElementID: null," +
		
		// display structure of flash target
		"	inspect: function(target, id){" +
		"		this.getFlash(id).inspect(this.getFullTarget(target));" +
		"	}," +

		// start the logger
		"	start: function(id){" +
		"		this.getFlash(id).start();" +
		"	}," +
		
		// stop the logger
		"	stop: function(id){" +
		"		this.getFlash(id).stop();" +
		"	}," +
				
		// filter output based on class
		"	filter: function(className, id){" +
		"		this.getFlash(id).filter(className);" +
		"	}," +		
		
		// run an expression within flash
		"	run: function(expression, id){" +
		"		this.getFlash(id).run(expression);" +
		"	}," +
		
		// assign a new value to the target
		"	set: function(target, value, id){" +
		"		this.getFlash(id).set(this.getFullTarget(target), value);" +
		"	}," +
		
		"	profile: function(target, id){" +
		"		this.getFlash(id).profile(target);" +
		"	}," +
		
		"	profileEnd: function(target, id){" +
		"		this.getFlash(id).profileEnd();" +
		"	}," +
		
		// set the target for future actions
		"	cd: function(path, id){" +
		
		"		if (path.indexOf('_root') == 0){" +
		"			this.storedTarget = path;	" +
		"		} else if (path){" +
		"			switch(path){" +
		"				case '.':	" +
		"				case '/': 	this.storedTarget = null; break;" +
		"				case '..':	this.storedTarget = this.storedTarget.split('.').slice(0,-1).join('.'); break;" +
		"				default: 	this.storedTarget = this.storedTarget ? this.storedTarget + '.' + path : path;" +
		"			}" +
		"		}" +
		"		this.inspect(id);" +
		"	}," +
	
		"	getFlash: function(id){" +
				// returns a reference of the flash Object or the first flash movie in document
		"		var d = document;		" +
		"		if( id ) {		" +
		"			ElementID = id;"+
		"			return d.getElementById(id);"+
		"		} else if( ElementID ){ return d.getElementById( ElementID );"+
		"		} else { return d.getElementsByTagName('embed')[0];}"+
		"	}," +
	
		// private method" 
		"	getFullTarget: function(target){" +
		"		if (!target){" +
		"			return this.storedTarget;" +
		"		} else {" +
		"			if (target.indexOf('_root') == 0) {" +
		"				return target;" +
		"			} else {" +
		"				return this.storedTarget ? this.storedTarget + '.' + target : target; " +
		"			}" +
		"		}" +
		"	}" +
		"};";
		
	public static function injectCode(){
	
		getURL("javascript:" + JavaScriptInterface.codeSnippet);
		getURL("javascript:var " + Settings.JAVASCRIPT_CONSOLE_SHORTCUT + " = ThunderBolt;");
	};
}