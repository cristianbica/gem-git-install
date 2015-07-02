require 'rubygems/command'
require 'tmpdir'

class Gem::Commands::GitinstallCommand < Gem::Command
  def initialize
    super 'gitinstall', "Install gem from a git repo"
    add_option '--force', 'skip validation of the gemspec' do |value, options|
      options[:force] = true
    end
  end

  def execute
    url = get_one_gem_name
    Dir.mktmpdir "gemgitinstall" do |dir|
      clone_repo(url, dir)
      build_gem(dir)
      install_gem(dir)
    end
  end

  def clone_repo(url, dir)
    run "git clone #{url} #{dir}"
  end

  def build_gem(dir)
    force = options[:force] ? " --force" : ""
    run "cd #{dir} && rm -rf *.gem"
    run "cd #{dir} && gem build *.gemspec#{force}"
  end

  def install_gem(dir)
    run "cd #{dir} && gem install *.gem"
  end

  def run(cmd)
    puts "Executing: #{cmd}"
    system cmd
  end

  def arguments # :nodoc:
    "GEMNAME       name of gem to install"
  end

  def usage # :nodoc:
    "#{program_name} GEMNAME"
  end
end
