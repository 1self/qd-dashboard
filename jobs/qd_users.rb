require 'rest-client'
require 'json'
# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
SCHEDULER.every '5m', :first_in => 0 do |job|
  response = RestClient.get('app.1self.co/users_count')
  data = JSON.parse(response)
  send_event('qd_users_count', { value: data["count"] })
end
