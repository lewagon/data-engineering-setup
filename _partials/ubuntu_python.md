## Python & Pip

Ubuntu 22.04 has Python pre-installed, but not the version we're going to use. We are going to use Python 3.12 ([3.12.8](https://www.python.org/downloads/release/python-3128/)).

Let's install pyenv to manage our python versions:

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.zprofile
exec zsh
```

We'll also install a useful `pyenv` plugin called [`pyenv-virtualenv`](https://github.com/pyenv/pyenv-virtualenv). Although we will be using `poetry` for Python package and virtual environment management, `pyenv-virtualenv` is useful for controlling python versions locally.

```bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
exec zsh
```

Now install Python 3.12.8:
```bash
pyenv install 3.12.8
pyenv global 3.12.8
```
Now `python --version` should return `3.12.8`


## Pipx

Next we are going to install [pipx](https://pypa.github.io/pipx/) to install python packages we want globally available while still using virtual environments.

Let's upgrade `pip` first:

```bash
pip install --upgrade pip
```

And install `pipx`:

```bash
python -m pip install --user pipx # --user so that each ubuntu user can have his own 'pipx'
python -m pipx ensurepath
exec zsh
```

Lets install a [tldr](https://github.com/tldr-pages/tldr) with pipx

```bash
pipx install tldr
```

Now `tldr` should be globally available (for the current user), test it out with:

```bash
tldr ls
```

Much more readable than the classic `man ls` (although sometimes you will still need to delve into the man pages to get all of the details!) and it even has pages not included in man such as `tldr gh`:

<img alt="tldr" src="images/tldr.png" width=500>


Lets add a few more packages we want globally available

### black

[black](https://black.readthedocs.io/en/stable/) for helping to format code

```bash
pipx install black
```

### Poetry

[Poetry](https://python-poetry.org/) is a modern Python package manager we will use throughout the bootcamp.

Install Poetry running the following command in your VS Code terminal:

```bash
pipx install poetry
```

Then, let's update default poetry behavior so that virtual envs are always created where `poetry install` is run.
During the bootcamp, you'll see a `.venv` folder being created inside each challenge folder.

```bash
poetry config virtualenvs.in-project true
```

Finally, update your VScode settings to tell it that this `.venv` relative folder path will be your default interpreter!

1. Open the Command Palette ( 🪟 ctrl + shift + P / 🍎 cmd + shift + P )
2. Search for: **Preference: Open Remote Settings (JSON)** - when you open your settings that should be two panels.
3. In the panel that opens on the **right side** search for the line: `python.defaultInterpreterPath`
4. Replace the value (probably `"~/.pyenv/shims/python"`) so that it looks like:

```yml
"python.defaultInterpreterPath": ".venv/bin/python",
```

## Direnv

[Direnv](https://direnv.net/) is a great utility that will look for `.envrc` files in your directories. When you `cd` into directories with a `.envrc` files, paths will automatically be updated. In our case, this will simplify our workflow and allow us to not have to worry about Poetry managed Python virtual environments.

1. First, setup the *direnv hook* to your zsh shell so that direnv gets activated anytime a `.envrc` file exists in current working directory.

```bash
code ~/.zshrc
```

```bash
plugins=(git gitfast ... pyenv ssh-agent direnv) # add `direnv` to the existing list of plugins
```

2. Second, let's configure what will happens anytime `.envrc` file is found

```bash
code ~/.direnvrc
```
- Paste the following lines
    ```bash
    layout_poetry() {
      if [[ ! -f pyproject.toml ]]; then
          log_error 'No pyproject.toml found. Use `poetry new` or `poetry init` to create one first.'
          exit 2
      fi
      # create venv if it doesn't exist
      poetry run true

      export VIRTUAL_ENV=$(poetry env info --path)
      export POETRY_ACTIVE=1
      PATH_add "$VIRTUAL_ENV/bin"
    }
    ```
- Save and close the file

😎 Now, **anytime you `cd` into a challenge folder which contains a `.envrc` file which contains `layout_poetry()` command inside, the function will get executed and your virtual env will switch to the poetry one that is defined by the `pyproject.toml` !**
- No need to prefix all commands with `poetry run <my_command>`, but simply `<my_command>`
- Each challenge will have its own virtual env, and it will be seamless for you to switch between challenges/envs
