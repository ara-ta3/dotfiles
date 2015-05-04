
if [ ! -f $HOME/dotfiles/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/gmarik/Vundle.vim.git $HOME/dotfiles/.vim/bundle/Vundle.vim
fi

if [ ! -f $HOME/dotfiles/.vim/colors/molokai.git ]; then
    git clone https://github.com/tomasr/molokai.git $HOME/dotfiles/.vim/colors/molokai.git
fi

rm -rf ${HOME}/.vim
ln -sf ${HOME}/dotfiles/.vim ${HOME}/.vim
ln -sf ${HOME}/dotfiles/.vimrc ${HOME}/.vimrc

#mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle && \
#    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

