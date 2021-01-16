$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'airstream/version'

Gem::Specification.new do |s|
  s.name = "airstream"
  s.version = Airstream::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Christoph Lipautz"]
  s.email = ["christoph at lipautz.org"]
  s.homepage = "https://github.com/unused/airstream"
  s.summary = %q{A command line tool for streaming to airplay-devices}
  s.description = %q{A command line tool to stream video and image files to
                     airplay-devices.}
  s.files = %w(
bin/airstream
bin/airimg
lib/airstream.rb
lib/airstream/device.rb
lib/airstream/io.rb
lib/airstream/network.rb
lib/airstream/node.rb
lib/airstream/player.rb
lib/airstream/version.rb
lib/airstream/video.rb
)
  s.require_paths << 'lib'
  s.executables = ["airstream", "airimg"]


  s.add_dependency 'airplay', '~> 0.2.9'
  s.add_dependency 'ruby-progressbar', '~> 1.1.1'
  s.add_dependency 'rack', '~> 1.5.2'
  s.add_dependency 'webrick', '~> 1.3.1'

  s.add_development_dependency 'rake', '~> 13.0.3'
end
