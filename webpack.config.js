const path = require('path');

module.exports = {
  entry: {
    app: [
      './ui/index.js'
    ]
  },
  output: {
    path: path.resolve(__dirname + '/dist')
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader',
        ]
      },
      {
        test: /\.html$/,
        exclude: /node_modules/,
        loader: 'file-loader?name=[name].[ext]'
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack-loader?verbose=true&warn=true'
      }
    ],
    noParse: /\.elm$/
  },
  devServer: {
    host: '0.0.0.0',
    inline: true,
    port: 3000,
    stats: { colors: true }
  }
}
