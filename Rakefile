require 'rubygems/package_task'
require 'rake/testtask'

task :default => [:test]

spec = eval(File.read('airstream.gemspec'))
Gem::PackageTask.new(spec) do |pkg|
end

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end
