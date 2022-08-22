# frozen_string_literal: true

Time::DATE_FORMATS[:month_and_year] = '%B %Y'
Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%B #{time.day.ordinalize}") }
# Time::DATE_FORMATS[:sh] = '%-m/%-d/%y'

## FOR A COMPLETE LIST: https://apidock.com/ruby/DateTime/strftime

# Need two versions of this for the times when we may or may not have the time passed in
Time::DATE_FORMATS[:dt] = '%m/%d/%Y at %l:%M %p'
Date::DATE_FORMATS[:dt] = '%m/%d/%Y'

# #short date w/time (missing the year)
Time::DATE_FORMATS[:sdt] = '%m/%d at %l:%M %p'
Date::DATE_FORMATS[:sdt] = '%m/%d'

Time::DATE_FORMATS[:edt] = '%b %e at %l:%M %P'
Date::DATE_FORMATS[:edt] = '%b %e'

Time::DATE_FORMATS[:date_long] = '%B %e, %Y'
Date::DATE_FORMATS[:date_long] = '%B %e, %Y'

Time::DATE_FORMATS[:md] = '%m/%d'
Date::DATE_FORMATS[:md] = '%m/%d'

Time::DATE_FORMATS[:x] = '%m/%d/%Y'
Date::DATE_FORMATS[:x] = '%m/%d/%Y'

Date::DATE_FORMATS[:ds] = '%Y%m%d'
Date::DATE_FORMATS[:mysql] = '%Y-%m-%d'

Date::DATE_FORMATS[:dtintl] = '%FT%T'
Time::DATE_FORMATS[:dtintl] = '%FT%T'

# #short time only (missing the date)
Time::DATE_FORMATS[:st] = '%l:%M %p'
Time::DATE_FORMATS[:ecs] = '%l %p'

Time::DATE_FORMATS[:stx] = '%H:%M'
Time::DATE_FORMATS[:sts] = '%l:%M:%S %p'
