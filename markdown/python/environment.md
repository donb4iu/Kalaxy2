# Python Environment

## Reference

- [The ultimate guide to managing Python virtual environments in MacOS](https://medium.com/@miqui.ferrer/the-ultimate-guide-to-managing-python-virtual-environments-in-macos-c8cb49bf0a3c)
- [zauberzeug
/
nicegui](https://github.com/zauberzeug/nicegui)

-  [How to start a Python project with Django in 2020  ](https://medium.com/@cristobalcl/how-to-start-a-python-project-with-django-in-2020-803122721b23)

-  [The Ultimate Python Set Up: Pyenv + Poetry](https://delightfuldatascience.substack.com/p/the-ultimate-python-set-up-pyenv)

## Install

### (3.12.0-venv) #( 04/23/24@ 2:58PM )( donbuddenbaum@donbs-imac ):~/Documents
   pip install nicegui-highcharts

## Setup

### #( 04/22/24@ 6:03PM )( donbuddenbaum@donbs-imac ):~
   pyenv --help
```
Usage: pyenv <command> [<args>]

Some useful pyenv commands are:
   --version   Display the version of pyenv
   activate    Activate virtual environment
   commands    List all available pyenv commands
   deactivate   Deactivate virtual environment
   doctor      Verify pyenv installation and development tools to build pythons.
   exec        Run an executable with the selected Python version
   global      Set or show the global Python version(s)
   help        Display help for a command
   hooks       List hook scripts for a given pyenv command
   init        Configure the shell environment for pyenv
   install     Install a Python version using python-build
   latest      Print the latest installed or known version with the given prefix
   local       Set or show the local application-specific Python version(s)
   prefix      Display prefixes for Python versions
   rehash      Rehash pyenv shims (run this after installing executables)
   root        Display the root directory where versions and shims are kept
   shell       Set or show the shell-specific Python version
   shims       List existing pyenv shims
   uninstall   Uninstall Python versions
   update      Update pyenv, its plugins including the list of available versions
   version     Show the current Python version(s) and its origin
   version-file   Detect the file that sets the current pyenv version
   version-name   Show the current Python version
   version-origin   Explain how the current Python version is set
   versions    List all Python versions available to pyenv
   virtualenv   Create a Python virtualenv using the pyenv-virtualenv plugin
   virtualenv-delete   Uninstall a specific Python virtualenv
   virtualenv-init   Configure the shell environment for pyenv-virtualenv
   virtualenv-prefix   Display real_prefix for a Python virtualenv version
   virtualenvs   List all Python virtualenvs found in `$PYENV_ROOT/versions/*'.
   whence      List all Python versions that contain the given executable
   which       Display the full path to an executable

See `pyenv help <command>' for information on a specific command.
For full documentation, see: https://github.com/pyenv/pyenv#readme
```
### #( 04/22/24@ 6:03PM )( donbuddenbaum@donbs-imac ):~
   pyenv versions

    * system (set by /Users/donbuddenbaum/.pyenv/version)
### #( 04/22/24@ 6:07PM )( donbuddenbaum@donbs-imac ):~
   pyenv install 3.12.0

```
python-build: use openssl@3 from homebrew
python-build: use readline from homebrew
Downloading Python-3.12.0.tar.xz...
-> https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tar.xz
Installing Python-3.12.0...
python-build: use tcl-tk from homebrew
python-build: use readline from homebrew
python-build: use ncurses from homebrew
python-build: use zlib from xcode sdk
Installed Python-3.12.0 to /Users/donbuddenbaum/.pyenv/versions/3.12.0
```
### #( 04/22/24@ 6:15PM )( donbuddenbaum@donbs-imac ):~
   pyenv versions

```
* system (set by /Users/donbuddenbaum/.pyenv/version)
  3.12.0
```

## Django
