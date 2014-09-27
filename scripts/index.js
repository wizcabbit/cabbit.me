$(function(){
    var $container = $("#projects_wrapper");
    imagesLoaded(container, function() {
      var msnry = new Masonry(container, {
        itemSelector: ".project",
      });
    });
});
