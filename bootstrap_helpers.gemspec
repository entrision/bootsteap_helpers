require_relative 'lib/bootstrap_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "bootstrap_helpers"
  spec.version       = BootstrapHelpers::VERSION
  spec.authors       = ["Robert D. Cotey II"]
  spec.email         = ["rcotey@entrision.com"]

  spec.summary       = %q{A set of helpers to generate bootstrap markup}
  spec.homepage      = "https://github.com/entrision/bootsteap_helpers"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/entrision/bootsteap_helpers"
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
