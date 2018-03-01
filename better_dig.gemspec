
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "better_dig/version"

Gem::Specification.new do |spec|
  spec.name          = "better_dig"
  spec.version       = BetterDig::VERSION
  spec.authors       = ["Bernie Chiu"]
  spec.email         = ["bernie_chiu@hotmail.com"]

  spec.summary       = %q{Dig-like method for indifferent access of nested data lookup.}
  spec.description   = %q{Provide simple to use dig library for nested hash or array lookup}
  spec.homepage      = "https://github.com/berniechiu/better_dig"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
