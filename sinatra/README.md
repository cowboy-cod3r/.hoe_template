## Infrastructure Monitoring

* Author:  Sean Humbarger (sean.humbarger@issinc.com)

### DESCRIPTION
This is a common utility that should be used to provide monitoring capabilities of basic system resources while executing an IV&V.

### BUILD INSTRUCTIONS
1. Update the version number in the VERSION file
2. Add any new files to the gemspec as necessary
3. Add any new require statements to the root library file as necessary
4. Build the gem

          gem build ivv-monitoring.gemspec
        
### INSTALLATION INSTRUCTIONS

#### Auto Installation
1. Issue the following commands.  Note that if you are on linux, depending on your setup, you may need to add `sudo` to the begining of each command:

          # Add the gem source if you do not already have it
          gem sources --add http://172.20.11.254:8808
          
          # Install the gem, dependencies will automatically be downloaded as well
          gem install ivv-monitoring
          
#### Manual Installation
1. Assuming ruby is installed and you are currently the root user, install this gem with the following command:

          gem install ivv-monitoring-<version>.gem --local

#### Endpoints
The following section will describe the endpoints that can be accessed by this tool.  Replace the $HOST and $PORT variables as appropriate.  The default port is 8090

          # Return physical memory statistics
          http://$HOST:$PORT/ivv-monitoring/memory/physical

          # Return a list of valid memory units
          http://$HOST:$PORT/ivv-monitoring/memory/units         