require 'logger'

log = Logger.new($stdout)

# Build
namespace :build do
  desc "Builds all Jenkins Containers"
  task :jenkins_server do
    sh File.join(File.dirname(__FILE__),"build.sh")
  end
end
