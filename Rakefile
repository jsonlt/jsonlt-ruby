# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"
require "rubocop/rake_task"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
  t.warning = true
end

Rake::TestTask.new("test:unit") do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/unit/**/test_*.rb"]
  t.warning = true
end

Rake::TestTask.new("test:conformance") do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/conformance/**/test_*.rb"]
  t.warning = true
end

RuboCop::RakeTask.new

task default: %i[test rubocop]
