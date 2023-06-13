## Python & Pip

Ubuntu 22.04 has Python 3.8 pre-installed, but we want to have the latest security release of python 3.8 ([3.8.14](https://www.python.org/downloads/release/python-3814/))

Lets install pyenv to manage our python versions:

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.zprofile
exec zsh
```
Now install 3.8.14:
```bash
pyenv install 3.8.14
pyenv global 3.8.14
```
Now `python --version` should return `3.8.14`

## Pipx

Next we are going to install [pipx](https://pypa.github.io/pipx/) to install python packages we want globally available while still using virtual environments

```bash
pip install --upgrade pip
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

Finally, update your VScode settings to tell it that this `.venv` relative folder path will be your default interpreter !

(Preference: Open Remote Settings (JSON))
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
plugins=(... direnv) # add this direnv to the existing list of plugins
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
- No need to prefix all commands by `poetry run <my_command>`, but simply `<my_command>`
- Each challenge will have its own virtual env, and it will be seemless for you to switch between challenges/envs
