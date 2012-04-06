# using:
# sudo apt-get install 7zip
# to convert from zip to cbz: rake g:hq:convert-to-cbz
# to compress to cbz: rake g:hq:compress-to-cbz
#
# by hugolnx@gmail.com
require "fileutils"

namespace :hq do
  task :"convert-to-cbz" do
    Dir.chdir(Rake.original_dir)
    FileUtils.mkdir "backup" unless File.exist? "backup"
    Dir.glob("*{rar,cbr,zip}").each do |path|
      path_sem_extensao = Regexp.escape(path.gsub(/\..*$/,''))
      escaped_path = Regexp.escape path
      system "7z x #{escaped_path} -o#{path_sem_extensao}; zip -j #{path_sem_extensao}.cbz #{path_sem_extensao}/**/*.* #{path_sem_extensao}/*.*"
      FileUtils.rm_r File.expand_path(path).gsub(/\..*$/,'')
      FileUtils.mv path,"backup/"
    end
  end

  task :"compress-to-cbz" do
    Dir.chdir(Rake.original_dir)
    diretorios_com_imagens = Dir.glob("**/*.jpg").collect{|path| File.dirname(path)}.uniq
    diretorios_com_imagens.each do |path|
      path_escapada = Regexp.escape(path)
      system "zip -j #{path_escapada}.cbz #{File.join(path_escapada,"/*.*")}"
      FileUtils.rm_r File.expand_path(path)
    end
  end
end
