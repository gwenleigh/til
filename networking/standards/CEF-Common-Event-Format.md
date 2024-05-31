# Common Event Format (CEF)
1. An open log format for improved compatibility across different log data management systems. 
2. It makes it easier to integrate / exchange SIEM event data.
3. Composition and Syntax     
  3-1. **Header**: Contains information about the event producer and the type of event.  
      - `CEF:0|SecurityVendor|Product|Version|SignatureID|Name|Severity|Extension`     
  3-2. **Extension Fields**: It supports the inclusion of additional fields beyond the predefined ones, enabling organisations to customize the logs according to their specific needs without sacrificing the standard structure.   
      - An event can contain any number of key-value pairs in any order, separated by spaces (" "). If a field contains a space, such as a file name, this is valid and can be logged in exactly that manner. from `src` key pair onwards are the additional information included in the extension.
      - `Sep 19 08:26:10 host CEF:0|Security|threatmanager|1.0|100|worm successfully stopped|10|src=10.0.0.1 dst=2.1.2.2 spt=1232 filePath=/user/username/dir/my file name.txt`

### Official documentation 
- [Implementing ArcSight Common Event Format
(CEF) - Version 26](https://www.microfocus.com/documentation/arcsight/arcsight-smartconnectors-8.4/pdfdoc/cef-implementation-standard/cef-implementation-standard.pdf)