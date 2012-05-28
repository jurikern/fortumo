jQuery ->     
  $(".table th a, .pagination a").live "click", ->
    $.getScript(this.href)
    return false  
  
  $(".img-gallery").live "click", -> 
    var el = $(@)
    $.fancybox({
      href: el.attr("href")
    })
    return false
  
  return false