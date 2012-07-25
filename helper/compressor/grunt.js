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
var fs = require("fs"),
exec = require("child_process").exec;

var skinsCsses = ["andrea", "classic", "community", "favourite", "i-nove", "neoease", "owmx-3.0", "tree-house"];

for (var i = 0; i < skinsCsses.length; i++) {
	var content = "";
	exec("lessc -compress ../../" + skinsCsses[i] + "/css/" + skinsCsses[i] + ".css > ../../" + skinsCsses[i] + "/css/" + skinsCsses[i] + ".min.css", function (error, stdout, stderr) {
		if (error !== null) {
			console.log(error);
		} 	
	});
}




/*
var fs = require("fs");
var less = require('C:\\Users\\Vanessa\\AppData\\Roaming\\npm\\node_modules\\less');
var parser = new(less.Parser)();

fs.readFile('../../andrea/css/andrea.css', 'UTF-8', function (err, data) {
  if (err) throw err;

	new(less.Parser)({
		paths: ["../../andrea/css"],
		filename: "andrea.css"
	}).parse(data, function (e, root) {
		var result = root.toCSS({ compress: true });
		console.log(result);
	});

});



/*var cssPaths = ["../andrea/css/andrea.css", "../classic/css/classic.css", 
				"../community/css/community.css", "../favourite/css/favourite.css",
				"../i-nove/css/i-nove.css", "../neoease/css/neoease.css",
				"../owmx-3.0/css/owmx-3.0.css", "../terr-house/css/tree-house.css"];

for (var i = 0; i < cssPaths.lengtg; i++) {

}*/