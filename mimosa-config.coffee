exports.config = {

  modules: ['jshint', 'csslint', 'server', 'require', 'minify-js', 'minify-css', 'live-reload', 'bower', 'coffeescript', 'less', 'copy', 'testem-require', 'server-reload']

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
        'semantic': [
          'build/packaged/fonts': '../../fonts/vendor/semantic'
          'build/packaged/images': '../../images/vendor/semantic'
          'build/packaged/css/semantic.css'
          'build/packaged/javascript/semantic.js'
        ]
        'require-hbs': [
          'hbs.js': 'vendor/require-hbs/hbs.js'
        ]

  testemRequire:
    executeDuringBuild: false
    executeDuringWatch: false
}