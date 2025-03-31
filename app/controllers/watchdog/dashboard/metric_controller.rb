module Watchdog::Dashboard
  class MetricController < ApplicationController
    skip_forgery_protection
    before_action :authenticate_token

    def analytics
      batch = params[:metrics]

      metrics_to_insert = batch.map do |metric|
        Metric.create!(
          description: metric[:description],
          file_path: metric[:file_path],
          location: metric[:location],
          run_time: metric[:run_time],
          status: metric[:status],
          error_message: metric[:error_message],
          flaky: metric[:flaky]
        )
      end
    end

    private

    def metric_params
      params.require(:metric).permit(:description, :file_path, :location, :run_time, :status, :error_message, :flaky)
    end

    def authenticate_token
      expected_token =  Watchdog::Dashboard.config.watchdog_api_token
      request_token = request.headers["Authorization"]

      unless request_token.present? && ActiveSupport::SecurityUtils.secure_compare(request_token, expected_token)
        render json: { error: "Unauthorized" }, status: :unauthorized
      end
    end
  end
end
