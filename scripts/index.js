$(function(){
    var $container = $("#proj-wrapper");
    imagesLoaded(container, function() {
      $container.masonry({
        itemSelector: ".proj",
      });
    });
});

$(document).on("scroll", function(){
  topOffset = $(this).scrollTop();
  if (topOffset > 50)
  {
    $("#header").addClass("zoomed");
  }
  else{
    $("#header").removeClass("zoomed");
  }
});
