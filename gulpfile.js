var gulp    = require('gulp'),
    coffee  = require('gulp-coffee'),
    gutil   = require('gulp-util'),
    wrap    = require('gulp-wrap-umd');

gulp.task('default', function() {
  gulp.src('./src/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(wrap({
      namespace: 'RJE'
    }))
    .pipe(gulp.dest('./public/'))
});
