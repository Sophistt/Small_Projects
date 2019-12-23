# Vim Configuration

[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)
[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

> A personal configuration of VIM editor in Linux, including Colorscheme, Syntax and Common Plugins.
Includes colorscheme, syntax and common plugins.

Here are a `.vimrc` file to configure VIM editor, a `.ycm_extra_conf.py` used for the **YouCompleteMe** plugin and the `colors` and `syntax` folders for syntax highlight in VIM.


## Table of Contents

- [Background](#background)
- [Install](install)
- [Usage](#usage)
- [Links](#links)

## Background

VIM editor is a really excellent editor in Linux platform. However, some surprising plugins could bring amazing features for it. Here is a folder consisting of `.vimrc`, `.ycm_extra_conf.py` and some sub-folders under the `.vim` folder. Through `.vimrc`, such plugins can be installed easily by the Vundle Plugin.

## Install 

Move the `.vimrc` file to user root folder. 
```
$ mv ./.vimrc ~/
```

Create a folder named `.vim` in the user root folder and move `colors` and `syntax` folders in it.
```
$ mkdir ~/.vim
$ mv colors ~/.vim/
$ mv syntax ~/.vim/
```

Open Vim editor in terminal and install plugins in it.
```
$ vim
:PluginInstall
```
## Usage

After installation of plugins, all plugins should be called successfully except **YouCompleteMe**. To use the **YouCompleteMe** plugin, extra operations and `.ycm_exta_conf.py` file are needed. The detailed tutorial could be found in the following link: [Configuration of Vim](https://sophistt.github.io/linux/2019/06/24/vim-configuration-and-bundle-management.html#bunlde-recommended)

## Links

### colorscheme

- [vim-space-theme](https://github.com/liuchengxu/space-vim-theme)

### syntax 

- [Python](https://github.com/Sophistt/Small_Projects/blob/master/vim_configuration/syntax/python.vim)

### plugins

- [vim-powerline](https://github.com/Lokaltog/vim-powerline)
- [tabular](https://github.com/godlygeek/tabular)
- [vim-autopep8](https://github.com/tell-k/vim-autopep8)
- [Nerdtree](https://github.com/scrooloose/nerdtree)
- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
- [delimitMate](https://github.com/Raimondi/delimitMate)
- [ack.vim](https://github.com/mileszs/ack.vim)
