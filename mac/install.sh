if [ `which bre > /dev/null;echo $?` -ne 0 ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
c=Caskroom/cask/

# Caskroom Install
brew install caskroom/cask/brew-cask

# libs
brew install git homebrew/php/php56 ruby scala python3 python nodejs gauche go

#Caskroom
brew install ${c}java \
    ${c}vagrant \
    ${c}virtualbox \
    ${c}intellij-idea-ce \
    ${c}google-chrome \
    ${c}dropbox \
    ${c}google-japanese-ime \
    ${c}atom \
    ${c}skype \
    ${c}fraise \


