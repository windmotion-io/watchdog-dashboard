require "test_helper"

class Watchdog::DashboardTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Watchdog::Dashboard::VERSION
  end
end
