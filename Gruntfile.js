module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      js: {
        files: {
          'build/all.min.js': [
            'scripts/lib/jquery-1.11.1.js',
            'scripts/lib/imagesloaded.pkgd.js',
            'scripts/lib/jquery.masonry.min.js',
            'scripts/lib/video.js/video.dev.js',
            'scripts/index.js'
          ]
        }
      }
    },
    cssmin: {
      css: {
        files: {
          'build/all.min.css': [
            'styles/common.css',
            'styles/index.css',
            'styles/project.css',
            'styles/static.css',
            'scripts/lib/video.js/video-js.css'
          ]
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('default', ['uglify', 'cssmin']);

};
