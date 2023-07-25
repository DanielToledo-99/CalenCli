def find_event(events)
    print "Event ID: "
    id = gets.chomp.to_i
    events.find { |event| event[:id] == id }
  end
  
  def show_event(events)
    event = find_event(events)
    while event.nil?
      puts "ID not found"
      event = find_event(events)
    end
  
    if event[:end_date] == ""
      start_end = "All day event"
    else
      start_time = DateTime.parse(event[:start_date]).strftime("%H:%M")
      end_time = DateTime.parse(event[:end_date]).strftime("%H:%M") unless event[:end_date].empty?
      start_end = "#{start_time} #{end_time}"
    end
  
    puts "Date: #{event[:start_date].split('T')[0]}"
    puts "Title: #{event[:title]}"
    puts "Calendar: #{event[:calendar]}"
    puts "Start_End: #{start_end}"
    puts "Notes: #{event[:notes]}"
    puts "Guests: #{event[:guests].join(', ')}"
  end
  