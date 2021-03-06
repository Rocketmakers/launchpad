#!/bin/bash

function optional_install {
  read -r -p "Do you want $1? [y/N] " response
  if [[ $response =~ ^[yY] ]]
  then
    eval $2
  fi
}

cat << LOGO

                                            [31m [0m[31m.[0m[31m.[0m[31m'[0m[31m.[0m[37m.[0m[37ml[0m[37mo[0m[37mo[0m[37mo[0m[37mo[0m[37mo[0m[37ml[0m[37ml[0m[37mc[0m[37m:[0m[37m,[0m[37m.[0m[37m.[0m
                                      [31m [0m[31m.[0m[31m,[0m[31mc[0m[31md[0m[31mO[0m[31m0[0m[31mK[0m[31mK[0m[31m:[0m[37m'[0m[37m0[0mNNNNNNNNNNNNX[37mX[0m[37m0[0m[37md[0m[37mc[0m[37m,[0m[37m.[0m
                [37m.[0m[37m:[0m[37m:[0m[37mc[0m[37ml[0m[37ml[0m[37mo[0m[37ml[0m[37mc[0m[37m;[0m[37m'[0m[37m.[0m[37m.[0m  [37m.[0m[37m,[0m[37m'[0m[31m.[0m[31m.[0m[31m:[0m[31md[0m[31mk[0m[31m0[0m[31m0[0m[31mO[0m[31mO[0m[31mk[0m[31mk[0m[31mx[0m[31ml[0m[31m.[0m[37mx[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37mO[0m[37m0[0m[37m0[0m[37m0[0m[37m0[0m[37mK[0m[37mK[0m[37mK[0m[37mK[0m[37mO[0m[37mo[0m[37m;[0m[37m.[0m
                  [37m.[0m[37m,[0m[37ml[0m[37md[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mo[0m[37ml[0m[37m:[0m[37m:[0m[31m:[0m[31mc[0m[31m:[0m[31m;[0m[31m;[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31mc[0m[31m,[0m[37m:[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37md[0m[37m:[0m
      .[31m'[0m..            [37m.[0m[37m,[0m[37mc[0m[37md[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mo[0m[37ml[0m[31mc[0m[31m;[0m[31m;[0m[31ml[0m[31mo[0m[31md[0m[31mx[0m[31mO[0m[31m0[0m[31m0[0m[31m:[0m[37mc[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37md[0m[37m,[0m
        .[31m;[0m[31ml[0m[31mo[0m[31md[0m[31md[0m[31mo[0m[31mo[0m[31ml[0m[31ml[0m[31ml[0m[31ml[0m[31ml[0m[31ml[0m[31ml[0m[31mo[0m[31mo[0m[31mo[0m[31ml[0m[37m;[0m[31mc[0m[31mc[0m[31mc[0m[31m:[0m[31m:[0m[31m;[0m[31m;[0m[31m:[0m[31m:[0m[31m:[0m[31mc[0m[31mc[0m[31mc[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m'[0m[37m;[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mo[0m[37m,[0m
              .[31mc[0m[31mx[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mc[0m[31m.[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31mc[0m[31ml[0m[31md[0m[31mx[0m[31mk[0m[37m;[0m[37md[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37ml[0m[37m'[0m
           .[31m,[0m[31ml[0m[31mx[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31md[0m[31m.[0m[31m;[0m[31m;[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m;[0m[31m;[0m[31m;[0m[31m:[0m[31mc[0m[31ml[0m[31ml[0m[31ml[0m[31mc[0m[31mc[0m[31m;[0m[37m'[0m[37md[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37ml[0m[37m,[0m[37m.[0m
         .[31ml[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mx[0m[31ml[0m[31md[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31md[0m[31mc[0m[37m:[0m[37md[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mo[0m[37m:[0m[31m,[0m[31m,[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m,[0m[31m.[0m[37ml[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37md[0m[37ml[0m[37m:[0m[37m'[0m
       .[31ml[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mo[0m[31m;[0m.[31m'[0m[31md[0m[31mk[0m[31mx[0m[31ml[0m[31m;[0m'.':[37mo[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mo[0m[37mc[0m[31mc[0m[31m:[0m[31m;[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m:[0m[31m'[0m[31m,[0m[37mc[0m[37md[0m[37md[0m[37ml[0m[37mc[0m[37m;[0m[37m'[0m[37m.[0m
      [31m:[0m[31mk[0m[31mk[0m[31mk[0m[31mk[0m[31mc[0m.  [31m:[0m[31mx[0m[31mc[0m.  [37m.[0m[37m;[0m[37mo[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mx[0m[37mo[0m[37m:[0m[37m'[0m[37m.[0m[37m.[0m[37m,[0m[37m.[0m[31m.[0m[31m.[0m[31m.[0m[31m.[0m[31m'[0m[31m'[0m[31m'[0m[31m'[0m[31m'[0m[31m'[0m[31m'[0m[31m'[0m[31m.[0m[31m.[0m[31m.[0m[31m.[0m
     [31ml[0m[31mk[0m[31mk[0m[31mk[0m[31mo[0m.   .[31m,[0m   [37m;[0m[37mo[0m[37mx[0m[37mx[0m[37md[0m[37md[0m[37ml[0m[37m:[0m[37m'[0m[37m.[0m
    [31m:[0m[31mk[0m[31mk[0m[31mk[0m[31mo[0m          [37m.[0m
    [31mx[0m[31mk[0m[31mk[0m[31mk[0m.
   .[31mk[0m[31mk[0m[31mk[0m[31mk[0m                     ╔═══════════════════════════╗
    [31md[0m[31mk[0m[31mk[0m[31mk[0m.                    ║ LAUNCHPAD by Rocketmakers ║
    [31m;[0m[31mk[0m[31mk[0m[31mk[0m[31m;[0m                    ╚═══════════════════════════╝
     [31ml[0m[31mk[0m[31mk[0m[31mx[0m.
      [31ml[0m[31mk[0m[31mk[0m[31md[0m.
       [31m;[0m[31mx[0m[31mk[0m[31mk[0m[31mc[0m.
        .[31mo[0m[31mk[0m[31mk[0m[31mk[0m[31mc[0m.
          .[31m:[0m[31mx[0m[31mk[0m[31mk[0m[31md[0m[31m:[0m'.
             .[31m;[0m[31ml[0m[31mx[0m[31mk[0m[31mk[0m[31mx[0m[31ml[0m[31m:[0m[31m,[0m..
                 ..[31m,[0m[31m:[0m[31ml[0m[31md[0m[31mx[0m[31mk[0m[31mk[0m[31md[0m[31mo[0m[31mc[0m[31m:[0m[31m;[0m[31m,[0m'...
                         ...'[31m,[0m[31m;[0m[31m;[0m[31m:[0m[31m:[0m[31mc[0m[31mc[0m[31mc[0m[31ml[0m[31mc[0m[31mc[0m[31m:[0m[31m;[0m[31m;[0m[31m,[0m[31m'[0m'..


LOGO

touch ~/.bashrc
cat > ~/.bash_profile <<- EOM
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
EOM

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
brew install git-flow
brew install httpie

brew tap theory/sqitch
brew install sqitch_pg

brew install caskroom/cask/brew-cask
brew cask install docker
brew cask install google-chrome
brew cask install firefox
brew cask install beyond-compare
brew cask install slack
brew cask install royal-tsx

brew install nodenv
echo "eval \"\$(nodenv init -)\"" >> ~/.bashrc
eval "$(nodenv init -)"
nodenv install 6.5.0
nodenv global 6.5.0
npm i yo -g

brew install rbenv
echo "eval \"\$(rbenv init -)\"" >> ~/.bashrc
eval "$(rbenv init -)"
rbenv install 2.3.1
rbenv global 2.3.1

optional_install "Atom" "brew cask install atom"
optional_install "VS Code" "brew cask install visual-studio-code"
optional_install "pgAdmin" "brew cask install pgadmin3"
optional_install "Mongohub" "brew cask install mongohub"
optional_install "Dropbox" "brew cask install dropbox"

echo "************************"
echo " DONE! Now do some work 🚀"
echo "************************"
