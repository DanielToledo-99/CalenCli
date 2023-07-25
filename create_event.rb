require_relative "helper_methods"

def create_event(events, id)
  date = obtain_valid_date
  title = obtain_valid_title
  calendar = obtain_valid_calendar
  start_end = obtain_valid_start_end

  print "Notes: "
  notes = gets.chomp
  print "Guests: "
  guests = gets.chomp.split(", ")

  if start_end == ""
    start_date_format = "#{date}T00:00:00-05:00"
    end_date_format = ""
  else
    start_hour, end_our = start_end.split
    start_date_format = "#{date}T#{start_hour}:00-05:00"
    end_date_format = "#{date}T#{end_our}:00-05:00"
  end

  new_event = { id:, start_date: start_date_format, title:, end_date: end_date_format, notes:, guests:, calendar: }
  events.push(new_event)
end
