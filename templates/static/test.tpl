{include file="header.tpl"}

<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="640" poster="http://video-js.zencoder.com/oceans-clip.png" data-setup=' { "plugins": { "resolutionSelector" : { "default_res":"360" } } }'>
  <source src="http://cabbit-me.qiniudn.com/animoto_720p.mp4" type="video/mp4" data-res="720" />
  <source src="http://cabbit-me.qiniudn.com/animoto_480p.mp4" type="video/mp4" data-res="480" />
  <source src="http://cabbit-me.qiniudn.com/animoto_360p.mp4" type="video/mp4" data-res="360" />
  <!--<source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
  <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />-->
</video>

{include file="footer.tpl"}
