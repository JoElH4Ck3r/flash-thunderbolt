# MTASC command line options #

MTASC command line options to enable debugging:

`mtasc -swf Sample.swf -cp path_to_thunderbolt -main Main.as -trace org.osflash.thunderbolt.Logger.trace org/osflash/thunderbolt/Logger`

```
mtasc 			
  -swf Sample.swf 				// target swf			
  -cp path_to_thunderbolt 			// where thunderbolt is located on your disc	
  -main Main.as 				// main entry point
  -trace org.osflash.thunderbolt.Logger.trace 	// thunderbolt trace facility
   osflash/thunderbolt/Logger 			// thunderbolt classes	
```