require_relative "helper_methods"

def get_valid_event_index(events, id)
  event_index = events.index { |event| event[:id] == id }
  while event_index.nil?
    puts "ID not found"
    print "Event ID: "
    id = gets.chomp.to_i
    event_index = events.index { |event| event[:id] == id }
  end
end

def update(events, id)
  event_index = get_valid_event_index(events, id)
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

  events[event_index][:start_date] = start_date_format
  events[event_index][:title] = title
  events[event_index][:end_date] = end_date_format
  events[event_index][:notes] = notes
  events[event_index][:guests] = guests
  events[event_index][:calendar] = calendar
end
