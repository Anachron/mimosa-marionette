## Mimosa-Marionette
### About

Advanced Skeleton for Mimosa (buildtool), using Marionette (Framework), RequireJS (+CSS, +HBS), Express (Server), Jade (Server-Template), Bower (Component Handling), CoffeeScript (JS-Metalang), LESS (CSS-Metalang), Semantic-UI (CSS-Framework), and more.

### Requirements

- Node.js >= 0.10.x
- Mimosa >= 2.2.x
- Git >= 1.5

### Installation

```mimosa skel:new <project> marionette-semantic```

Will create a new Project in the Subfolder <project> with the already set up configuration of marionette-semantic.

### Configuration

If not on a Windows-Machine, you can reenable the Tests in the `mimosa-config.coffee`, simply comment them out or remove them entirely.

```coffeescript
  testemRequire:
    executeDuringBuild: false
    executeDuringWatch: false
```

### Optimize

1. `mimosa watch -oms`
2. [localhost:3000](http://localhost:3000)

`-oms` is shorthand for `--optimize --minify --server`. This runs all the minifiers, runs the r.js optimization, and then starts a server.  The JavaScript for the app will be both minified and concatenated.

### Packaging for Deployment

1. `mimosa build -omp`
2. `cd dist`
3. `node app.js`
4. [localhost:3000](http://localhost:3000)

`-omp` is shorthand for `--optimize --minify --package`. This command will run optimization, run all the minifiers and then package the result for deployment. The packaged result doesn't need Mimosa to run.


### Misc

Need help? You can find me at 

https://gitter.im/dbashford/mimosa

### Credits

- Part of this Readme is pasted from [MimosaWebAppSkeleton](https://github.com/dbashford/MimosaWebAppSkeleton).
- David Bashford for [MimosaJS](http://mimosa.io/).
- [Bower.io](http://bower.io/) by Twitter.
- [ExpressJS](http://expressjs.com/) by visionmedia.
- [Marionette](marionettejs.com/) by mojotech.

& many more! Without any of these I would not have enough motivation to get into the next generation web development and learn these amazing packages.