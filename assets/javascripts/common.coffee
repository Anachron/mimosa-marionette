requirejs.config
  urlArgs: "b=" + ((new Date()).getTime())

  shim:
    App:
      deps: ['Marionette']
      exports: 'App'
    Backbone:
      deps: ['Underscore']
    BackboneLS:
      deps: ['Backbone']
    # Handlebars:
    # jQuery:
    Marionette:
      deps: ['jQuery', 'Backbone', 'BackboneLS']
      exports: 'Backbone.Marionette'
    Morris:
      deps: ['jQuery', 'Raphael']
      exports: 'Morris'
    # Raphael:
    # Require:
    # Underscore:

  paths:
    App:         'app'
    Backbone:    'vendor/backbone/1.1.0/backbone'
    BackboneLS:  'vendor/backbone.localstorage/1.1.7/backbone.localStorage'
    Handlebars:  'vendor/handlebars/1.3.0/handlebars.amd'
    jQuery:      'vendor/jquery/2.0.3/jquery'
    Marionette:  'vendor/marionette/1.4.1/backbone.marionette'
    Morris:      'vendor/morris/0.4.3/morris'
    Raphael:     'vendor/raphael/2.1.2/raphael'
    Require:     'vendor/require/2.1.8/require'
    Underscore:  'vendor/underscore/1.5.2/underscore'

  hbs:
      disableI18n: true
      templateExtension: "html"
