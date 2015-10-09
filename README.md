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

Installation on Windows
-----------------------

Install Git

Clone Git repository somewhere:
``` bash
git clone git://github.com/genben/emacs emacs
cd emacs
```

Run installation script (with admin rights).
This will create soft links in C:\User\<user> directory
``` bash
emacs-create-links.bat
