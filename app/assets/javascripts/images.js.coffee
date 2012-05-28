jQuery ->     
  $(".table th a, .pagination a").live "click", ->
    $.getScript(this.href)
    return false  
  
  $(".img-gallery").live "click", -> 
    $.fancybox({})
    return false
  
  return false