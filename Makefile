current_dir=$(shell pwd)

###################################
#####           vim           #####
###################################

install-ideavim: $(HOME)/.ideavimrc

install-nvim: $(HOME)/.config
	ln -s $(HOME)/dotfiles/.vim $</nvim

install-vim: clean 
	ln -sf $(current_dir)/.vim $(HOME)/.vim
	ln -sf $(current_dir)/.vimrc $(HOME)/.vimrc

install-brew:
	brew bundle

clean-brew:
	brew bundle cleanup

# @see https://github.com/volta-cli/volta
install-node-manager: 
	curl https://get.volta.sh | bash
	echo "export $$VOLTA_HOME=$$HOME/.volta"
	echo "export $$PATH=$$VOLTA_HOME/bin:$$PATH"

install-textlint:
	npm install -g textlint textlint-rule-preset-ja-technical-writing textlint-lsp

install-config: $(HOME)/.config/peco git-config

clean:
	rm -rf $(HOME)/.vim
	rm -rf $(HOME)/.config/nvim

$(HOME)/.ideavimrc: $(current_dir)/ideavimrc
	ln -sf $< $@

$(HOME)/.config/peco: $(HOME)/.config
	rm -rf $@
	cp -rf ./config/peco $@

$(HOME)/.cache/dein.vim: $(HOME)/.cache/install.dein.vim.sh
	sh $< $@ --use-vim-config

$(HOME)/.cache/install.dein.vim.sh: $(HOME)/.cache
	curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh > $@

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

$(HOME)/.zshrc: .zshrc
	ln -sf $< $@

$(HOME)/.zfunc/_docker: $(HOME)/.zfunc
	curl -L https://raw.github.com/felixr/docker-zsh-completion/master/_docker > $@

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

git-config: $(HOME)/.git_commit_template $(HOME)/.gitignore_global
	git config --global alias.br "branch -vv"
	git config --global alias.graph "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
	git config --global alias.log graph
	git config --global alias.mm "!sh -c '(git br|grep master > /dev/null) && git merge origin/master || git merge origin/main'"
	git config --global alias.rr "!sh -c '(git br|grep master > /dev/null) && git rebase origin/master || git rebase origin/main'"
	git config --global alias.f "fetch -p"
	git config --global alias.m "merge"
	git config --global alias.pushf "push --force-with-lease"
	git config --global alias.ch "checkout --progress"
	git config --global alias.s "switch"
	git config --global alias.sc "switch -c"
	git config --global alias.r "restore --progress"
	git config --global alias.wp "worktree prune -v"
	git config --global init.templatedir '${HOME}/.git_template'
	git config --global commit.template '${HOME}/.git_commit_template'
	git config --global core.pager "less -cm"
	git config --global core.quotepath "false"
	git config --global core.excludesfile ${HOME}/.gitignore_global
	git config --global pager.branch false

$(HOME)/.git_commit_template:
	touch $@
	echo "$$git_commit_template" > $@

$(HOME)/.gitignore_global:
	touch $@
	echo "$$git_ignore_global" > $@

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
