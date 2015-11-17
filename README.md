emacs
========

My emacs configuration files.
It includes setup script, which creates symbolic links in HOME directory.


Installation on Linux
---------------------

Install Git

Clone Git repository somewhere:

``` bash
git clone git://github.com/genben/emacs emacs
cd emacs
```

Run installation script:

``` bash
chmod +x emacs-create-links.sh
./emacs-create-links.sh
```

Restart VIM


## Installation on Windows

### Install Emacs
Download Emacs binaries from:
http://sourceforge.net/projects/emacsbinw64

### Install Ctrl2Cap from SysInternal

### Install Git

Clone Git repository somewhere:
``` bash
git clone git://github.com/genben/emacs emacs
cd emacs
```

Run installation script (with admin rights).
This will create soft links in C:\User\<user> directory
``` bash
emacs-create-links.bat
```

### Install Ag (Silver searcher):

Caution! Do not use Chocolaty version because is outdated and buggy (skips some files unpredictably)
It doesn’t work under Emacs heml-ag because the it passes parameter "--vimgrep", which is not supported by old version.

Use native Visual Studio port from: https://github.com/kjk/the_silver_searcher
Extract ag.exe and add it to PATH.



## Python development

### Install Python 3.x

### Install Flake8:

``` bash
    pip3 install flake8
```


