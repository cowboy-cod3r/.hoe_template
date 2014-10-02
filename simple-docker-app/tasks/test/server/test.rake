require 'logger'
require 'rake/testtask'

log = Logger.new($stdout)

# Test
namespace :test do
  desc "Run Docker related tests to Jenkins"
  Rake::TestTask.new :jenkins_server do |t|
    t.test_files = FileList[File.join(File.dirname(__FILE__),'..','..','..','test','test_*.rb')]
    t.verbose    = true
  end
end
