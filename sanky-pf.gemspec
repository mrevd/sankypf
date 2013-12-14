require File.expand_path('../lib/sanky/pathfinder/version', __FILE__)

Gem::Specification.new do |s|
  s.name                  = "sanky-pf"
  s.summary               = "Open files on the sanky server"
  s.description           = File.read("./README.md")
  s.version               = Sanky::PathFinder::VERSION
  s.author                = "Matt Ryan"
  s.email                 = "m@mrevd.me"
  s.homepage              = "https://github.com/sankynet/sankypf"
  s.platform              = Gem::Platform::RUBY
  s.required_ruby_version = ">=1.9"
  s.files                 = Dir['**/**']
  s.executables           = [ "sanky-pf" ]
  s.test_files            = Dir['test/test*.rb']
  s.has_rdoc              = false

  s.add_runtime_dependency 'colorize'
  s.add_development_dependency 'shoulda'
end
