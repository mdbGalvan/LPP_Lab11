# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ULL-ETSII-Alu3299-LambdaRegexp/version'

Gem::Specification.new do |gem|
  gem.name          = "ULL-ETSII-Alu3299-LambdaRegexp"
  gem.version       = ULL::ETSII::Alu3299::LambdaRegexp::VERSION
  gem.authors       = ["mdbgalvan"]
  gem.email         = ["magomenlopark@gmail.com"]
  gem.description   = %q{Expresiones regulares}
  gem.summary       = %q{Cazador de prefijos}
  gem.homepage      = "https://github.com/mdbGalvan/LPP_Lab11"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
