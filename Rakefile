require 'rubygems/package_task'
require 'rake/testtask'
require 'rake/notes/rake_task'

task :default => [:test]

task :default => 'test'

spec = eval(File.read('airstream.gemspec'))
Gem::PackageTask.new(spec) do |pkg|
end

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
end
