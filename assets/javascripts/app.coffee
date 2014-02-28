define ['backbone.marionette'], (Marionette) ->
  # Provide some Handlebars candy to Marionette!
  # Thanks to sashasimkin -> https://gist.github.com/sashasimkin/5876792
  Marionette.Handlebars =
    path: "app/templates/"
    extension: ".hbs"

  # Overwrite the template loading
  Marionette.TemplateCache::loadTemplate = (templateId) ->
    template = undefined
    templateUrl = undefined
    return "[precompiled]"  if Handlebars.templates and Handlebars.templates[templateId]
    try
      template = Marionette.$(templateId).html()
    if not template or template.length is 0
      templateUrl = Marionette.Handlebars.path + templateId + Marionette.Handlebars.extension
      Marionette.$.ajax
        url: templateUrl
        success: (data) ->
          template = data
        async: false

      throw "NoTemplateError - Could not find template: '" + templateUrl + "'"  if not template or template.length is 0
    template

  Marionette.TemplateCache::compileTemplate = (templateId) ->
    Handlebars.templates[templateId]  if Handlebars.templates and Handlebars.templates[templateId]

  # Create our app
  App = new Marionette.Application()