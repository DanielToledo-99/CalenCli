def valid_date?(date)
    valid_format = "%Y-%m-%d"
    !!(date.match(/\d{4}-\d{2}-\d{2}/) && DateTime.strptime(date, valid_format))
  rescue ArgumentError
    false
  end
  
  def valid_calendar?(calendar)
    valid_calendars = ["", "web-dev", "english", "soft-skills"]
    valid_calendars.include?(calendar)
  end
  
  def valid_start_end?(start_end)
    return true if start_end == ""
  
    valid_range = true
    start_hour, end_hour = start_end.split
    start_hour = start_hour.split(":")
    end_hour = end_hour.split(":")
    valid_range = if start_hour[0] == end_hour[0]
                    start_hour[1] < end_hour[1]
                  else
                    start_hour[0] < end_hour[0]
                  end
    !!(start_end.match(/\d{2}:\d{2} \d{2}:\d{2}/) && valid_range)
  rescue ArgumentError
    false
  end
  
  def obtain_valid_date
    print "Date (YYYY-MM-DD): "
    date = gets.chomp
    until valid_date?(date)
      puts "Invalid Date"
      print "Date (YYYY-MM-DD): "
      date = gets.chomp
    end
    date
  end
  
  def obtain_valid_title
    print "Title: "
    title = gets.chomp
    while title.empty?
      puts "Title shouldn't be empty"
      print "Title: "
      title = gets.chomp
    end
    title
  end
  
  def obtain_valid_calendar
    print "Calendar: "
    calendar = gets.chomp.strip
    until valid_calendar?(calendar)
      puts "Valid calendars: web-dev, english, soft-skills or defeault"
      print "Calendar: "
      calendar = gets.chomp.strip
    end
    calendar
  end
  
  def obtain_valid_start_end
    print "Start_End (HH:MM HH:MM): "
    start_end = gets.chomp
    until valid_start_end?(start_end)
      puts "Invalid format or invalid range, format should be HH:MM HH:MM"
      print "Start_End (HH:MM HH:MM): "
      start_end = gets.chomp
    end
    start_end
  end
  