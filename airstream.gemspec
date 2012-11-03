Gem::Specification.new do |s|
  s.name = "airstream"
  s.version = "0.2.0"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Christoph Lipautz"]
  s.email = ["christoph at lipautz.org"]
  s.homepage = "https://github.com/unused/airstream"
  s.summary = %q{A command line tool for streaming to airplay-devices}
  s.description = %q{A command line tool to stream video and image files to
                     airplay-devices, a webserver is needed for local video
                     files.}
  s.files = ["bin/airstream", "bin/airimg"]
  s.executables = ["airstream", "airimg"]
end
