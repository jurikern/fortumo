module ApplicationHelper
  def title
    base_title = "Fortumo"
    
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end  
  end

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
