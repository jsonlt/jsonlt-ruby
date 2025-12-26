# frozen_string_literal: true

if ENV["COVERAGE"]
  require "simplecov"

  SimpleCov.start do
    add_filter "/test/"
    enable_coverage :branch
    # TODO: Increase thresholds as implementation is completed
    minimum_coverage line: 60, branch: 50
  end
end

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "jsonlt"

require "minitest/autorun"
