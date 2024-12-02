# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amazon_book/version'

Gem::Specification.new do |spec|
  spec.name          = 'amazon_book'
  spec.version       = AmazonBook::VERSION
  spec.authors       = ['Maciej Gajewski', 'Anna Klimas']
  spec.email         = ['support@altmetric.com']

  spec.summary       = 'Parses Amazon book links'
  spec.description   = 'Use it to parse Amazon book links (extract ISBNs etc.)'
  spec.homepage      = 'https://github.com/altmetric/amazon_book'
  spec.license       = 'MIT'

  spec.files = %w[README.md LICENSE] + Dir['lib/**/*.rb']

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'identifiers', '~> 0.9'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
