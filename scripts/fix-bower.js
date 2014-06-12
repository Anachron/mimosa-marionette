var fs = require( 'fs' );
var path = require ( 'path' );
//var async = require ( 'async' );

var _fixBower = function( mimosaConfig, options, next ) {
  
  toFix = /*mimosaConfig.bowerFix.rules || */{
    '$cssVendor$/semantic/semantic.css': {
      '../images/': '/images/vendor',
      '../fonts/': '/fonts/vendor/'
    }
  };
  
  amount = Object.keys( toFix ).length;
  
  if( amount == 0 ) {
    mimosaConfig.log.info( '[[ No ]] bower assets to fix.' );
    next();
    return;
  }
  
  mimosaConfig.log.info( 'Will fix [[ ' + amount + ' ]] assets.' );
  
  for ( var filePath in toFix ) {
    _fixFile ( filePath, toFix[filePath], mimosaConfig );
  }
  
  mimosaConfig.log.success( 'Asset fixing finished.' );
  next();
};

var _fixFile = function ( filePath, fileFixes, mimosaConfig ) {
  filePath = filePath.replace( '$sourceDir$', mimosaConfig.watch.sourceDir )
    .replace( '$cssVendor$', mimosaConfig.vendor.stylesheets )
    .replace( '$jsVendor$', mimosaConfig.vendor.javascripts );

  mimosaConfig.log.debug( 'Fixing asset [[ ' + filePath + ' ]]' );
  
  try {
    fileData = fs.readFileSync( filePath, 'utf-8' );
    for ( var sourcePath in fileFixes ) {
      var targetPath = fileFixes[sourcePath]; 
      fileData = fileData.replace( new RegExp( sourcePath, 'g' ), targetPath );
    }

    fs.writeFileSync( filePath, fileData );
  } catch (error){
    mimosaConfig.log.error( 'Cannot fix [[ ' + filePath + ' ]]: ' );
    mimosaConfig.log.error( error.message );
  }
};
 
exports.registration = function( mimosaConfig, register ) {
  register( ['postBuild'], 'init', _fixBower );
};