require "date"
require_relative "list_events"
require_relative "delete_events"
require_relative "create_event"
require_relative "show_event"
require_relative "update_event"

# DATA
id = 0
events = [
  { id: (id = id.next), start_date: "2023-02-13T00:00:00-05:00", title: "Ruby Basics 1",
    end_date: "", notes: "Ruby Basics 1 notes", guests: ["Paulo", "Andre"], calendar: "web-dev" },
  { id: (id = id.next), start_date: "2023-02-13T09:00:00-05:00", title: "English Course",
    end_date: "2023-02-13T10:30:00-05:00", notes: "English notes", guests: ["Stephanie"], calendar: "english" },
  { id: (id = id.next), start_date: "2023-02-14T00:00:00-05:00", title: "Ruby Basics 2",
    end_date: "", notes: "Ruby Basics 2 notes", guests: ["Paulo", "Andre"], calendar: "web-dev" },
  { id: (id = id.next), start_date: "2023-02-14T12:45:00-05:00", title: "Soft Skills - Mindsets",
    end_date: "2023-02-14T13:30:00-05:00", notes: "Some extra notes", guests: ["Mili"], calendar: "soft-skills" },
  { id: (id = id.next), start_date: "2023-02-15T00:00:00-05:00", title: "Ruby Methods",
    end_date: "", notes: "Ruby Methods notes", guests: ["Paulo", "Andre"], calendar: "web-dev" },
  { id: (id = id.next), start_date: "2023-02-15T09:00:00-05:00", title: "English Course",
    end_date: "2023-02-15T10:30:00-05:00", notes: "English notes", guests: ["Stephanie"], calendar: "english" },
  { id: (id = id.next), start_date: "2023-02-16T09:00:00-05:00", title: "Summary Workshop",
    end_date: "2023-02-16T13:30:00-05:00", notes: "A lot of notes",
    guests: ["Paulo", "Andre", "Diego"], calendar: "web-dev" },
  { id: (id = id.next), start_date: "2023-02-16T00:00:00-05:00", title: "Extended Project",
    end_date: "", notes: "", guests: [], calendar: "web-dev" },
  { id: (id = id.next), start_date: "2023-02-17T09:00:00-05:00", title: "Extended Project",
    end_date: "", notes: "", guests: [], calendar: "web-dev" },
  { id: (id = id.next), start_date: "2023-02-17T09:00:00-05:00", title: "English Course",
    end_date: "2023-02-17T10:30:00-05:00", notes: "English notes", guests: ["Stephanie"], calendar: "english" },
  { id: (id = id.next), start_date: "2023-02-18T10:00:00-05:00", title: "Breakfast with my family",
    end_date: "2023-02-18T11:00:00-05:00", notes: "", guests: [], calendar: "default" },
  { id: (id = id.next), start_date: "2023-02-18T15:00:00-05:00", title: "Study",
    end_date: "2023-02-18T20:00:00-05:00", notes: "", guests: [], calendar: "default" },
  { id: (id = id.next), start_date: "2023-02-23T00:00:00-05:00", title: "Extended Project",
    end_date: "", notes: "", guests: [], calendar: "web-dev" },
  { id: (id = id.next), start_date: "2023-02-24T09:00:00-05:00", title: "Extended Project",
    end_date: "", notes: "", guests: [], calendar: "web-dev" }
]

# Main program flow C:\Users\Chris\github-classroom\codeableorg\ruby-calencli-c10-w1-team2\.

list_events(events)

action = nil
while action != "exit"
  action = ask_for_action_prompt

  case action
  when "list"
    list_events(events)
  when "create"
    create_event(events, id = id.next)
  when "show"
    show_event(events)
  when "update"
    print "Event ID: "
    id = gets.chomp.to_i
    update(events, id)
  when "delete"
    ids = grab_ids
    delete_events(ids, events)
  when "next"
    next_week2(events)
  when "prev"
    puts "prev"
  when "exit"
    puts "Thanks for using CalenCLI"
    break
  else
    puts "Invalid action"
  end
end
