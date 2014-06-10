var fs = require( 'fs' );
var path = require ( 'path' );

var _fixBower = function( mimosaConfig, options, next ) {
  
  mimosaConfig.log.info( 'Fixing bower assets.' );
  cssVendor = mimosaConfig.vendor.stylesheets;
  jsVendor =  mimosaConfig.vendor.javascripts;
  sourceDir = mimosaConfig.watch.sourceDir;
  imgVendor = path.join( sourceDir, 'images', 'vendor' );
  semanticCSS = path.join ( cssVendor, 'semantic', 'semantic.css' );
  
  fs.readFile ( semanticCSS, 'utf-8', function ( error, data ) {
    if(error){
      mimosaConfig.log.error( 'Cannot fix semantic.css: File can not be opened:' );
      mimosaConfig.log.error( error.message );
      next();
      return;
    }
    
    // replace images
    data = data.replace( '../images/', '/images/vendor' );
    // replace fonts
    data = data.replace( '../fonts/', '/fonts/vendor' );
    
    fs.writeFile( semanticCSS, data, function ( error ) {
      if(error){
        mimosaConfig.log.error( 'Cannot fix semantic.css: File can not be written:' );
        mimosaConfig.log.error( error.message );
        next();
        return;
      }
      
      mimosaConfig.log.success( 'All bower assets fixed!' );
      next();
    });
  });
};
 
exports.registration = function( mimosaConfig, register ) {
  register( ['preBuild'], 'complete', _fixBower );
};