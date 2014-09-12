# Set the classpath
$:.unshift(File.join(File.dirname(__FILE__),".."))

# Required Libraries
require 'optparse'
require 'yaml'
require 'singleton'
require 'ivv-logger'
require 'iss-utils'

# Modules
include ISS::Utils::Platform

class IVV
  class Monitoring
    class Args

      # Modules
      include Singleton
    
      # Setters/Getters
      attr_reader :options, :optparse
    
      # ==== Description
      # Constructor
      def initialize()
        @logger            = IVV::Logger::Log.instance()
        @options           = {}
        @required_switches = {}
        @optparse          = nil
        @subcommand        = nil
        define_options()
        required_switches()
      end
      
      # ==== Description
      # Defines the switches
      private
        def define_options()
          @optparse = OptionParser.new do | opts |
            opts.program_name = $0
            opts.banner = "\nUsage: ruby #{$0} [options]"

            @options[:port] = 4567
            descr = 'Required - The port to run the server on.'
            opts.on('-p', '--port PORT', descr) do | port |
              @options[:port] = port
            end              
            
            @options[:daemonize] = false
            descr = "Optional - Daemonizes this process"
            opts.on('-d', '--daemonize', descr) do | daemonize |
              @options[:daemonize] = daemonize
            end

            @options[:start] = nil
            descr = "Optional - Starts the <%= project %> Service"
            opts.on('-s', '--start', descr) do | start |
              @options[:start] = start
            end

            @options[:stop] = nil
            descr = "Optional - Stops the <%= project %> Service"
            opts.on('-o', '--stop', descr) do | stop |
              @options[:stop] = stop
            end              

            # Help Option
            opts.on('-h','--help','Optional - Display this screen') do 
              puts opts
              Kernel.abort
            end
          end

          # Parse the options
          begin
            @optparse.parse!
          rescue Exception => e
            puts
            @optparse.help()
            Kernel.abort
          end
        end
      
      # ==== Description
      # Ensures that required switches are passed in
      # Displays the help if it finds the required switches are not passed in
      private
        def required_switches()
          status = 0
          @required_switches.each do | key,value |
            if value.nil?
              status = 1
              @logger.error("'#{key}' switch must be provided when executing the command")
            end
          end
          
          if status == 1
            puts @optparse.help()
            Kernel.abort
          end

          if @options[:start].nil? && @options[:stop].nil?
            puts "ERROR: You must provide either a --start or --stop switch."
            puts
            puts @optparse.help()
            Kernel.abort
          end
        end
    end
  end
end
