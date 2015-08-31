install-vim:
	@test -f $HOME/dotfiles/.vim/bundle/Vundle.vim || git clone https://github.com/gmarik/Vundle.vim.git $HOME/dotfiles/.vim/bundle/Vundle.vim
	@test -f $HOME/dotfiles/.vim/colors/molokai.git || git clone https://github.com/tomasr/molokai.git $HOME/dotfiles/.vim/colors/molokai.git
	@rm -rf ${HOME}/.vim
	@ln -sf ${HOME}/dotfiles/.vim ${HOME}/.vim
	@ln -sf ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc

install-zsh-lib:
	mkdir -p ${HOME}/.zsh.d
	test -f ${HOME}/.zsh.d/zsh-syntax-highlighting      || git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ${HOME}/.zsh.d/zsh-syntax-highlighting
	test -f ${HOME}/.zsh.d/zsh-completions              || git clone git://github.com/zsh-users/zsh-completions.git ${HOME}/.zsh.d/zsh-completions
	test -f ${HOME}/.zsh.d/zsh-completions/src/_docker  || curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > ${HOME}/.zsh.d/zsh-completions/src/_docker
	test -f ${HOME}/.zsh.d/zsh-completions/src/_hub     || curl -L https://github.com/github/hub/blob/master/etc/hub.zsh_completion > ${HOME}/.zsh.d/zsh-completions/src/_hub


install-zsh:install-zsh-lib
	ln -sf ${HOME}/dotfiles/.zshrc ${HOME}/.zshrc

install-mac:
	@sh mac/install.sh

set-git-config:
	$(MAKE) -C gitconfig set-alias

install-bash:
	test -f ${HOME}/git-prompt.sh || curl --output ${HOME}/git-prompt.sh \
		--url https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
	cp -f ${HOME}/dotfiles/bashrc ${HOME}/.bashrc
