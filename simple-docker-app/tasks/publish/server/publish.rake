require 'logger'

log = Logger.new($stdout)

# Offline Configuration
namespace :publish do
  desc "Publish a local Jenkins image to the private Docker registry"
  task :jenkins_server do
    sh File.join(File.dirname(__FILE__),'publish.sh')
  end
end
