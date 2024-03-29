module MenusHelper
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end

  def month_path(date)
    "/menus/#{date.year}/#{date.month}"
  end

  # custom options for this calendar
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :link_to_day_action => "show",
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :use_all_day => true
    }
  end

  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
      html = %(<a href="#{event.day_path}" title="#{h(event.comment)}">)
      #html << display_event_time(event, day)
      html << %(#{h(event.comment)}</a>)
      html
    end
  end
end
