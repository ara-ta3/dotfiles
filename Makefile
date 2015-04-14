install-vim:
	@sh install.sh

install-atom:
	ln -sf ${HOME}/dotfiles/.atom ${HOME}/.atom

install-zsh:
	ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc
