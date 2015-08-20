install-vim:
	@sh install.sh

install-zsh-lib:
	mkdir -p ${HOME}/.zsh.d
	git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh.d/zsh-syntax-highlighting
	git clone git://github.com/zsh-users/zsh-completions.git ${HOME}/.zsh.d/zsh-completions
	curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > ${HOME}/.zsh.d/zsh-completions/src/_docker


install-zsh:install-zsh-lib
	ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc

install-mac:
	@sh mac/install.sh

set-git-config:
	$(MAKE) -C gitconfig set-alias

install-bash:
	curl --output ${HOME}/git-prompt.sh \
		--url https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
	cp -f ${HOME}/dotfiles/bashrc ${HOME}/.bashrc
