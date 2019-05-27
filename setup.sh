#!/bin/bash

rm -rf ~/.aws
ln -s ~/.dot-files/aws ~/.aws

rm -rf ~/.zshrc
ln -s ~/.dot-files/zshrc ~/.zshrc

rm -rf ~/.aliases
ln -s ~/.dot-files/aliases ~/.aliases

rm -rf ~/.powerlevel9k
ln -s ~/.dot-files/powerlevel9k ~/.powerlevel9k

rm -rf ~/.gitignore_global
ln -s ~/.dot-files/gitignore_global ~/.gitignore_global
