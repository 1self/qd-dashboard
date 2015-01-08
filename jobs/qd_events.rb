# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require 'rest-client'
require 'json'

SCHEDULER.every '5m', :first_in => 0 do |job|
  response = RestClient.get('app.1self.co/eventsCount')
  data = JSON.parse(response)
  
  send_event('qd_events_count', { value: data["eventsCount"] })
end
