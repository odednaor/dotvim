--installation: 
	git clone git@github.com:AlexManuskin/dotvim.git ~/.vim 
--make soft links 
	ln -s .vim/vimrc .vimrc 
--Copy or make soft links for .bash files 
--Install the plugins on a new machine
git submodule init 
git submodule update 


Update the plugins
git submodule foreach git pull origin master

--Add new submodule
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
