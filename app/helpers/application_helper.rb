module ApplicationHelper
  def count_errors_for(resource)
    if resource.errors.any?
      count = resource.errors.keys.count
      if count > 1
        count.to_s + " error".pluralize
      else
        count.to_s + " error"
      end
    else
      nil  
    end
  end 
end
