# frozen_string_literal: true

require_relative "lib/fingersnap/version"

Gem::Specification.new do |spec|
  spec.name = "fingersnap"
  spec.version = Fingersnap::VERSION
  spec.authors = ["Shreyan Jain"]
  spec.email = ["shreyan.jain.9@outlook.com"]

  spec.summary = "no summary: to do: Write a short summary, because RubyGems requires one."
  spec.description = "Description: to do: Write a longer description."
  spec.homepage = "https://github.com/ShreyanJain9/fingersnap"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ShreyanJain9/fingersnap"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "httparty"
  spec.add_dependency "json"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
