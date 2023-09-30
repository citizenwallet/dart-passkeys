const path = require("path");

module.exports = {
  entry: "./index.js",
  output: {
    filename: "passkeys.js",
    path: path.resolve(__dirname, "dist"),
  },
};
