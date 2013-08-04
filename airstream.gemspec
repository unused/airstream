$LOAD_PATH.push File.expand_path("../lib", __FILE__)
require 'airstream'

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
lib/airstream/version.rb
lib/airstream/video.rb
)
  s.require_paths << 'lib'
  s.executables = ["airstream", "airimg"]
  s.add_dependency('airplay')
  s.add_dependency('ruby-progressbar')
  s.add_dependency('rack')
  s.add_dependency('webrick')
  s.add_development_dependency('rake')
end
