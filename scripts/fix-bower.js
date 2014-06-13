var fs = require( 'fs' );
var path = require ( 'path' );
//var async = require ( 'async' );

var _fixBower = function( mimosaConfig, options, next ) {
  
  var toFix = /*mimosaConfig.bowerFix.rules || */{
    '$cssVendor$/semantic/semantic.css': {
      '../images/': '/images/vendor/semantic/',
      '../fonts/': '/fonts/vendor/semantic/'
    }
  };
  
  var amount = Object.keys( toFix ).length;
  var fine = 0;
  
  if ( amount == 0 ) {
    mimosaConfig.log.info( '[[ No ]] bower assets to fix' );
    next();
    return;
  }
  
  mimosaConfig.log.info( 'Assets to fix: [[ ' + amount + ' ]]' );
  
  for ( var filePath in toFix ) {
    if ( _fixFile( filePath, toFix[filePath], mimosaConfig )) {
      fine++; 
    }
  }
  
  var errors = amount - fine;
  
  if ( errors == 0 ) {
    mimosaConfig.log.success( 'Finished. [[ ' + fine + ' ]] fixed');
  } else {
    mimosaConfig.log.warning( 'Finished. [[ ' + fine + ' ]] fixed, [[ ' + errors + ' ]] not'); 
  }
  next();
};

var _fixFile = function( filePath, fileFixes, mimosaConfig ) {
  filePath = filePath.replace( '$sourceDir$', mimosaConfig.watch.sourceDir )
    .replace( '$cssVendor$', mimosaConfig.vendor.stylesheets )
    .replace( '$jsVendor$', mimosaConfig.vendor.javascripts );

  mimosaConfig.log.debug( 'Fixing asset [[ ' + filePath + ' ]]' );
  
  try {
    fileData = fs.readFileSync( filePath, 'utf-8' );
    if ( fileData.length == 0 ) {
      mimosaConfig.log.warning ( 'Asset [[ ' + filePath + ' ]] is empty' );
      return;
    }
    for ( var sourcePath in fileFixes ) {
      var targetPath = fileFixes[sourcePath]; 
      fileData = fileData.replace( 
        _fixRegExp( sourcePath ),
        targetPath
      );
    }

    fs.writeFileSync( filePath, fileData );
  } catch (error){
    mimosaConfig.log.error( 'Cannot fix [[ ' + filePath + ' ]]: ' );
    mimosaConfig.log.error( error.message );
    return false;
  }
  return true;
};

var _fixRegExp = function( string ) {
  return new RegExp( string.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1" ), 'g' );
}
 
exports.registration = function( mimosaConfig, register ) {
  register( ['preBuild'], 'init', _fixBower );
};