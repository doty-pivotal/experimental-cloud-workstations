#!/usr/bin/env bash
source "/vagrant/workstation-setup/scripts/common/common.sh"
print_script_header

sudo yum install -d1 -y cmake curl openssl-devel gcc

pushd /tmp > /dev/null

  ## Git together has to be build from source, which is rust
  echo "-- Building git-together"
  git clone --depth 1 https://github.com/kejadlen/git-together.git
  pushd git-together > /dev/null
    curl https://sh.rustup.rs -sSf > /tmp/rustup.sh
    chmod +x /tmp/rustup.sh
    /tmp/rustup.sh -y

    source $HOME/.cargo/env
    rustup default nightly

    cargo build

    echo "-- Installing git-together"
    sudo cp target/debug/git-together /usr/local/bin/

  popd > /dev/null

  echo "-- Installing git author"
  git clone --depth 1 https://github.com/Pivotal/git-author.git
  pushd git-author > /dev/null
    # ./setup.sh => We'll just do this ourselves.
    #!/bin/bash

    # create an empty template if it doesn't exist
    touch ~/.git-author-template

    # config git to use a commit template
    git config --global commit.template ~/.git-author-template

    # put git-author to search path, so that `git author` works.
    sudo cp git-author /usr/local/bin

    echo "# suggested git author setting" >> ~/.bashrc
    echo "export GIT_TOGETHER_NO_SIGNOFF=1" >> ~/.bashrc
  popd > /dev/null

popd > /dev/null

echo
echo "-- Setting global Git configurations"
git config --global --add include.path ~/.git-together
git config --global core.editor /usr/bin/vim
git config --global transfer.fsckobjects true
