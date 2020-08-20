current_dir=$(shell pwd)

###################################
#####           vim           #####
###################################

install-ideavim: $(HOME)/.ideavimrc

install-nvim: $(HOME)/.config install-vim
	ln -s $(HOME)/.vim $</nvim

install-vim: clean \
	$(HOME)/.config/dein.vim \
	$(HOME)/.vimrc \
	$(HOME)/.vim
	$(MAKE) -f ./vim.mk all

install-config: $(HOME)/.config/peco git-config

clean:
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim

$(HOME)/.ideavimrc: $(current_dir)/ideavimrc
	ln -sf $< $@

$(HOME)/.vimrc: $(current_dir)/.vimrc
	ln -sf $< $@

$(HOME)/.vim: $(current_dir)/.vim
	ln -sf $< $@

$(current_dir)/.vim/bundle/Vundle.vim:
	git clone https://github.com/gmarik/Vundle.vim.git $@

$(current_dir)/.vim/colors/molokai.vim:
	curl -L https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > $@

$(HOME)/.config/peco: $(HOME)/.config
	rm -rf $@
	cp -rf ./config/peco $@

$(HOME)/.config/dein.vim: $(HOME)/.config/install.dein.vim.sh
	sh $< $@

$(HOME)/.config/install.dein.vim.sh: $(HOME)/.config
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $@

$(HOME)/.config:
	mkdir -p $@

###################################
#####           zsh           #####
###################################

zdirs=$(HOME)/.zfunc \
	  $(HOME)/.zsh.d

clean-zsh:
	rm -rf $(zdirs)
	rm -f $(HOME)/.zcompdump

install-zsh: $(HOME)/.zshrc \
	$(HOME)/.zfunc/_docker \
	$(HOME)/.zfunc/_hub

$(HOME)/.zshrc: .zshrc
	ln -sf $< $@

$(HOME)/.zfunc/_docker: $(HOME)/.zfunc
	curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > $@

$(HOME)/.zfunc/_hub: $(HOME)/.zfunc
	curl -L https://raw.githubusercontent.com/github/hub/master/etc/hub.zsh_completion > $@

$(zdirs):
	mkdir -p $@

###################################
#####           bash           ####
###################################

install-bash: $(HOME)/.bashrc

$(HOME)/.bashrc: $(current_dir)/bashrc
	cp -f $< $@

###################################
#####           git           #####
###################################

git-config: $(HOME)/.git_template/hooks/pre-push $(HOME)/.git_commit_template $(HOME)/.gitignore_global
	git config --global alias.br "branch -vv"
	git config --global alias.graph "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
	git config --global alias.log graph
	git config --global alias.mm "merge origin/master"
	git config --global alias.f "fetch -p"
	git config --global alias.m "merge"
	git config --global alias.pushf "push --force-with-lease"
	git config --global alias.ch "checkout --progress"
	git config --global alias.s "switch"
	git config --global alias.r "restore --progress"
	git config --global init.templatedir '${HOME}/.git_template'
	git config --global commit.template '${HOME}/.git_commit_template'
	git config --global core.pager "less -cm"
	git config --global core.quotepath "false"
	git config --global core.excludesfile ${HOME}/.gitignore_global
	git config --global pager.branch false
	(which hub && hub config --global alias.pull "pull-request") || echo "no hub"
	(which hub && hub config --global alias.pl "pull-request") || echo "no hub"

$(HOME)/.git_template/hooks/pre-push: $(HOME)/.git_template/hooks
	touch $@
	echo "$$git_pre_push" > $@
	chmod +x $@

$(HOME)/.git_template/hooks:
	mkdir -p $@

$(HOME)/.git_commit_template:
	touch $@
	echo "$$git_commit_template" > $@

$(HOME)/.gitignore_global:
	touch $@
	echo "$$git_ignore_global" > $@

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

define git_commit_template


# 🐛  :bug: バグ修正
# 👍  :+1: 機能改善
# ✨  :sparkles: 部分的な機能追加
# 🎉  :tada: 盛大に祝うべき大きな機能追加
# ♻️   :recycle: リファクタリング
# 🚿  :shower: 不要な機能・使われなくなった機能の削除
# 💚  :green_heart: テストやCIの修正・改善
# 👕  :shirt: Lintエラーの修正やコードスタイルの修正
# 🚀  :rocket: パフォーマンス改善
# 🆙  :up: 依存パッケージなどのアップデート
# 🔒  :lock: 新機能の公開範囲の制限
# 👮  :cop: セキュリティ関連の改善
endef
export git_commit_template

define git_ignore_global
__pycache__
.DS_Store
endef
export git_ignore_global
