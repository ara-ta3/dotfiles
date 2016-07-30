current_dir=$(shell pwd)

###################################
#####           vim           #####
###################################

install-vim: clean $(vimlibs) $(HOME)/.vimrc $(HOME)/.vim
	@vim +:PluginInstall +:qa
	@vim +:VimProcInstall +:qa

vimlibs=$(current_dir)/.vim/bundle/Vundle.vim \
		$(current_dir)/.vim/colors/molokai.vim

clean:
	rm -rf $(HOME)/.vim

$(HOME)/.vimrc: $(current_dir)/.vimrc
	ln -sf $< $@

$(HOME)/.vim: $(current_dir)/.vim
	ln -sf $< $@

$(current_dir)/.vim/bundle/Vundle.vim:
	git clone https://github.com/gmarik/Vundle.vim.git $@

$(current_dir)/.vim/colors/molokai.vim:
	curl -L https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > $@

###################################
#####           zsh           #####
###################################

install-zsh: $(HOME)/.zshrc $(zshlibs)

zshlibs=$(HOME)/.zplug/zsh-completions/src/_docker \
		$(HOME)/.zplug/.zsh.d/zsh-completions/src/_hub

$(HOME)/.zshrc: $(current_dir)/.zshrc
	ln -sf $< $@

$(HOME)/.zplug/zsh-completions/src/_docker: $(HOME)/.zplug
	curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > $@

$(HOME)/.zplug/.zsh.d/zsh-completions/src/_hub: $(HOME)/.zplug
	curl -L https://github.com/github/hub/blob/master/etc/hub.zsh_completion > $@

$(HOME)/.zplug:
	mkdir -p $@

$(HOME)/.zsh.d:
	mkdir -p $@

###################################
#####           bash           ####
###################################

install-bash: $(HOME)/.bashrc $(HOME)/git-prompt.sh

$(HOME)/git-prompt.sh:
	curl --output $@ --url https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

$(HOME)/.bashrc: $(current_dir)/bashrc
	cp -f $< $@

###################################
#####          other           ####
###################################

set-git-config:
	$(MAKE) -C gitconfig set-alias

