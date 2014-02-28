requirejs.config
  urlArgs: "b=" + ((new Date()).getTime())

  shim:
    'app':
      deps: ['basics']
      exports: 'app'
    'basics':
      deps: ['backbone.marionette']
      exports: 'Backbone.Marionette'
    'backbone':
      deps: ['underscore']
    'backbone.babysitter':
      deps: ['backbone']
    'backbone.localstorage':
      deps: ['backbone']
    'backbone.marionette':
      deps: ['backbone', 'backbone.babysitter', 'backbone.localstorage', 'backbone.wreqr', 'jquery']
      exports: 'Backbone.Marionette'
    # 'handlebars':
    # 'jquery':
    'morris':
      deps: ['jquery', 'raphael']
      exports: 'morris'
    # 'raphael':
    # 'require':
    'semantic':
      deps: ['jquery']
      exports: 'semantic'
    'underscore':
      deps: []
      exports: '_'

  paths:
    'app':                              'app'
    'basics':                           'basics'
    'backbone':                         'vendor/backbone/backbone'
    'backbone.babysitter':              'vendor/backbone.babysitter/backbone.babysitter'
    'backbone.epoxy':                   'vendor/backbone.epoxy/backbone.epoxy'
    'backbone.localstorage':            'vendor/backbone.localstorage/backbone.localStorage'
    'backbone.marionette':              'vendor/backbone.marionette/backbone.marionette'
    'backbone.wreqr':                   'vendor/backbone.wreqr/backbone.wreqr'
    'handlebars':                       'vendor/handlebars/handlebars'
    'jquery':                           'vendor/jquery/jquery'
    'morris':                           'vendor/morris.js/morris'
    'raphael':                          'vendor/raphael/raphael'
    'require':                          'vendor/requirejs/require'
    'semantic':                         'vendor/semantic/semantic'
    'underscore':                       'vendor/underscore/underscore'

  hbs:
    disableI18n: true
    templateExtension: "html"
