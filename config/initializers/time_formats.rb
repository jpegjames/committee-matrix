Time::DATE_FORMATS[:month_and_year] = "%B %Y"
Time::DATE_FORMATS[:month_day_year] = "%B %d, %Y"
Time::DATE_FORMATS[:pretty] = lambda { |time| time.strftime("%a, %b %e at %l:%M") + time.strftime("%p").downcase }
Time::DATE_FORMATS[:date_slashed] = "%m/%d/%y"
Time::DATE_FORMATS[:slashed] = lambda { |time| time.strftime("%m/%d/%y at %l:%M") + time.strftime("%p").downcase }