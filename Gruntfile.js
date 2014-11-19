module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    clean: {
      build: [
        'build/*'
      ]
    },
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
      },
      vheard: {
        files: {
          'build/styles/10-vheard.css': 'styles/10-vheard.css'
        }
      }
    },
    copy: {
      main: {
        expand: true,
        src: [
          'smarty/**',
          'images/**',
          'fonts/**',
          'templates/**',
          'media/**',
          '.htaccess',
          'index.php',
          'favicon.ico'
        ],
        dest: 'build/'
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('default', ['clean', 'uglify', 'cssmin', 'copy']);
};
