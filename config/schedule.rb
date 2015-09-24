# Run `bundle exec whenever --update-crontab` to update crontab
# Run `bundle exec crontab -l` to check jobs
#
# Set log
set :output, { :error => "log/cron_error_log.log", :standard => "log/cron_log.log" }

every 1.day do
  rake 'create_daily_result'
end
