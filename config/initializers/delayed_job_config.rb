Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.sleep_delay = 60
Delayed::Worker.max_attempts = 3
Delayed::Worker.max_run_time = 1.hour
Delayed::Worker.delay_jobs = !Rails.env.test?
#Delayed::Worker.backend = :active_record
