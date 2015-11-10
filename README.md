I started to put my home directory under version control in 2011. See
<http://vcs-home.branchable.com/> for more (and better) approaches.

## Usage

```bash
sudo apt-get install git
git clone --bare https://github.com/nichtich/home.git .git
cd .git
 git config --bool core.bare false
 git config --path core.worktree ~
cd ..
git checkout -f master
git submodule update --init
vim +PluginInstall +qall
# start new shell
```

Vim plugins require texlive to be installed
