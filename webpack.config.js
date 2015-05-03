var path = require('path')
var config = {
  entry: {
    app:'./app/app.coffee'
  },
  output: {
    publicPath: "/assets/",
    filename: '[name].bundle.js'
  },
  module: {
    noParse: [],
    loaders:[
      {test: /\.coffee$/, loader: 'coffee-loader'},
      {test: /\.html$/, loader: "ngtemplate?relativeTo=" + (path.resolve(__dirname, './app')) + "/!html" }
    ]
  },

  resolve: {
    alias: {},
    // you can now require('file') instead of require('file.coffee')
    extensions: ['', '.js', '.json', '.coffee']
  },
  plugins: []
};

module.exports = config;
