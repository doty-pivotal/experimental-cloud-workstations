node 'data.pivotal.vm' {
  file {'/tmp/helloworld.txt':
    ensure  => present,
    content => "Hello World!",
  }

  package { 'vim-enhanced':
    ensure => 'installed',
  }


  #-- IaaS Paving is out of scope, see ci-infrastructure repo
  ### - if needed we can pull context from the infrastructure

  #-- Give me a secure connection is out of scope initially
  ### Will need some context from the IaaS paving step.
  ### Where it should live is not yet clear

  #-- What a Pivot expects:
  #   From github.com/pivotal/workstation-setup

  #  scripts/common/git.sh
  ## -> git, git-author (Xin's tool for gpdb developers)
  ## -> git config --global core.editor /usr/bin/vim
  ## -> git config --global transfer.fsckobjects true

  #  contents from scripts/common/git-aliases.sh

  #  scripts/common/cloud-foundry.sh
  ## -> cf-cli
  ## -> bosh-cli

  # TODO: tigervnc
  # A lightweight window manager

  #  scripts/common/applications-common.sh
  ## -> flycut (needs replacement)
  ## -> shiftit (needs replacement)
  ## -> [postman](https://www.getpostman.com/)
  ## -> google-chrome
  ## -> firefox

  #  scripts/common/unix.sh
  ## -> pstree
  ## -> the_silver_searcher
  ## -> jq

  #  scripts/common/configurations.sh
  ## -> if [ ! -d ~/.vim ]; then
  ## ->   git clone https://github.com/pivotal/vim-config.git ~/.vim
  ## ->   ~/.vim/bin/install
  ## -> fi

  #  scripts/opt-in/cc.sh
  ## -> ccache (https://ccache.samba.org/)
  ## -> ctags  (http://ctags.sourceforge.net/)
  ## -> cmake  (https://cmake.org/)
  ## -> cscope (http://cscope.sourceforge.net/ - browse c code)
  ## -> ninja  (https://ninja-build.org/ a build system)

  #  scripts/opt-in/data.sh
  ## was empty

  #  scripts/opt-in/docker.sh
  ## -> docker

  #  scripts/opt-in/golang.sh
  ## -> go

  #  scripts/opt-in/ruby.sh
  ## ->  echo "Installing Ruby tools and Ruby 2.3.1"
  ## ->  cp files/.irbrc ~/.irbrc
  ## ->  brew install readline
  ## ->  eval "$(rbenv init -)"
  ## ->  rbenv install 2.3.1 --skip-existing
  ## ->  rbenv global 2.3.1
  ## ->  gem install bundler
  ## ->  rbenv rehash

  #  scripts/opt-in/java.sh
  ## -> install java
  ## -> echo "Installing Java Development tools"
  ## -> brew tap jcgay/jcgay
  ## -> brew install maven-deluxe
  ## -> brew install gradle
  ## -> brew install springboot


  #  scripts/common/configurations/configurations-bash.sh
  ## echo "Configuring bash with bash-it"
  ## -> grc -> Colorize logfiles and command output - http://korpus.juls.savba.sk/~garabik/software/grc.html
  ## -> coreutils -> GNU File, Shell, and Text utilities
  ## -> rbenv
  ## -> watch - Executes a program periodically
  ## -> cp files/dircolors.ansi-dark ~/.dircolors
  ## -> cp files/.inputrc ~/.inputrc
  ## -> rm -rf ~/.bash_it
  ## -> git clone https://github.com/Bash-it/bash-it.git ~/.bash_it
  ## -> cp files/add_user_initials_to_git_prompt_info.bash ~/.bash_it/custom
  ## -> cp files/bobby_pivotal/bobby_pivotal.theme.bash ~/.bash_it/themes/bobby/bobby.theme.bash
  ## -> ~/.bash_it/install.sh
  ## -> source ~/.bash_profile
  ## -> bash-it enable completion git
  ## -> bash-it enable plugin ssh
  ## -> bash-it enable plugin rbenv
  ## -> bash-it enable completion ssh
  ## -> echo "Configuring direnv with bash-it"
  ## -> direnv - Load/unload environment variables based on $PWD - https://direnv.net
  ## -> cp files/direnv.bash ~/.bash_it/custom/direnv.bash

  # TODO: graphical IDE's and their setup
  ## -> sublime-text
  #  java
  ## -> brew cask install intellij-idea --force # guard against pre-installed intellij
  ## -> source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
  ## -> pushd ~/workspace/pivotal_ide_prefs/cli
  ## ->   ./bin/ide_prefs install --ide=intellij
  ## -> popd
  #  ruby
  ## ->  brew cask install rubymine --force
  ## ->  source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
  ## ->  pushd ~/workspace/pivotal_ide_prefs/cli
  ## ->    ./bin/ide_prefs install --ide=rubymine
  ## ->  pop
  #  golang
  ## -> goland
  ## -> source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
  ## -> pushd ~/workspace/pivotal_ide_prefs/cli
  ## ->   ./bin/ide_prefs install --ide=gogland
  ## -> popd
  #  c
  ## -> clion
  ## -> source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
  ## -> pushd ~/workspace/pivotal_ide_prefs/cli
  ## -> ./bin/ide_prefs install --ide=clion
  ## -> popd


  #-- What a member of team <name> expects:
  ### - for now this will be hardcoded, but this section begs for composability
  ## -> the git pairs file
  ## -> [Customize bash-it](https://github.com/Bash-it/bash-it#custom-scripts-aliases-themes-and-functions)
  ## -> ace-gpdb and stuff

  #-- What the individual expects:
  ### - we are not trying to get rid of your special hooks and sauce
  ### TODO: provide a mechanism for the individual 

}
