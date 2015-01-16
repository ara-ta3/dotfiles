install-vim:
	@sh install.sh

install-atom:
	ln -s ${HOME}/dotfiles/.atom ${HOME}/.atom

install-zsh:
	ln -s ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
