set shell := ['uv', 'run', '--frozen', 'bash', '-euxo', 'pipefail', '-c']
set positional-arguments
set unstable

project := "jsonlt"
pnpm := "pnpm exec"
bundle := "bundle exec"
rake := "bundle exec rake"

# List available recipes
default:
  @just --list

# Run benchmarks
benchmark *args:
  {{bundle}} ruby -Ilib benchmark/run.rb "$@"

# Build gem
build: clean
  {{rake}} build

# Build gem for release
build-release: build

# Clean build artifacts
clean:
  rm -rf pkg
  rm -rf coverage
  rm -rf .rspec_status

# Format code
format:
  codespell -w
  {{bundle}} rubocop -A
  {{pnpm}} biome format --write .

# Fix code issues
fix:
  {{bundle}} rubocop -A
  {{pnpm}} biome format --write .
  {{pnpm}} biome check --write .

# Run all linters
lint:
  {{rake}} rubocop
  codespell
  yamllint --strict .
  {{pnpm}} biome check .
  {{pnpm}} markdownlint-cli2 "**/*.md"

# Lint Markdown files
lint-markdown:
  {{pnpm}} markdownlint-cli2 "**/*.md"

# Lint Ruby code
lint-ruby:
  {{rake}} rubocop

# Lint prose in Markdown files
lint-prose:
  vale CODE_OF_CONDUCT.md CONTRIBUTING.md README.md SECURITY.md

# Check spelling
lint-spelling:
  codespell

# Lint web files (CSS, HTML, JS, JSON)
lint-web:
  {{pnpm}} biome check .

# Install all dependencies (Ruby + Node.js + Python)
install: install-node install-python install-ruby

# Install only Node.js dependencies
install-node:
  pnpm install --frozen-lockfile

# Install only Python dependencies (for dev tools)
install-python:
  uv sync --frozen

# Install pre-commit hooks
install-prek:
  uv run prek install

# Install only Ruby dependencies
install-ruby:
  bundle install

# Run pre-commit hooks on changed files
prek:
  uv run prek

# Run pre-commit hooks on all files
prek-all:
  uv run prek run --all-files

# Publish to RubyGems.org (requires GEM_HOST_API_KEY or ~/.gem/credentials)
publish-rubygems: build-release
  gem push pkg/{{project}}-*.gem

# Run command
run *args:
  "$@"

# Run Node.js
run-node *args:
  {{pnpm}} "$@"

# Run Ruby
run-ruby *args:
  {{bundle}} ruby "$@"

# Generate SBOM for current environment
sbom output="sbom.cdx.json":
  uv run --isolated --group release cyclonedx-py environment --of json -o {{output}}

# Run tests
test *args:
  {{rake}} test "$@"

# Run all tests
test-all *args:
  {{rake}} test "$@"

# Run conformance tests
test-conformance *args:
  {{rake}} test:conformance "$@"

# Run tests with coverage
test-coverage *args:
  COVERAGE=true {{rake}} test "$@"

# Run unit tests
test-unit *args:
  {{rake}} test:unit "$@"

# Sync Vale styles and dictionaries
vale-sync:
  uv run vale sync
