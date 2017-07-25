# cording: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'term/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'term'
  s.version     = Term::VERSION
  s.summary     = 'A toolkit of Terminal.'
  s.description = 'A toolkit of Terminal. Rich support for color, mouse, and lightweight component.'

  s.required_ruby_version = '>= 2.0.0'

  s.licenses    = 'MIT'

  s.authors     = 'cuihq'
  s.email       = 'cuihaiqin@gmail.com'
  s.homepage    = 'http://github.com/cuihq/term'

  s.files       = Dir['LICENSE.txt', 'README.md', "lib/**/*"]
  s.require_path = 'lib'

  s.add_dependency 'artii'
  s.add_dependency 'rqrcode'
  s.add_dependency 'unicode-display_width'
  s.add_dependency 'rouge'

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'pry-byebug'
  s.add_development_dependency 'rb-readline'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'rubycritic'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'reek'
end
