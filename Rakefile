require 'rubygems/package_task'
require 'cucumber/rake/task'
require 'rake/testtask'

task :default => [:test, :features]

spec = eval(File.read('airstream.gemspec'))
Gem::PackageTask.new(spec) { |pkg| }

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end
