# Set PY Environment Root to homebrews directory
export PYENV_ROOT=/usr/local/var/pyenv

# enable install of framework variants of python using pyenv 
export PYTHON_CONFIGURE_OPTS="--enable-framework"

# Initialize pyenv and virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
