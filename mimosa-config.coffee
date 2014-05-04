exports.config = {

  modules: [
    'bower',          # Manage dependencies with Bower.io
    'coffeescript',   # Allow converting of CoffeeScript
    'copy',           # Use the copy module for misc files
    'csslint',        # Lint CSS and find mistakes/unclean styles
    'jshint',         # Lint JS and find mistakes/unclean code
    'less',           # Compile LESS-Styles to CSS
    'live-reload',    # Reload changes from editor directly in browser
    'minify-js',      # Minify JavaScript, if wanted
    'minify-css',     # Minify Stylesheets, if wanted
    'require',        # Use the Require-Plugin, needed for Handlebars and CSS-Require
    'server',         # Use the Server-Plugin, used with ExpressJS
    'server-reload'   # Reload the server if Server-Files change
    'testem-require', # Write tests with Testem
  ]

  server:
    views:
      path: 'server/views'

  liveReload:
    additionalDirs: [
      'server/views'
    ]

  bower:
    copy:
      mainOverrides:
        'handlebars': [
          'handlebars.js'
        ]
        'semantic': [
          'build/packaged/fonts': '../../fonts/vendor/semantic'
          'build/packaged/images': '../../images/vendor/semantic'
          'build/packaged/css/semantic.css'
          'build/packaged/javascript/semantic.js'
        ]
        'require-hbs': [
          'hbs.js'
        ]
  
  # Adhoc module allows us to execute local project/skeleton based scripts
  # Easily without making them a module. They got injected into the Workflow automatically.
  adhocModule:
    modules: []
  

  # Due to Windows compatibility issues I had to turn this off by default.
  # You can create your own testscript using mimosa testscript and then execute it from the cli
  testemRequire:
    executeDuringBuild: false
    executeDuringWatch: false

  copy:
    extensions: ["js","css","png","jpg","jpeg","gif","html","eot","svg","ttf","woff","otf","yaml","kml","ico","htc","htm","json","txt","xml","xsd","map","md","mp4", "hbs"]
}