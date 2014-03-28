requirejs.config
  urlArgs: "b=" + ((new Date()).getTime())

  shim:
    'app':
      exports: 'app'
    'backbone':
      deps: ['underscore']
    'backbone.babysitter':
      deps: ['backbone']
    'backbone.localstorage':
      deps: ['backbone']
    'backbone.marionette':
      deps: ['backbone', 'backbone.babysitter', 'backbone.localstorage', 'backbone.wreqr', 'jquery']
      exports: 'Marionette'
    'handlebars':
      init: () ->
        #https://github.com/wycats/handlebars.js/issues/333
        window.Handlebars = Handlebars
      exports: 'Handlebars'
    'semantic':
      deps: ['jquery']
      exports: 'semantic'
    'underscore':
      deps: []
      exports: '_'

  paths:
    # Libs
    'app':                              'app'
    'backbone':                         'vendor/backbone/backbone'
    'backbone.babysitter':              'vendor/backbone.babysitter/backbone.babysitter'
    'backbone.localstorage':            'vendor/backbone.localstorage/backbone.localStorage'
    'backbone.marionette':              'vendor/backbone.marionette/backbone.marionette'
    'backbone.wreqr':                   'vendor/backbone.wreqr/backbone.wreqr'
    'css':                              'vendor/require-css/css'
    'handlebars':                       'vendor/handlebars/handlebars'
    'hbs':                              'vendor/require-hbs/hbs'
    'jquery':                           'vendor/jquery/jquery'
    'require':                          'vendor/requirejs/require'
    'semantic':                         'vendor/semantic/semantic'
    'text':                             'vendor/require-text/text'
    'underscore':                       'vendor/underscore/underscore'
    # Folders
    'j':                                '../javascripts'
    'c':                                '../stylesheets'
    't':                                '../templates/'