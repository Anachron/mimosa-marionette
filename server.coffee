express      =  require 'express'
engines      =  require 'consolidate'
childProc    =  require 'child_process'
packJson     =  require './package.json'
bowJson      =  require './bower.json'

exports.startServer = (config, callback) ->

  port = process.env.PORT or config.server.port

  app = express()
  server = app.listen port, ->
    console.log "Express server listening on port %d in %s mode", server.address().port, app.settings.env

  app.configure ->
    app.set 'port', port
    app.set 'views', config.server.views.path
    app.locals.basedir = config.server.views.path
    app.engine config.server.views.extension, engines[config.server.views.compileWith]
    app.set 'view engine', config.server.views.extension
    app.use express.favicon()
    app.use express.urlencoded()
    app.use express.methodOverride()
    app.use express.compress()
    app.use config.server.base, app.router
    app.use express.static(config.watch.compiledDir)

  app.configure 'development', ->
    app.use express.errorHandler()

  options =
    cachebust:  if process.env.NODE_ENV isnt "production" then "?b=#{(new Date()).getTime()}" else ''
    optimize:   config.isOptimize ? false
    appType:    'app'
    packJson:   packJson
    reload:     config.liveReload.enabled

  app.get '/', (req, res) ->
    options.page = 'index'
    res.render 'index', options

  app.get '/info', (req, res) ->
    options.page = 'info'
    options.node = {
      'version': 'unknown'
    }
    options.npm = {
      'version': 'unknown',
      'modules': {}
    }
    options.mimosa = {
      'version': 'unknown',
      'modules': {}
    }
    options.bower = {
      'version': 'unknown',
      'modules': {}
    }
    res.render 'info', options

  callback(server)
