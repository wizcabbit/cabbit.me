$(function(){
    var $container = $("#projects_wrapper");
    imagesLoaded(container, function() {
      $container.masonry({
        itemSelector: ".project",
      });
    });
});
