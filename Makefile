install-vim:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	git clone https://github.com/tomasr/molokai.git ~/.vim/colors/molokai.git
	ln -s ${HOME}/dotfiles/.vim ${HOME}/.vim
	ln -s ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc

install-atom:
	ln -s ${HOME}/dotfiles/.atom ${HOME}/.atom

install-zsh:
	ln -s ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc