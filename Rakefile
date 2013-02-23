require 'rubygems/package_task'

spec = eval(File.read('airstream.gemspec'))

Gem::PackageTask.new(spec) do |pkg|
end

require 'rake/testtask'

Rake::TestTask.new do |t|
  require 'airstream'
  t.pattern = "test/*_test.rb"
end
