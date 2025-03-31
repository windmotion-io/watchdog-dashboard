class CreateWatchdogDashboardMetrics < ActiveRecord::Migration[7.2]
  def change
    create_table :watchdog_dashboard_metrics do |t|
      t.string :description
      t.string :file_path
      t.string :location
      t.float :run_time
      t.string :status
      t.text :error_message
      t.boolean :flaky
      t.timestamps
    end
  end
end
