RAKEFILES_DIR = "~/.rakefiles/"


$LOAD_PATH << File.expand_path(RAKEFILES_DIR)

namespace :g do
  load "pascal-rake.rb"
  load "music-rake.rb"
  load "series-rake.rb"
  load "hq-rake.rb"
end
