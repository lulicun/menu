'use strict';

module.exports = {

  sourceDir: './public/',
  buildDir: './build/',

  scripts: {
    src: 'public/js/**/*.js',
    dest: 'public/build/js'
  },

  styles: {
    src: 'public/styles/**/*.scss',
    dest: 'public/build/css',
    prodSourcemap: false,
    sassIncludePaths: []
  },

  images: {
    src: 'public/images/**/*',
    dest: 'public/build/images'
  },

  views: {
    index: 'public/index.html',
    src: 'public/views/**/*.html',
    dest: 'public/build/js'
  },

  fonts: {
    src: ['public/fonts/**/*'],
    dest: 'build/fonts'
  },

  browserify: {
    bundleName: 'main.js',
    prodSourcemap: false
  },

  init: function() {
    this.views.watch = [
      this.views.index,
      this.views.src
    ];

    return this;
  }

}.init();
