# Watchdog::Dashboard

Watchdog Dashboard is a Rails engine that provides a visual interface for monitoring the performance and reliability of your RSpec tests. This dashboard is part of the [RspecWatchdog](https://github.com/windmotion-io/rspec-watchdog) ecosystem but is specifically designed to integrate with Rails applications.

## Features

- **Metrics Visualization**: Charts and tables to analyze your test execution times
- **Flaky Test Detection**: Identify tests that fail intermittently
- **Trend Tracking**: Monitor the health of your test suite over time
- **Comprehensive Statistics**: Visualize data such as total runs, failures, and average test times
- **Simple Integration**: Easy to set up in any existing Rails application

## Screenshots

[You can include some screenshots of the dashboard here]

## Installation

### Step 1: Add the gem to your Gemfile

```ruby
gem 'watchdog-dashboard'
```

Then run:

```bash
bundle install
```

### Step 2: Install and run migrations

```bash
bin/rails watchdog_dashboard:install:migrations
bin/rails db:migrate
```

### Step 3: Mount the engine in your routes

In `config/routes.rb`, add:

```ruby
mount Watchdog::Dashboard::Engine => "/watchdog"
```

This will make the dashboard available at `/watchdog` in your Rails app.

### Step 4: Configuration

Create a configuration file in `config/initializers/watchdog_dashboard.rb`:

```ruby
Watchdog::Dashboard.configure do |config|
  config.watchdog_api_token = "your_secret_token" # Change this to a secure value using an ENV var or rails credentials
end
```

## Using with RspecWatchdog

To get the maximum benefit, you should use Watchdog Dashboard together with the [RspecWatchdog](https://github.com/windmotion-io/rspec-watchdog) gem, which handles data collection during your test execution.

Configure RspecWatchdog in your `spec/rails_helper.rb`:

```ruby
require "rspec_watchdog"

RspecWatchdog.configure do |config|
  config.show_logs = true
  config.watchdog_api_url = "http://localhost:3000/watchdog/analytics"
  config.watchdog_api_token = "your_secret_token" # Must match the dashboard token
end

RSpec.configure do |config|
  config.add_formatter(:progress) # Default RSpec formatter
  config.add_formatter(SlowSpecFormatter)
end
```

**Important**: Make sure that the `watchdog_api_token` matches between RspecWatchdog and Watchdog::Dashboard.

## Configuration Options

### `watchdog_api_token`

This token is used to validate that requests sent to the dashboard API are legitimate.

- If you're running tests in a CI/CD environment (e.g., GitHub Actions or CircleCI), you can set this value as an environment variable.
- For development environments, you can use a constant value, but make sure not to include it in version control.

## Navigating the Dashboard

Once configured, the dashboard will be available at `/watchdog` and will display:

- **Main Panel**: Summary of key metrics and general trends
- **Slow Tests**: List of tests that take longer to execute
- **Flaky Tests**: Identification of tests that fail intermittently
- **Execution History**: Tracking of all test runs
- **Settings**: Adjustments to customize the dashboard

## CI/CD Integration

To make the most of Watchdog Dashboard in a CI/CD environment:

1. Configure the token as a secure environment variable in your CI/CD platform
2. Ensure your tests send data to the correct endpoint
3. Use the dashboard to analyze trends after each CI run

## Contributing

Contributions are welcome. If you have ideas, suggestions, or find a bug, please open an issue or submit a pull request on GitHub.

## License

This engine is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
