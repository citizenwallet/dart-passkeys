const path = require("path");

module.exports = {
  entry: "./index.js",
  output: {
    filename: "passkeys.js",
    path: path.resolve(__dirname, "lib"),
  },
  devServer: {
    static: {
      directory: path.join(__dirname, "public"),
    },
    client: {
      overlay: false,
    },
    compress: true,
    port: 9000,
  },
};
