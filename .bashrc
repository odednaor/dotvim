# EC does NOT recommend using the .bashrc file;
# most shells are login shells and your custom
# changes should go in .profile.<username>.

# If you have bash-specific customizations for non-login
# shells, locate them in .bashrc.$USER

if [ -r "$HOME/.bashrc.$USER" ]; then
  . $HOME/.bashrc.$USER
fi

if [ -r "$HOME/.bash_aliases" ]; then
  . $HOME/.bash_aliases
fi


