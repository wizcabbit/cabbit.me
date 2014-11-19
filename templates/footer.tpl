        </div><!-- END main -->
      </div>
      <div id="footer-wrapper">
        <div id="footer">
          <div id="rights">
            <span id="rights-c">(C) 2006-2014 WANG Zhi Yong's Portfolio</span> Coded by <a href="#">wizcabbit</a></span>
          </div>
          <div id="backtop">
            <a href="#">Back to Top</a>
          </div>
        </div>
      </div><!-- END footer -->
    </div><!-- END container -->
    <!-- jQuery Library and plugins -->
{if $IS_DEBUG}
    <script src="{$WEB_ROOT}/scripts/lib/jquery-1.11.1.js"></script>
    <script src="{$WEB_ROOT}/scripts/lib/imagesloaded.pkgd.js"></script>
    <script src="{$WEB_ROOT}/scripts/lib/jquery.masonry.min.js"></script>
    <script src="{$WEB_ROOT}/scripts/lib/video.js/video.dev.js"></script>
{else}
    <script src="{$WEB_ROOT}/all.min.js"></script>
{/if}
    <script>
    (function() {
      // Initialise video.js's component
      videojs.options.flash.swf = "{$WEB_ROOT}/scripts/lib/video.js/video-js.swf";
    })();
    </script>
  </body>
</html>
