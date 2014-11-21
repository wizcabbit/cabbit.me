{include file="header.tpl"}

<style>
#example_video_1 {
  width:100%;
  height:0;
  padding-bottom:56.2%;
}
</style>

<div style="width:100%;overflow:auto;">

  <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="100%" poster="http://video-js.zencoder.com/oceans-clip.png" data-setup=' { "plugins": { "resolutionSelector" : { "default_res":"360" } } }'>
    <source src="http://cabbit-me.qiniudn.com/animoto_720p.mp4" type="video/mp4" data-res="720" />
    <source src="http://cabbit-me.qiniudn.com/animoto_480p.mp4" type="video/mp4" data-res="480" />
    <source src="http://cabbit-me.qiniudn.com/animoto_360p.mp4" type="video/mp4" data-res="360" />
    <!--<source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
  <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />-->
  </video>

</div>

<script>
(function() {
  // Initialise video.js's component
  videojs.options.flash.swf = "{$WEB_ROOT}/scripts/lib/video.js/video-js.swf";
})();
</script>

{include file="footer.tpl"}
