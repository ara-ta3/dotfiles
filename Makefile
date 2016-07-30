current_dir=$(shell pwd)

###################################
#####           vim           #####
###################################

install-nvim: $(HOME)/.config install-vim
	ln -s $(HOME)/.vim $</nvim

install-vim: clean \
	$(HOME)/.config/dein.vim \
	$(HOME)/.vimrc \
	$(HOME)/.vim
	@vim +:VimProcInstall +:qa

clean:
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim

$(HOME)/.vimrc: $(current_dir)/.vimrc
	ln -sf $< $@

$(HOME)/.vim: $(current_dir)/.vim
	ln -sf $< $@

$(current_dir)/.vim/bundle/Vundle.vim:
	git clone https://github.com/gmarik/Vundle.vim.git $@

$(current_dir)/.vim/colors/molokai.vim:
	curl -L https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > $@

$(HOME)/.config/dein.vim: $(HOME)/.config/install.dein.vim.sh
	sh $< $@

$(HOME)/.config/install.dein.vim.sh: $(HOME)/.config
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $@

$(HOME)/.config:
	mkdir -p $@

###################################
#####           zsh           #####
###################################

install-zsh: $(HOME)/.zshrc \
	$(HOME)/.zplug/zsh-completions/src/_docker \
	$(HOME)/.zplug/zsh-completions/src/_hub

$(HOME)/.zshrc: $(current_dir)/.zshrc
	ln -sf $< $@

$(HOME)/.zplug/zsh-completions/src/_docker: $(HOME)/.zplug/zsh-completions/src
	curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > $@

$(HOME)/.zplug/zsh-completions/src/_hub: $(HOME)/.zplug/zsh-completions/src
	curl -L https://github.com/github/hub/blob/master/etc/hub.zsh_completion > $@

$(HOME)/.zplug/zsh-completions/src:
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
#####           git           #####
###################################

git-config: $(HOME)/.git_template/hooks/pre-push
	git config --global alias.br branch
	git config --global alias.graph "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
	git config --global alias.log graph
	git config --global alias.mm "merge origin/master"
	git config --global alias.f "fetch"
	git config --global init.templatedir '${HOME}/.git_template'

$(HOME)/.git_template/hooks/pre-push: $(HOME)/.git_template/hooks
	touch $@
	echo "$$git_pre_push" > $@

$(HOME)/.git_template/hooks:
	mkdir -p $@

define git_pre_push
#!/bin/sh
PROTECTED_BRANCHES=( master release )
CURRENT_BRANCH=$$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')
PUSH_COMMAND=$$(ps -ocommand= -p $$PPID)
IS_DESTRUCTIVE='force|delete|\-f'
WILL_REMOVE_PROTECTED_BRANCH=':'$$PROTECTED_BRANCH
for i in "$${PROTECTED_BRANCHES[@]}"
do
    PROTECTED_BRANCH=$$i
    MESSAGE="NO $$PUSH_COMMAND TO $$PROTECTED_BRANCH run 'git fetch && git merge origin $$PROTECTED_BRANCH' by pre-push hook"
    if [[ $$PUSH_COMMAND =~ $$IS_DESTRUCTIVE ]] && [ $$CURRENT_BRANCH = $$PROTECTED_BRANCH ]; then
        echo $$MESSAGE
        exit 1
    fi
    if [[ $$PUSH_COMMAND =~ $$IS_DESTRUCTIVE ]] && [[ $$PUSH_COMMAND =~ $$PROTECTED_BRANCH ]]; then
        echo $$MESSAGE
        exit 1
    fi
    if [[ $$PUSH_COMMAND =~ $$WILL_REMOVE_PROTECTED_BRANCH ]]; then
        echo $$MESSAGE
        exit 1
    fi
done
exit 0
endef
export git_pre_push

