sudo apt install git libevent-dev libncurses-dev fish automake cmake chromium-browser inkscape gimp -y
sudo apt install rafi
sudo apt install libx11-dev libxft-dev libxext-dev
libx11-dev: Xlib header fils
sudo apt install python2-pip
sudo apt install python3-pip
pip install --upgrade pip
pip3 install --upgrade pip
pip2 install neovim
pip3 install neovim
sudo pip install py3status
sudo apt install build-essential cmake
sudo apt install python-dev python3-dev
apt install unzip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/UbuntuMono.zip -P ~/tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/Monoid.zip -P ~/tmp
unzip ~/tmp/UbuntuMono.zip -d ~/.local/share/fonts
unzip ~/tmp/Monoid.zip -d ~/.local/share/fonts

fc-cache -f -v

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

