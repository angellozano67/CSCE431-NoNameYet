require 'pp'
task :cal_list => :environment do
  client = Google::APIClient.new
  client.authorization.access_token = Token.last.fresh_token
  service = client.discovered_api('calendar', 'v3')
  event = {
  "start": 
  {
    "date": "2015-05-06"
  },
  "summary": "Hello Pool",
  "end": 
  {
    "date": "2015-05-06"
  }
}
  result = client.execute(
    :api_method => service.events.insert,
    :parameters => {'calendarId' => 'primary'},
    :body => JSON.dump(event),
    :headers => {'Content-Type' => 'application/json'})
  pp JSON.parse(result.body)
end