module Watchdog
  module Dashboard
    class Engine < ::Rails::Engine
      isolate_namespace Watchdog::Dashboard
    end
  end
end
