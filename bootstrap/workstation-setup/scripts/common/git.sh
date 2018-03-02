BOOTSTRAP_DIR=/vagrant/bootstrap/workstation-setup
VAGRANT_HOME=/home/vagrant

echo
echo "Installing Git and associated tools"

## Git together has to be build from source, which is rust
##   For now installing dependancy here, later we can work on dependancy management

pushd /tmp > /dev/null
  echo "-- Installing git-together"
  git clone https://github.com/kejadlen/git-together.git

  pushd git-together > /dev/null
    curl https://sh.rustup.rs -sSf > /tmp/rustup.sh
    chmod +x /tmp/rustup.sh
    /tmp/rustup.sh -y

    source $HOME/.cargo/env
    rustup default nightly

    cargo build

  popd > /dev/null

  echo "-- Installing git author"
  git clone https://github.com/xinzweb/git-author.git

  pushd git-author > /dev/null
    ./setup.sh
    echo "# suggested git author setting" >> ~/.bashrc
    echo "export GIT_TOGETHER_NO_SIGNOFF=1" >> ~/.bashrc
  popd > /dev/null
popd > /dev/null

echo
echo "Setting global Git configurations"
git config --global --add include.path ~/.git-together
git config --global core.editor /usr/bin/vim
git config --global transfer.fsckobjects true

## Punt for now - if you are missing something look here first
# brew install git
# brew tap git-duet/tap
# brew install git-duet
# brew install git-pair
# brew cask install rowanj-gitx
# brew cask install sourcetree
