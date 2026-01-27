## Dotfiles

Let's enhance the developer experience on your Virtual Machine by install Le Wagon's pre-configured [dotfiles 🔗](https://github.com/lewagon/dotfiles) for your terminal, zsh and VS Code.

To customise this configuration for yourself, you'll need to **fork** the repository to your own Github account.

**Forking** creates a copy of the repository under your account (`your_github_username/dotfiles`), which you can then modify with your personal information, such as your name.

<details>
<summary><strong>❗ I started a Le Wagon _Web Development_ or _Data Science_ bootcamp in 2021 or earlier.</strong></summary>

Open a ticket with a TA and do the following:
- Compare your existing dotfiles with the current Le Wagon [dotfile 🔗](https://github.com/lewagon/dotfiles), particularly the `.zshrc` and `settings.json` - if there is no meaningful difference, continue with the setup.
- If you are OK with losing your existing dotfiles - delete your existing dotfiles repository and continue with the setup
- If you do not want to lose your existing dotfiles, you can either:
    1. Work with branches
    2. Create a _psuedo fork_ of the Le Wagon dotfiles repository

**Option 1. I want to work with branches:**
- Create a branch of your existing dotfiles setup
- On `main`, pull from `upstream`, resolve conflicts, commit and push. It is important that you accept incoming changes to the `.zshrc` and `settings.json` files
- Continue with the setup

**Option 2. I want a separate repo for this set of dotfiles:**
- Cloning the repository to a different target name
    ```bash
    mkdir -p ~/dotfiles-wagon && git clone git@github.com:lewagon/dotfiles.git ~/dotfiles-wagon
    ```
- Rename the existing `origin` remote to `upstream`
    ```bash
    cd ~/dotfiles-wagon && git remote rename origin upstream
    ```
- Create a new GitHub repository from directory
    ```bash
    cd ~/dotfiles-wagon && gh repo create dotfiles-wagon --source=. --remote=origin
    ```
- Verify your remotes:
    ```bash
    git remote -v

    # origin  git@github.com:<your_github_username>/dotfiles-wagon.git (fetch)
    # origin  git@github.com:<your_github_username>/dotfiles-wagon.git (push)
    # upstream        git@github.com:lewagon/dotfiles.git (fetch)
    # upstream        git@github.com:lewagon/dotfiles.git (push)
    ```
- Delete this current folder
    ```bash
    cd ~ && rm -rf ~/dotfiles-wagon
    ```
- Continue with the setup - replace occurrences of `dotfiles` in the following commands with `dotfiles-wagon`
</details>

Open your terminal on your VM and run the following command:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

You should see your Github username printed.

❗ If you do not see your Github username being printed - **stop here** - and raise a ticket with a TA 🙋 There may be a problem with the previous step (`gh auth`).

To fork the Le Wagon dotfiles repository and clone it on your Virtual Machine. Execute the following command:

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/dotfiles --clone
```

Run the `dotfiles` installer with:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Check the emails registered with your GitHub Account. You'll need to pick one
at the next step:

```bash
gh api user/emails | jq -r '.[].email'
```

Run the git installer:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh git_setup.sh
```

:point_up: This will **prompt** you for your name (`FirstName LastName`) and your email.

:warning: You **need** to put one of the emails listed above from the previous `gh api ...` command.
If you do not enter a valid email, Kitt will not be able to track your progress.

💡 Select the `...@users.noreply.github.com` address if you don't want your email to appear in public repositories you may contribute to.
