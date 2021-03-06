gulp = require "gulp"
coffee = require "gulp-coffee"
concat =  require "gulp-concat"
handlebars = require "gulp-ember-handlebars"
emblem = require "gulp-auto-emblem"
serve = require "gulp-serve"
plumber = require "gulp-plumber"
notify = require "gulp-notify"
gulpif = require "gulp-if"
replace = require "gulp-replace"

env = process.env.GULP_ENV

plumberCfg = errorHandler: (error) ->
  console.log error
  notify.onError("Error: <%= error.message %>").apply @, arguments

paths =
  scripts:
    src: [
      "./app/application.coffee"
      "./app/config/*.coffee"
      "./app/models/*.coffee"
      "./app/routes/*.coffee"
      "./app/controllers/*.coffee"
    ]
    dest: "./dist/"
    filename: "application.js"
  templates:
    src: [
      "./app/templates/**/*.hbs"
      "./app/templates/**/*.emblem"
    ]
    root: "./app/templates"
    dest: "./dist"
    filename: "templates.js"
  html:
    src: "./app/index.html"
    dest: "./dist"

gulp.task "scripts", ->
  gulp.src paths.scripts.src
  .pipe plumber plumberCfg
  .pipe coffee bare: true
  .pipe replace "_ENV_", env
  .pipe concat paths.scripts.filename
  .pipe gulp.dest paths.scripts.dest

gulp.task "templates", ->
  gulp.src paths.templates.src
  .pipe plumber plumberCfg
  .pipe gulpif("**/*.hbs", handlebars outputType: "browser")
  .pipe gulpif("**/*.emblem", emblem(rootPath: paths.templates.root))
  .pipe concat paths.templates.filename
  .pipe gulp.dest paths.templates.dest

gulp.task "html", ->
  gulp.src paths.html.src
  .pipe plumber plumberCfg
  .pipe gulp.dest paths.html.dest

gulp.task "watch", ->
  gulp.watch paths.scripts.src, ["scripts"]
  gulp.watch paths.html.src, ["html"]
  gulp.watch paths.templates.src, ["templates"]

gulp.task "serve", serve
  root: ["dist"]
  port: 8080

gulp.task "dist", ["scripts", "templates", "html"]
gulp.task "dev", ["dist", "watch", "serve"]
gulp.task "default", ["dev"]
