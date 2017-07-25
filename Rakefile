# cording: utf-8

require 'bundler/setup'
require 'rake'
require 'yard'

require "bundler/gem_tasks"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec)

YARD::Rake::YardocTask.new do |t|
 t.files   = ['lib/**/*.rb']
 t.options = ['--title', 'term']
 t.stats_options = ['--list-undoc']
end

task default: :spec
