gulp = require 'gulp'
gTasks = require 'gulp-tasks'

cPort = Number(process.env.PORT) || 5000
lPort = cPort+1 if cPort?

base = "#{__dirname}/dest"
bower = "#{__dirname}/bower_components"
dest =
  base: base
  templates: "#{base}/templates"
  assets:
    "#{base}/assets"

src =
  scripts:
    main: "#{__dirname}/client/scripts/main.coffee"
    watch: "#{__dirname}/client/scripts/**/*.coffee"
  templates:
    index: "#{__dirname}/client/index.jade"
    files: "#{__dirname}/client/templates/**/*.jade"
  styles:
    index: "#{__dirname}/client/styles/main.less"
    files: "#{__dirname}/client/styles/**/*.less"

gulp.task 'build', [
  'build:scripts'
  'build:templates'
  'build:styles'
]

gulp.task 'build:scripts', [
  'build:scripts:app'
]

gulp.task 'build:scripts:app', ->
  gTasks.browserify.build src.scripts.main, dest.base

gulp.task 'build:templates', ->
  gTasks.jade.build src.templates.index, dest.base, lPort
  gTasks.jade.build src.templates.files, dest.templates

gulp.task 'build:styles', ->
  gTasks.less.build src.styles.index, dest.base

gulp.task 'server', ->
  gTasks.server.livereload dest.base, lPort
  gTasks.server.content dest.base, cPort

gulp.task 'start', ['build', 'server']

gulp.task 'watch', ['build', 'server'], ->
  gulp.watch src.scripts.watch, ['build:scripts:app']
  gulp.watch [src.templates.index, src.templates.files], ['build:templates']
  gulp.watch [src.styles.index, src.styles.files], ['build:styles']

gulp.task 'default', ['watch']
