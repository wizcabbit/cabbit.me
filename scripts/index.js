$(function(){
    var $container = $("#proj-wrapper");
    imagesLoaded(container, function() {
      $container.masonry({
        itemSelector: ".proj-thumb",
      });
    });
});

$(document).on("scroll", function(){
  topOffset = $(this).scrollTop();
  if (topOffset > 25)
  {
    $("#header").addClass("zoomed");
  }
  else{
    $("#header").removeClass("zoomed");
  }
});
