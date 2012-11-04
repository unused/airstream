Gem::Specification.new do |s|
  s.name = "airstream"
  s.version = "0.2.1"
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
  s.add_dependency('optparse')
  s.add_dependency('airplay')
  s.add_dependency('ruby-progressbar')
  s.add_dependency('digest')
  s.add_dependency('fileutils')
  s.add_dependency('yaml')
  s.add_development_dependency('rake')
end
