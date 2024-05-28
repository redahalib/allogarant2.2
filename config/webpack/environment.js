const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

environment.config.set('output', {
  path: path.resolve(__dirname, 'app/assets/javascripts'),
  filename: 'application.js'
});

environment.config.set('node', {
  __dirname: false,
  __filename: false,
  global: true
});

environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    process: 'process/browser',
    Buffer: ['buffer', 'Buffer']
  })
);

module.exports = environment;
