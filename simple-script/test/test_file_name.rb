# == DESCRIPTION
# Performs Tests
#
# == ASSERTIONS
# Testing is performed by minitest.  You can find assertions here:
#   * http://www.ruby-doc.org/stdlib-1.9.3/libdoc/minitest/unit/rdoc/MiniTest/Assertions.html


# Set Classpath
$:.unshift(File.join(File.dirname(__FILE__),"..","lib"))

# Required Libraries (Any utilities as well as the files to test)
require 'minitest/autorun'

# Module Includes
include MiniTest::Assertions

class Test<%= project %> < MiniTest::Unit::TestCase

  def setup
    # Remove the write directory if it exists
    #FileUtils.rm_rf(WRITE_DIR) if File.exists?(WRITE_DIR)
    #FileUtils.mkdir_p(WRITE_DIR)
  end

  def teardown
    # close things
  end

  # ==== Description
  # Test
  def test_something()
   # Do stuff and then perform assertions
  end
end

