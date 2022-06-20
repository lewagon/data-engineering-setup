## Python & Pip

Ubuntu 20.04 has Python 3.8 pre-installed, so only Pip remains to be installed.

Run the following command in your VS Code terminal:

```bash
echo "PATH=\$PATH:\$HOME/.local/bin" >> ~/.zshrc
source ~/.zshrc
curl -sSL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
python3 /tmp/get-pip.py
```

## Poetry

[Poetry](https://python-poetry.org/) is a modern Python package manager.

Install Poetry running the following command in your VS Code terminal:

```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
echo "PATH=\$PATH:\$HOME/.poetry/bin" >> ~/.zshrc
source ~/.zshrc
```

## Direnv

[Direnv](https://direnv.net/) is a great utility that will look for `.envrc` files in your directories. When you `cd` into directories with a `.envrc` files, paths will automatically be updated. In our case, this will simplify our workflow and allow us to not have to worry about Poetry managed Python virtual environments.

- Open your direnv config file with VS Code:
    ```bash
    code ~/.direnvrc
    ```
- Paste the following lines
    ```bash
    if [[ ! -f pyproject.toml ]]; then
      log_error 'No pyproject.toml found. Use `poetry new` or `poetry init` to create one first.'
      exit 2
    fi
    poetry run true
    export VIRTUAL_ENV=\$(poetry env info --path)
    export POETRY_ACTIVE=1
    PATH_add \"\$VIRTUAL_ENV/bin\"
    ```
- Save and close the file
- Setup shell hook
    ```bash
    direnv hook zsh >> ~/.zshrc
    ```
