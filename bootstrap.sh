#!/usr/bin/env bash

# update Ubuntu
apt-get update

# base build utils
sudo apt-get -y install build-essential

# install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn

# install node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get -y install nodejs

# Install Gulp 4
yarn add global gulp-cli@1.2.2
yarn add global gulpjs/gulp#4.0

# need to build Franz
sudo apt-get -y install libxss-dev libxkbfile-dev libgconf-2-4 pkg-config

# git
sudo apt-get -y install git

# clone Franz from GitHub
git clone https://github.com/meetfranz/franz.git

# install
cd franz
sudo yarn install
sudo yarn run rebuild
sudo yarn build

# todo

# Franz's source to shared folder
## ln -s /home/vagrant/franz/src/ /vagrant/franz_src

# make symlink folder 'out' on Host's machine directory
## ln -s /home/vagrant/franz/out/ /vagrant/franz_out

