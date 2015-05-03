path = require('path')
_ = require('lodash')
gulp = require('gulp')
del = require('del')
webpack = require('webpack')
WebpackDevServer = require('webpack-dev-server')
gutil = require('gulp-util')


publicDir = "./public"

clean = (done) ->
  del([publicDir]
    done)
clean.displayName = 'clean'


gulp.task 'webpack-dev', (callback) ->
  sourceMaps = if process.env.SOURCEMAPS is 'true' then 'source-map' else if process.env.SOURCEMAPS then process.env.SOURCEMAPS else 'eval'
  webpackConfig = _.extend {}, require('./webpack.config.js'),
    devtool: sourceMaps
    output:
      # publicPath: '/assets/'
      filename: '[name].bundle.js'
      path: path.resolve "#{publicDir}/js"

  # Start a webpack-dev-server
  compiler = webpack(webpackConfig)
  webpackDevServerOpts =
    progress: true
    stats:
      colors: true

  new WebpackDevServer(compiler, webpackDevServerOpts).listen 3000, '0.0.0.0', (err) ->
    if err
      throw new gutil.PluginError('webpack-dev-server', err)
    gutil.log '[webpack-dev-server]', 'http://localhost:8079/webpack-dev-server/index.html'
  return


gulp.task('default', gulp.series([
    clean
    'webpack-dev'
  ]))
