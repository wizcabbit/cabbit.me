module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    clean: {
      release: [
        'build/*'
      ]
    },
    uglify: {
      release: {
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
      release: {
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
      release: {
        expand: true,
        src: [
          'smarty/**',
          'images/**',
          'fonts/**',
          'templates/**',
          'media/**',
          '.htaccess',
          'index.php',
          'favicon.ico',
          'sitemap.xml'
        ],
        dest: 'build/'
      }
    },
    ftpush: {
      deploy: {
        auth: {
          host: 'srv.cabbit.me',
          port: 21,
          authKey: 'www'
        },
        src: './build',
        dest: './default',
        exclusions: ['smarty/**'],
        keep: ['bin/**', '.htaccess', 'vjs*', 'smarty/**'],
        simple: true
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-ftpush');

  grunt.registerTask('default', ['clean', 'uglify', 'cssmin', 'copy']);
  grunt.registerTask('release', ['clean', 'uglify', 'cssmin', 'copy']);
  grunt.registerTask('deploy', ['release', 'ftpush']);
};
