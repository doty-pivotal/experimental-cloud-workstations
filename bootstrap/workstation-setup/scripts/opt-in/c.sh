echo
echo "Installing common C development tools and libraries"
yum install -d1 -y ccache ctags cmake cscope

# Punt for now
# brew cask install clion
# brew install ninja
# 
# source ${MY_DIR}/scripts/common/download-pivotal-ide-prefs.sh
# pushd ~/workspace/pivotal_ide_prefs/cli
# ./bin/ide_prefs install --ide=clion
# popd
