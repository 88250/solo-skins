var fs = require("fs"),
exec = require("child_process").exec;
// js compress
var jsPaths = ["neoease"];
for (var i = 0; i < jsPaths.length; i++) {
	var content = "";
	exec("uglifyjs ../../" + jsPaths[i] + "/js/" + jsPaths[i] + ".js > ../../" + jsPaths[i] + "/js/" + jsPaths[i] + ".min.js", function (error, stdout, stderr) {
		if (error !== null) {
			console.log(error);
		} 	
	});
}

// css compress
var skinsCsses = ["andrea", "classic", "community", "favourite", "i-nove", "neoease", "owmx-3.0", "tree-house"];

for (var i = 0; i < skinsCsses.length; i++) {
	var content = "";
	exec("lessc -compress ../../" + skinsCsses[i] + "/css/" + skinsCsses[i] + ".css > ../../" + skinsCsses[i] + "/css/" + skinsCsses[i] + ".min.css", function (error, stdout, stderr) {
		if (error !== null) {
			console.log(error);
		} 	
	});
}