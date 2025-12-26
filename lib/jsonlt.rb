# frozen_string_literal: true

require_relative "jsonlt/version"
require_relative "jsonlt/table"

# JSONLT (JSON Lines Table) is a data format for storing keyed records
# in append-only files using JSON Lines, optimized for version control
# diffs and human readability.
module JSONLT
  class Error < StandardError; end
end
