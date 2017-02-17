var gulp = require ('gulp'),
minifycss = require('gulp-minify-css'),
rename = require('gulp-rename'),
uglify = require ('gulp-uglify'),
clean = require('gulp-clean'),
license = require('gulp-header-license'),
fs = require('fs');

gulp.task ('clean', function (cb) {
	var stream = gulp.src('../*/css/*.min.css').pipe(clean({force: true}));
	gulp.src('../*/js/*.min.js').pipe(clean({force: true}));

	return stream;
});

gulp.task ('build', ['clean'], function (cb) {
    var stream = gulp.src ('../*/css/*.css')
    .pipe(rename({ suffix: '.min' }))
	.pipe(minifycss())
	.pipe(gulp.dest ('../'));

    gulp.src ('../*/js/*.js')
    .pipe(rename({ suffix: '.min' }))
	.pipe(uglify({preserveComments: 'license'}))
	.pipe(gulp.dest ('../'));

	return stream;
});

gulp.task ('license', ['clean', 'build'], function () {
	gulp.src('../*/css/*.css')
            .pipe(license(fs.readFileSync('header.txt', 'utf8'), {year: (new Date()).getFullYear()}, 1))
            .pipe(gulp.dest('../'));
});

gulp.task('default', ['clean', 'build', 'license']);