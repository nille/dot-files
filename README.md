# Nille's dot-files

## Some stuff you need to configure/install in order to get this to work

## Oh-My-Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Powerlevel9k theme for Oh-My-Zsh

```
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

## Nerd-Fonts

```
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
```

## Misc utilities

```
brew install shpotify
brew install prettyping
brew install node
brew install bat
brew install htop
brew install fzf
brew install zsh-autosuggestions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting
```
Or just do it all in one sweep `brew install shpotify prettyping node bat htop fzf zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting`.

## Setup git defaults

```
git config --global user.name "Nille af Ekenstam"
git config --global user.email n@nille.dev
git config --global help.autocorrect 1
git config --global core.excludesfile ~/.gitignore_global
``` 

## Iterm2
Settings are stored in the folder ./iterm2. Add this to your iterm configuration by way preferences (`cmd+,`) and then "Load preferences from a custom folder or URL".

## Clone this repo and run setup script to create symlinks

```
git clone git@github.com:nille/dot-files.git ~/.dot-files
cd ~/.dot-files/
chmod +x setup.sh
./setup.sh
```

## Setup gpgp-agent för SSH authentication

```
# Create config dir for gpg
mkdir ~/.gnupg

# Create config for gpg-agent
cat > ~/.gnupg/gpg-agent.conf <<EOF
pinentry-program /usr/local/MacGPG2/libexec/pinentry-mac.app/Contents/MacOS/pinentry-mac
use-standard-socket
enable-ssh-support
EOF
```
Restart shell and run `ssh-add -L`.

## Howto use Yubikey for git commit/tag signing

```
# Identify your key id, C91EAE7299FA132F47AF2349A3B57E268039D9A1 in this example
$ gpg --list-keys n@nille.dev
pub   rsa4096 2019-03-15 [SC] [expires: 2022-12-31]
      C91EAE7299FA132F47AF2349A3B57E268039D9A1
uid           [ultimate] Nille af Ekenstam <n@nille.dev>
uid           [ultimate] Nille af Ekenstam <n@nille.org>
uid           [ultimate] Nicklas af Ekenstam <nicklas.ekenstam@konsult.atg.se>
uid           [ultimate] Nille af Ekenstam <ekenstam@gmail.com>
sub   rsa4096 2019-03-15 [A] [expires: 2022-12-31]
sub   rsa4096 2019-03-15 [E] [expires: 2022-12-31]
sub   rsa4096 2019-04-12 [S] [expires: 2024-04-11]
sub   rsa4096 2019-04-12 [E] [expires: 2024-04-11]
sub   rsa4096 2019-04-12 [A] [expires: 2024-04-11]

# Set git signing key globally
$ git config --global user.signingkey C91EAE7299FA132F47AF2349A3B57E268039D9A1

## GitHub show Verified on keys
# You can add your public key to your GitHub profile so your commits shows up as verified
# Export the public key in ascii format and add as a new GPG key https://github.com/settings/keys
$ gpg --armor --export C91EAE7299FA132F47AF2349A3B57E268039D9A1

# Add -S to sign commits
$ git commit -S -m "Test commit"

# Use -s instead of -a to sign git tags
$ git tag -s v1.5 -m 'my signed 1.5 tag'

# Add --show-signature to view signature on commits
$ git show --show-signature

# Run following to always sign commits
$ git config --global commit.gpgsign true
```
