/*var jsp = require("uglify-js").parser;
var pro = require("uglify-js").uglify;






var orig_code = "... JS code here";
var ast = jsp.parse(orig_code); // parse code and get the initial AST
ast = pro.ast_mangle(ast); // get a new AST with mangled names
ast = pro.ast_squeeze(ast); // get an AST with compression optimizations
var final_code = pro.gen_code(ast); // compressed code here

// js compress
var jsPaths = ["../neoease/js/neoease.js"]*/

// css compress
var less = require('C:\\Users\\Vanessa\\AppData\\Roaming\\npm\\node_modules\\less');
var parser = new(less.Parser)({
    paths: ['../*/css'], // Specify search paths for @import directives
    filename: '*.less' // Specify a filename, for better error messages
});

parser.parse('.class { width: 1 + 1 }', function (e, tree) {
    tree.toCSS({ compress: true }); // Minify CSS output
});

/*var cssPaths = ["../andrea/css/andrea.css", "../classic/css/classic.css", 
				"../community/css/community.css", "../favourite/css/favourite.css",
				"../i-nove/css/i-nove.css", "../neoease/css/neoease.css",
				"../owmx-3.0/css/owmx-3.0.css", "../terr-house/css/tree-house.css"];

for (var i = 0; i < cssPaths.lengtg; i++) {

}*/