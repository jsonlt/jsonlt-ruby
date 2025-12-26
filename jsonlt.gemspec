# frozen_string_literal: true

require_relative "lib/jsonlt/version"

Gem::Specification.new do |spec|
  spec.name = "jsonlt"
  spec.version = JSONLT::VERSION
  spec.authors = ["Tony Burns"]
  spec.email = ["tony@tonyburns.net"]

  spec.summary = "Ruby implementation of the JSON Lines Table (JSONLT) specification"
  spec.description = "A Ruby library for storing keyed records in append-only files using JSON Lines. " \
                     "Optimized for version control diffs and human readability."
  spec.homepage = "https://jsonlt.org"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jsonlt/jsonlt-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/jsonlt/jsonlt-ruby/blob/main/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/jsonlt/jsonlt-ruby/issues"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[test/ spec/ features/ .git .github .claude .oaps .vale .rspec .rubocop .yamllint])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # No runtime dependencies

  # Development dependencies
  spec.add_development_dependency "benchmark-ips", "~> 2.14"
  spec.add_development_dependency "minitest", "~> 5.25"
  spec.add_development_dependency "rake", "~> 13.2"
  spec.add_development_dependency "rubocop", "~> 1.75"
  spec.add_development_dependency "rubocop-minitest", "~> 0.36"
  spec.add_development_dependency "rubocop-rake", "~> 0.7"
  spec.add_development_dependency "simplecov", "~> 0.22"
end
