# :first_in sets how long it takes before the job is first run. In this case, it is run immediatelySCHEDULER.every '1m', :first_in => 0 do |job|
require 'rest-client'
require 'json'

SCHEDULER.every '5m', :first_in => 0 do |job|
  response = RestClient.get('app.quantifieddev.org/recent_signups')
  data = JSON.parse(response)
  
  send_event('qd_recent_signups', { qd_recent_signups: data })
end
