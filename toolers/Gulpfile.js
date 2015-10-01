var gulp = require ('gulp'),
minifycss = require('gulp-minify-css'),
rename = require('gulp-rename'),
uglify = require ('gulp-uglify'),
clean = require('gulp-clean');

gulp.task ('clean', function () {
	gulp.src('../*/css/*.min.css').pipe(clean({force: true}));

	gulp.src('../*/js/*.min.js').pipe(clean({force: true}));
});

gulp.task ('build', function () {
    gulp.src ('../*/css/*.css')
    .pipe(rename({ suffix: '.min' }))
	.pipe(minifycss({keepSpecialComments: '1'}))
	.pipe(gulp.dest ('../'));

    gulp.src ('../*/js/*.js')
    .pipe(rename({ suffix: '.min' }))
	.pipe(uglify({preserveComments : 'license'}))
	.pipe(gulp.dest ('../'));
});