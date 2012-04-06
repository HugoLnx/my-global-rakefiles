# using:
# rake g:pascal:run[filename] (compile & run)
# rake g:pascal:compile[filename] (just compile)
#
# by hugolnx@gmail.com
require "fileutils"

module PascalFileCommands
  def clean_compile
    compile
    delete_dot_o_file
  end

  def compile
    file = self
    system "fpc #{file} -Ct"
  end

  def run
    file = self
    system "clear"
    system file.without_extension
  end

  def delete_dot_o_file
    file = self
    #FileUtils.rm "#{file.without_extension}.o"
  end

  def delete_compiled_file
    file = self
    FileUtils.rm file.without_extension
  end
end

class PascalFile
  include PascalFileCommands

  def initialize(relative_path)
    @absolute_path = File.expand_path File.join(Rake.original_dir,relative_path)
  end

  def without_extension
    @absolute_path[0..-5]
  end

  def to_s
    @absolute_path
  end
end

namespace :pascal do
  task :run, :filename do |t,args|
    file = PascalFile.new args[:filename]
    file.clean_compile
    system "clear"
    file.run
    file.delete_compiled_file
  end

  task :compile, :filename do |t,args|
    file = PascalFile.new args[:filename]
    file.clean_compile
  end
end
