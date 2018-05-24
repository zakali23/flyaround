var Encore = require('@symfony/webpack-encore');

Encore
    .setOutputPath('web/build/')
    .setPublicPath('/web')
    .autoProvidejQuery()
    .addEntry('app', './assets/js/app.js')
    // .addEntry('style', './assets/css/style.css')
    .addEntry('style', './assets/scss/main.scss')
    .cleanupOutputBeforeBuild()
    .enableBuildNotifications()
    .enableSassLoader(function(sassOptions) {}, {resolveUrlLoader: false })
;

module.exports = Encore.getWebpackConfig();