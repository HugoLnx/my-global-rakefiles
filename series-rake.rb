# using:
# verifying modifications: rake g:series:nice-names:see[PREFIX]
# applying modifications : rake g:series:nice-names:apply[PREFIX]
#
# by hugolnx@gmail.com

ONDE_BUSCAR = File.join(Rake.original_dir,"*")
REGEXPS = [
  /(\d+)(\d{2})/, # 515
  /s(\d+)e(\d+)/, # s05e15
  /(\d+)x(\d+)/   # 05x15
]

def red(text)
  "\033[31m\033[2m#{text}\033[0m"
end

def green(text)
  "\033[32m\033[4m#{text}\033[0m"
end

def nice_paths(backname)
  series = Dir[ONDE_BUSCAR].collect do |path|
    name = File.basename(path).downcase
    matched = REGEXPS.find{|rgx| name.match(rgx)}
    matched ? [path,$1.to_i,$2.to_i] : nil
  end.compact

  series.collect do |(path,season,episode)|
    name = File.basename(path)
    season_s = sprintf("%.2d",season)
    episode_s = sprintf("%.2d",episode)
    new_name = "#{backname}.#{season_s}x#{episode_s}#{File.extname(name)}"
    new_path = File.join(File.dirname(path),new_name)

    new_path == path ? nil : [path,new_path]
  end.compact
end

namespace :series do
  namespace :"nice-names" do
    task :see , :backname do |t,args|
      nice_paths(args[:backname]).each do |(path,new_path)|
        name = File.basename(path)
        new_name = File.basename(new_path)
        puts "#{green(new_name.inspect)} #{red(name.inspect)}"
      end
      puts 'terminou'
    end

    task :apply, :backname do |t,args|
      nice_paths(args[:backname]).each do |(path,new_path)|
        name = File.basename(path)
        new_name = File.basename(new_path)
        puts "#{green(new_name.inspect)} #{red(name.inspect)}"
        File.rename path, new_path
      end
      puts 'terminou'
    end
  end
end
