module ApplicationHelper
  def simple_time(time)
    time.strftime("%Y-%m-%d %H:%M")
  end
  
  def fdate arg
    arg.present? ? Date.parse(arg).strftime("%Y/%m/%d") : ""
  end
end
