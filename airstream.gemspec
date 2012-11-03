Gem::Specification.new do |s|
  s.name = "airstream"
  s.version = "0.1.0"
  s.platform = Gem::Platform::RUBY
  s.authors = ["Christoph Lipautz"]
  s.email = ["christoph at lipautz.org"]
  s.homepage = "http://www.lipautz.org/"
  s.summary = %q{A command line tool for streaming to airplay-devices}
  s.description = %q{airstream allows to stream video and image files to
                     airplay-devices, a webserver is needed for local video
                     files}
  s.rubyforge_project = "airstream"
  s.files = ["bin/airstream", "bin/airimg"]
  s.executables = ["airstream", "airimg"]
end
