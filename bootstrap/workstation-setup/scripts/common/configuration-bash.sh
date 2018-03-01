echo
echo "Configuring bash with bash-it"
BOOTSTRAP_DIR=/vagrant/bootstrap/workstation-setup
VAGRANT_HOME=/home/vagrant
# brew install grc # Round 1 Punt 
# brew install rbenv # Round 1 Punt 
cp $BOOTSTRAP_DIR/files/dircolors.ansi-dark $VAGRANT_HOME/.dircolors
# cp $BOOTSTRAP_DIR/files/.inputrc $VAGRANT_HOME/.inputrc # Round 1 Punt
rm -rf $VAGRANT_HOME/.bash_it
git clone https://github.com/Bash-it/bash-it.git $VAGRANT_HOME/.bash_it
cp $BOOTSTRAP_DIR/files/add_user_initials_to_git_prompt_info.bash $VAGRANT_HOME/.bash_it/custom
cp $BOOTSTRAP_DIR/files/bobby_pivotal/bobby_pivotal.theme.bash $VAGRANT_HOME/.bash_it/themes/bobby/bobby.theme.bash
$VAGRANT_HOME/.bash_it/install.sh
source $VAGRANT_HOME/.bash_profile
bash-it enable completion git
bash-it enable plugin ssh
# bash-it enable plugin rbenv
bash-it enable completion ssh

# echo
# echo "Configuring direnv with bash-it"
# brew install direnv
# cp files/direnv.bash $VAGRANT_HOME/.bash_it/custom/direnv.bash
