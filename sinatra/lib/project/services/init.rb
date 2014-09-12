$:.unshift(File.join(File.dirname(__FILE__),"..",".."))

# Required Libraries
require 'sinatra/base'
require 'ivv/monitoring/memory/physical'

# == Description
# This class is the initialization point for all endpoints
# pertaining to ivv-monitoring
class IvvMonitoring < Sinatra::Base
  
  # Constants
  CONTEXT = "ivv-monitoring"
  MEMORY_PATH = File.join(CONTEXT,"memory")
  
  def initialize()
    super()
  end
  
  # ==== Description
  # Retrieves physical memory attributes
  #
  # ==== Returns
  # json [String]
  get "/#{MEMORY_PATH}/physical" do
    pmem = IVV::Monitoring::Memory::Physical.instance()
    return pmem.get_physical_memory()
  end

  # ==== Description
  # Retrieves physical memory attributes
  #
  # ==== Returns
  # json [String]
  get "/#{MEMORY_PATH}/units" do
    pmem = IVV::Monitoring::Memory::Physical.instance()
    return pmem.memory_units()
  end
end
