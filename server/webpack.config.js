const path = require('path');

module.exports = {
    mode: 'production',
    entry: './src/index.js',
    output: {
        filename: 'appwrite_bundle.js',
        path: path.resolve(__dirname, 'dist'),
        library: 'Appwrite', // Name of the global object
        libraryTarget: 'window',  // Attach to the window object
    },
};
