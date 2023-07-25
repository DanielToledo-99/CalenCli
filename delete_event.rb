def delete_events(ids, events)
    events.delete_if do |event|
      ids.include?(event[:id])
    end
  end
  
  def grab_ids
    print "Event ID(s): "
    gets.chomp.split(",").map(&:to_i)
  end
  