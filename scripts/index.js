$(function(){
    var $container = $("#proj-wrapper");
    imagesLoaded(container, function() {
      $container.masonry({
        itemSelector: ".proj",
      });
    });
});
