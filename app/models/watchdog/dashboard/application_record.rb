module Watchdog
  module Dashboard
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
