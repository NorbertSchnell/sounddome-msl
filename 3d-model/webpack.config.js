const path = require("path");
const fs = require("fs");
const HtmlPlugin = require("html-webpack-plugin");
const CopyPlugin = require("copy-webpack-plugin");
const appDirectory = fs.realpathSync(process.cwd());

module.exports = {
  entry: path.resolve(appDirectory, "src/app.ts"), // path to the main .ts file
  output: {
    filename: "bundle.js", // name for the js file that is created/compiled in memory
    path: path.resolve(__dirname, 'public'),
    // clean: true,
  },
  resolve: {
    extensions: [".tsx", ".ts", ".js", ".obj"],
  },
  devServer: {
    host: "0.0.0.0",
    port: 8080, //port that we're using for local host (localhost:8080)
    static: path.resolve(appDirectory, "src"), // tells webpack to serve from the public folder
    hot: true,
  },
  module: {
    rules: [
      {
        test: /\.tsx?$/,
        use: "ts-loader",
        exclude: /node_modules/,
      }
    ],
  },
  plugins: [
    new HtmlPlugin({
      template: path.resolve(appDirectory, "src/index.html"),
      inject: true,
    }),
    new CopyPlugin({
      patterns: [
        { from: "src/assets", to: "assets" },
      ],
    }),
  ],
  mode: "development",
};
