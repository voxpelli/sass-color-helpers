module.exports = function(grunt) {

  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('bootcamp');

  grunt.initConfig({
    sass: {
      test: {
        options: {
          style: 'expanded',
        },
        files: {
          'tests/results.css': 'tests/specs.scss'
        }
      }
    },

    bootcamp: {
      test: {
        files: {
          src: ['tests/results.css']
        }
      }
    }
  });

  grunt.registerTask('test', ['sass', 'bootcamp']);
  grunt.registerTask('default', ['test']);
};
