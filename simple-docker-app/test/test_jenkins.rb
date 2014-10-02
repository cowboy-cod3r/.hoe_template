$:.unshift(File.join(File.dirname(__FILE__),'..','tasks','deploy','server'))

# == DESCRIPTION
# Performs Tests
#
# == ASSERTIONS
# Testing is performed by minitest.  You can find assertions here:
#   * http://www.ruby-doc.org/stdlib-1.9.3/libdoc/minitest/unit/rdoc/MiniTest/Assertions.html

# Required Libraries (Any utilities as well as the files to test)
require 'minitest/autorun'
require 'rest-client'
require 'rake'
require 'logger'

# Module Includes
include MiniTest::Assertions

class TestDockerJenkins < MiniTest::Unit::TestCase

  attr_accessor :scheme, :host, :port

  # ==== Description
  # Setup the scenario
  def setup
    # Set some variables
    @scheme       = "http"
    @host         = "localhost"
    @port         = 2080
    @context_path = 'jenkins'
    @base_url     = "%s://%s:%s" % [@scheme, @host, @port]
    @log          = Logger.new($stdout)

    # Deploy The Container
    Rake.application.rake_require('deploy')
    Rake.application['deploy:jenkins_server'].invoke
  end


  def teardown
    # Kill the container
    system("docker kill jenkins-server")
  end

  # ==== Description
  # Test
  def test_jenkins_listen()
    max             = 20
    code            = nil
    exception_count = 0

    max.times do |x|
      begin
        resource = RestClient::Resource.new(@base_url)
        code     = resource.get.code

        if code.to_s =~ /200/
          break
        else
          sleep 1
        end
      rescue Exception
        exception_count += 1
        if exception_count != max
          sleep 1
          retry
        else
          @log.error("Exceeded max exceptions of #{max} while listening for jenkins to start.")
          break
        end
      end
    end
    assert_equal(200, code)
  end
end

