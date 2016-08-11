all: vimproc \
	gobinaries \
	github.com/nsf/gocode

vimproc:
	@vim +:VimProcInstall +:qa

gobinaries:
	@vim +:GoInstallBinaries +:qa

github.com/nsf/gocode:
	go get -u $@
