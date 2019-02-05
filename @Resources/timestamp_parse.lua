-- stolen from http://lua-users.org/wiki/TimeZone
function get_timezone()
    local now = os.time()
    return os.difftime(now, os.time(os.date("!*t", now)))
  end

function ret_time(timestamp)
    if timestamp ~= '' then
        local timezone = get_timezone()
        local conv_time = 0
        local pattern = '(%d+)%-(%d+)%-(%d+)T(%d+):(%d+):(%d+)'
        local xyear, xmonth, xday, xhour, xminute, xseconds = timestamp:match(pattern)
        conv_time = os.time({year=xyear, month=xmonth, day=xday, hour=xhour, min=xminute, sec=xseconds}) + timezone
        return os.date('%H:%M:%S on %B %d %Y', conv_time)
    end
end