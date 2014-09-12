# == DESCRIPTION
# Provides the specification for this gem

Gem::Specification.new do |s|

  # Basic Specs
  s.name         = '<%= project %>'
  s.version      = File.read(File.join(File.dirname(__FILE__),"VERSION"))
  s.date         = '2013-09-06' # Change
  s.platform     = Gem::Platform::RUBY
  s.summary      = '<%= project %> Utility'
  s.description  = '<%= project %> Utility Descriptions'
  s.authors      = ['Sean Humbarger']
  s.email        = 'sean.humbarger@issinc.com'
  s.files        = Dir.glob("{lib,bin,scripts}/**/*") + %w(README.md LICENSE <%= project %>.gemspec config.ru)
  s.homepage     = 'http://www.issinc.com'
  s.executables  = '<%= project %>'

  # Runtime Dependency (add more here as appropriate)
  s.add_runtime_dependency 'sinatra',    '>= 1.4.4'
  s.add_runtime_dependency 'thin',       '>= 1.6.1'
end
