module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), { :class => css_class }
  end

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
