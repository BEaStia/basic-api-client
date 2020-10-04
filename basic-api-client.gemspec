require_relative 'lib/basic/api/client/version'

Gem::Specification.new do |spec|
  spec.name          = "basic-api-client"
  spec.version       = Basic::Api::Client::VERSION
  spec.authors       = ["Igor Pavlov"]
  spec.email         = ["gophan1992@gmail.com"]

  spec.summary       = %q{It's just a commonly generated solution used in our company to build integrations between internal and external services}
  spec.description   = %q{This gem implements basic api client used in Worki to develop integrations(Money Mail.ru for example).}
  spec.homepage      = "https://github.com/beastia/basic-api-client"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/beastia/basic-api-client"
  spec.metadata["changelog_uri"] = "https://github.com/beastia/basic-api-client/blob/master/changelog.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'faraday'
  spec.add_development_dependency 'webmock'
  spec.add_runtime_dependency 'dry-initializer'
end
