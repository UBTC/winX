echo "Installing..."
sudo apt install fish vim emacs wget git gdb curl zip unzip pandoc golang gdebi at fortune-mod tmux

sudo pip3 install ipython
sudo pip3 install notebook
sudo pip3 install qtconsole
sudo pip3 install regex
sudo pip3 install setuptools
sudo pip3 install h5py
sudo pip3 install python-nmap
sudo pip3 install mpmath
sudo pip3 install sympy
sudo pip3 install jupyter
sudo pip3 install pillow
sudo pip3 install numpy
sudo pip3 install scipy
sudo pip3 install matplotlib
sudo pip3 install networkx
sudo pip3 install pandas
sudo pip3 install scikit-learn
sudo pip3 install seaborn
sudo pip3 install moviepy
sudo pip3 install future
sudo pip3 install statsmodels
sudo pip3 install mdp
sudo pip3 install pyneuroml
sudo pip3 install ipdb # IPython debugger
sudo pip3 install keras
sudo pip3 install flask # micro web framework (or django??)
sudo pip3 install pygame
sudo pip3 install simpy
sudo pip3 install tushare # stock data
# --- install tensorflow in fish sh.
sudo pip3 install tensorflow
# if use virtualenv
#sudo pip3 install virtualenv # for tensorflow
#virtualenv  --system-site-packages  ~/tensorflow
#fish -c "~/tensorflow/bin/pip3 install --upgrade tensorflow"
sudo pip3 install findspark
# findspark with lib., instead of add spark_home/python to pythonpath

sudo apt-get autoremove --purge -y

cp ~/.Xmodmap ~/.Xmodmap.backup
git clone https://github.com/UBTC/Q-layout ~/.Q-layout
cp ~/.Q-layout/Q.xmodmap ~/.Xmodmap
echo '' >> ~/.xinitrc
echo 'xmodmap ~/.Xmodmap' >> ~/.xinitrc
# ---
echo -e "\n\nseting up github user!!! <<< --- Please check again!!!\n\n"
git config --global push.default simple
git config --global user.name wmji
git config --global user.email maoji.wang@cims.nyu.edu

echo "Languages"
mv ~/.config/ipython ~/.config/ipython.backup
git clone "https://github.com/ubtc/gopy" ~/.config/ipython
# ---
sh ~/.config/ipython/install_go_pkg.sh
go env

echo "Editors"
# emacs
mv ~/.emacs.d ~/.emacs.d.backup
git clone "https://github.com/ubtc/plus.git" ~/.emacs.d
emacs -nw --batch -l ~/.emacs.d/init.el -f package-refresh-contents
# vim
mv ~/.vim ~/.vim.backup
git clone 'https://github.com/ubtc/vine' ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp
echo -e "`emacs` and `vim` have been installed;"
echo -e "    Run `PlugInstall` to install `vim` plugins (`PlugUpdate` to update)."
echo -e "    Press `U_x` key in elpa packages list view to update emacs packages (autoinstall in the 1st run)."

echo "Shells"
mv ~/.tmux.conf ~/.tmux.conf.backup
cp ./terminal/_tmux.conf ~/.tmux.conf
# ---
mv ~/.ssh ~/.ssh.backup
mkdir -p ~/.ssh
cp ./shell/config.ssh ~/.ssh/config
# ---
cp ./shell/config.fish ~/.config/fish/
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mv ~/.zshrc .zshrc.omzs
cp ./shell/_zshrc ~/.zshrc

echo "Done"
