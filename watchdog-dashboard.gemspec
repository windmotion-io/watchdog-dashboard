require_relative "lib/watchdog/dashboard/version"

Gem::Specification.new do |spec|
  spec.name        = "watchdog-dashboard"
  spec.version     = Watchdog::Dashboard::VERSION
  spec.authors       = ["Federico Aldunate", "Agustin Fornio"]
  spec.email       = [ "agus16.7@hotmail.com" ]
  spec.homepage    = "https://github.com/windmotion-io/watchdog-dashboard"
  spec.summary     = "Dashboard for RSpec performance tracking and metrics"
  spec.description = "Dashboard: Track RSpec test performance, identify slow tests, and generate metrics"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/windmotion-io/rspec-watchdog."
  spec.metadata["changelog_uri"] = "https://github.com/windmotion-io/rspec-watchdog."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.2.2.1"
end
