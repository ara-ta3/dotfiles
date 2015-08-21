set-alias:add-pre-hook
	git config --global alias.br branch
	git config --global alias.graph "log --graph --date=short --decorate=short --pretty=format:'%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s'"
	git config --global alias.log graph
	git config --global alias.mm "merge origin/master"
	git config --global init.templatedir '${HOME}/.git_template'

add-pre-hook:
	mkdir -p ${HOME}/.git_template/hooks
	cp -f ./pre-push ${HOME}/.git_template/hooks/pre-push
