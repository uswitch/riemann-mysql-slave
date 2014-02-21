require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'
require 'find'

# Don't include resource forks in tarballs on Mac OS X.
ENV['COPY_EXTENDED_ATTRIBUTES_DISABLE'] = 'true'
ENV['COPYFILE_DISABLE'] = 'true'

# Gemspec
gemspec = Gem::Specification.new do |s|
  s.rubyforge_project = 'riemann-mysql-slave'

  s.name = 'riemann-mysql-slave'
  s.version = '0.1.2'
  s.author = 'Christian Blunden'
  s.email = 'christian.blunden@uswitch.com'
  s.homepage = 'https://github.com/uswitch/riemann-mysql-slave'
  s.platform = Gem::Platform::RUBY
  s.summary = 'MySQL client that submit slave status events to Riemann.'

  s.add_dependency 'riemann-tools', '>= 0.1.9'
  s.add_dependency 'mysql2', '>= 0.3.13'

  s.files = FileList['lib/**/*', 'bin/*', 'LICENSE', 'README.md'].to_a
  s.executables |= Dir.entries('bin/')
  s.require_path = 'lib'
  s.has_rdoc = false

  s.required_ruby_version = '>= 1.8.7'
end

Gem::PackageTask.new gemspec do |p|
end

RDoc::Task.new do |rd|
  rd.main = 'Riemann Slave MySQL'
  rd.title = 'Riemann Slave MySQL'
  rd.rdoc_dir = 'doc'

  rd.rdoc_files.include('lib/**/*.rb')
end
