require 'logger'

log = Logger.new($stdout)

# Deployment
namespace :deploy do
  desc "Deploys jenkins"
  task :jenkins_server do
    sh File.join(File.dirname(__FILE__),'deploy.sh')
  end
end
