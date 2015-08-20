install-vim:
	@sh install.sh

install-zsh:
	ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc

install-mac:
	@sh mac/install.sh

set-git-config:
	$(MAKE) -C gitconfig set-alias

install-bash:
	curl --output ${HOME}/git-prompt.sh \
		--url https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
	cp -f ${HOME}/dotfiles/bashrc ${HOME}/.bashrc
