var gulp         = require('gulp');
var gulpSequence = require('gulp-sequence')

gulp.task('build', function(cb) {
  var tasks = ['clean',['images'], ['sass', 'browserify']];

  // Since we are still using the asset pipeline I don't think we need to bother
  // reving these files
  //
  // if(process.env.RAILS_ENV === 'production' ||
  //    process.env.RAILS_ENV === 'staging' ) {
  //   tasks.push('rev');
  // }
  tasks.push(cb);
  gulpSequence.apply(this, tasks);
});
