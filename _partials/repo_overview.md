## Your challenge repository

Take a look at your `data-engineering-challenges` structure with `tree -a -L 2`

```bash
.
├── 01-Software-Engineering-Best-Practices # Module level
│   ├── 01-Setup                           # Unit level
│   │   ├── 01-Package-creation            # Challenge level
            ├── .venv                      # your virtual-env for this challenge, created automatically by poetry
            ├── README.md                  # Kitt-displayed readme
            ├── my_package
            │   ├── __init__.py
            │   └── main.py     # YOUR CODE HERE
            ├── makefile                   # Contains `make test` and `make install` commands for you
            ├── poetry.lock                # Created by you when running `make install`
            ├── pyproject.toml             # We already wrote this for you so that poetry install will create all you need
            └── tests
...
...
...
├── .dockerignore
├── .gitignore          # globally ignore file pattern (.env, etc...)
├── CHEATSHEET.md       # Some tips for you
├── Makefile            # Gobal bootcamp commands (e.g. run all `make install` for each challenges, run all tests etc...)
├── make.inc            # This file is accessed by every challenges-level makefile (for refactoring purposes)
├── README.md
├── common              # Le Wagon shared logic between all challenges (used for test purposes)
├── direnvrc-template   # You can remove it once you've added it to your ~/.direnvrc
└── yapf                # Formatting rules for you to auto-format your code
```
