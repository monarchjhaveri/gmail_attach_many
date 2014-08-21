# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gmail_attach_many/version'

Gem::Specification.new do |spec|
  spec.name          = "gmail_attach_many"
  spec.version       = GmailAttachMany::VERSION
  spec.authors       = ["Monarch Jhaveri"]
  spec.email         = ["monarchjhaveri@gmail.com"]
  spec.summary       = "Attach multiple files to messages"
  spec.description   = "Easily attach many files to Gmail messages. If the files total more than 25 MB, they will be sorted alphabetically and distributed amongst multiple new messages, which you can then send."
  spec.homepage      = "https://github.com/monarchjhaveri/gmail_attach_many"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "gmail", ">= 0.4.0"
end
