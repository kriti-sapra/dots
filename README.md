# [@kriti-sapra](https://github.com/kriti-sapra)'s dot files

Use [this tutorial](https://www.atlassian.com/git/tutorials/dotfiles) to set them onto a new system.

### Install dot files to a new system

Prior to the installation make sure you have committed the alias to your .zshrc:

    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    
And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

    echo ".cfg" >> .gitignore
    
Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

    git clone --bare https://github.com/kriti-sapra/dots.git $HOME/.cfg
    
Define the alias in the current shell scope:

    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    
Checkout the actual content from the bare repository to your $HOME:

    config checkout

Set the flag showUntrackedFiles to no on this specific (local) repository:

    config config --local status.showUntrackedFiles no

You're done, from now on you can now type config commands to add and update your dotfiles:

    config status
    config add .vimrc
    config commit -m "Changed vimrc"
    config add .zshrc
    config commit -m "Changed zshrc"
    config push
