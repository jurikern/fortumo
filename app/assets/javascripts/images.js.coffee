jQuery ->     
  $(".table th a, .pagination a").live "click", ->
    $.getScript(this.href)
    return false  
  
  $(".img-gallery").fancybox()
  
  return false