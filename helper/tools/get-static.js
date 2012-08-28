var fs = require('fs'),
path = require('path');
 
var getAllFiles = function (root){
    var res = [],
    files = fs.readdirSync(root);
    
    files.forEach(function(file){
        var pathname = root+'/'+file,
        stat = fs.lstatSync(pathname);
        
        if (!stat.isDirectory()){
            if (file.indexOf(".ftl") < 0 && file.indexOf(".properties") < 0 
				&& root.indexOf("../../helper") < 0 && root.indexOf("../../.git") < 0) {
                res.push(pathname);
            }
        } else {
            res = res.concat(getAllFiles(pathname));
        }
    });
    return res;
};

var mkdirsSync = function(dirpath) {
    if(fs.existsSync(dirpath)){
        return;
    }
    var dirs = dirpath.split('/');
    var dir = '';
    for(var i = 0; i < dirs.length; i++) {
        dir += dirs[i] + '/';
        if(!fs.existsSync(dir)){
            fs.mkdirSync(dir);
        }
    }
};

var skins = getAllFiles("../..");
(function () {    
    mkdirsSync("static");
    for (var i = 0; i < skins.length; i++) {
        mkdirsSync(path.dirname(skins[i].replace("../..", "static/skins")));
        fs.writeFileSync(skins[i].replace("../..", "static/skins"), fs.readFileSync(skins[i]), "UTF-8");
    }
})();