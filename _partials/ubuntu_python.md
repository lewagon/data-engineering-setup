## Python & Pip

Ubuntu 20.04 has Python 3.8 pre-installed, but we want to have the latest security release of python 3.8 ([3.8.14](https://www.python.org/downloads/release/python-3814/))

Lets install pyenv to manage our python versions:

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
exec zsh
```
Now install 3.8.14:
```bash
pyenv install 3.8.14
pyenv global
```
Now `python --version` should return `3.8.14`

## Pipx

Next we are going to install [pipx](https://pypa.github.io/pipx/) to install python packages we want globally available while still using virtual environments

```bash
pip install --upgrade pip
python -m pip install --user pipx
python -m pipx ensurepath
exec zsh
```

Lets install a [tldr](https://github.com/tldr-pages/tldr) with pipx

```bash
pipx install tldr
```

Now `tldr` should be globally available, test it out with:

```bash
tldr ls
```

Much more readable than the classic `man ls` (although sometimes you will still need to delve into the man pages to get all of the details!)

## Poetry

[Poetry](https://python-poetry.org/) is a modern Python package manager.

Install Poetry running the following command in your VS Code terminal:

```bash
pipx install poetry
```

## Direnv

[Direnv](https://direnv.net/) is a great utility that will look for `.envrc` files in your directories. When you `cd` into directories with a `.envrc` files, paths will automatically be updated. In our case, this will simplify our workflow and allow us to not have to worry about Poetry managed Python virtual environments.

- Open your direnv config file with VS Code:
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
- Setup shell hook
    ```bash
    direnv hook zsh >> ~/.zshrc
    ```
