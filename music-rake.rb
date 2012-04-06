# using:
# rake g:musics:nice-names:see
# probably the result will be not the expected, so adapt de SUBS constant
# until works then run:
# rake g:music:nice-names:apply
#
# by hugolnx@gmail.com
SUBS = [
  ["Under-Cover-Of-Darkness-THE STR0KES.mp3","Under Cover Of Darkness.mp3"],
  ["Taken For A Fool - Th Stroke.mp3","Taken For A Fool.mp3"],
  ["the stokes-12-51.mp3","12-51.mp3"],
  [/\.mp3\..MP3/,".mp3"],
  [/\.MP3/,".mp3"],
  #[/^.*[0-9]+\./,""],
  [/.[wW]{3}.*/,""],
  [/(\-.*|)[Rr][Hh][Cc][Pp](\-|)/,""],
  [/^.* \- /,""],
  [/(\[.*\] | \[.*\]|\[.*\])/, ""],
  [/(\(.*\) | \(.*\)|\(.*\))/, ""],
  #[/^[0-9]+/, ""],
  [/^[0-9]+\. /, ""],
  [/^[0-9]+ \- /, ""],
  [/^[0-9]+\- /, ""],
  [/^[0-9]+ \-/, ""],
  [/^[0-9]+ /, ""],
  [/^[0-9]+/, ""],
  [/_/, " "],
  [/^.* \- /,""],
  [/^.*\-/,""],
]
EXTENSOES = ['.mp3','.lrc','.m4a']
ONDE_BUSCAR = File.join(Rake.original_dir,"*")

def red(text)
  "\033[31m\033[2m#{text}\033[0m"
end

def green(text)
  "\033[32m\033[4m#{text}\033[0m"
end

namespace :music do
  namespace :"nice-names" do
    task :apply do
      musics_path = Dir[ONDE_BUSCAR].find_all{|entry| EXTENSOES.include? File.extname(entry).downcase}
      musics_path.each do |path|
        name = File.basename(path)
        new_name = SUBS.inject(name){|new_name,sub| new_name.gsub(sub[0],sub[1]).strip}
        new_name.downcase!
        new_name.gsub!(/ (.)/){|letter| letter.upcase}
        new_name.gsub!(/^(.)/){|letter| letter.upcase}
        new_path = File.join(File.dirname(path),new_name)
        puts "#{green(new_name.inspect)} #{red(name.inspect)}" if new_name != name
        
        File.rename path, new_path
      end
      puts 'terminou'
    end

    task :see do
      musics_path = Dir[ONDE_BUSCAR].find_all{|entry| EXTENSOES.include? File.extname(entry).downcase}
      musics_path.each do |path|
        name = File.basename(path)
        new_name = SUBS.inject(name){|new_name,sub| new_name.gsub(sub[0],sub[1]).strip}
        new_name.downcase!
        new_name.gsub!(/ (.)/){|letter| letter.upcase}
        new_name.gsub!(/^(.)/){|letter| letter.upcase}
        new_path = File.join(File.dirname(path),new_name)
        puts "#{green(new_name.inspect)} #{red(name.inspect)}" if new_name != name
        
        #File.rename path, new_path
      end

      puts 'terminou'
    end
  end
end
