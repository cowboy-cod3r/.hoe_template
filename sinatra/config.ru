# == DESCRIPTION
# Rackup config.ru file used to start the service.
# TODO: Need more info on this file

# Update Classpath
$:.unshift(File.join(File.dirname(__FILE__),"lib"))

# Required Libraries
require '<%= project %>/services/init' # Update this require statement as appropriate
require 'sinatra'

# Start the Sinatra App
run <%= project %> # Needs to be the classname in the init script that is the subclass of Sinatra::Base
