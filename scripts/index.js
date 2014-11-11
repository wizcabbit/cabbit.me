(function() {
  var $container = $("#proj-wrapper");
  imagesLoaded(container, function() {
    $container.masonry({
      itemSelector: ".proj-thumb",
    });
  });
  $(window).resize(function() {
    $container.masonry({
      itemSelector: ".proj-thumb",
    });
  })
})();

$(document).on("scroll", function() {
  topOffset = $(this).scrollTop();
  if (topOffset > 20) {
    $("#header").addClass("zoomed");
  } else {
    $("#header").removeClass("zoomed");
  }
});
