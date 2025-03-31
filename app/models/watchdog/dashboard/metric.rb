module Watchdog::Dashboard
  class Metric < ApplicationRecord
    scope :flaky, -> { where(flaky: true) }
  end
end
