module ApplicationHelper
  def flash_class(type)
    case type
    when 'notice' then 'bg-blue-500'
    when 'success' then 'bg-green-500'
    when 'error' then 'bg-red-500'
    when 'alert' then 'bg-yellow-500'
    else ""
    end
  end
end
