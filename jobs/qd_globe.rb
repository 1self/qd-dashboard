# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '5m', :first_in => 0 do |job|
  send_event('qd_globe', { url: "https://app.quantifieddev.org/community/globe"})
end
