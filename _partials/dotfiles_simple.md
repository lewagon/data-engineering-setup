## Dotfiles

Let's enhance the developer experience on your Virtual Machine by install Le Wagon's pre-configured [dotfiles 🔗](https://github.com/lewagon/dotfiles) for your terminal, zsh and VS Code.

To customise this configuration for yourself, you'll need to **fork** the repository to your own Github account.

**Forking** creates a copy of the repository under your account (`your_github_username/dotfiles`), which you can then modify with your personal information, such as your name.

<details>
<summary>❗ I started a Le Wagon <strong>Web Development</strong> or <strong>Data Science</strong> bootcamp in 2021 or earlier. ❗</summary>

You may have a older version of the Le Wagon dotfiles.


Open a ticket with a TA and do one of the following:
- Compare your existing dotfiles with the current Le Wagon pyenv-based [dotfiles 🔗](https://github.com/lewagon/dotfiles/tree/master-pyenv), particularly the `.zshrc` and `settings.json` - if there is no meaningful difference, continue with the setup.
- If you are OK with losing your existing dotfiles - delete your existing dotfiles repository on GitHub and continue with the setup
- If you do not want to lose your existing dotfiles, we recommend working with branches:
    - On your **laptop**, or wherever you have a **local** copy of **your** copy of dotfiles
    - Create a branch of your existing dotfiles setup, and push to GitHub - `origin <branchname>`
    - Create a new local branch `master-pyenv`.
    - Switch to `master-pyenv`
    - Pull from `upstream master-pyenv`
    - Resolve any conflicts, commit, and push. It is important that you accept incoming changes to the `zprofile`, `.zshrc`, and `settings.json` files.
    - Continue with the setup
</details>

<br>

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

Next, we need to make sure we use the version of the dotfiles that are made for our `pyenv` based setup:

```bash
git fetch upstream
git checkout -b master-pyenv upstream/master-pyenv --no-track
```

Run the `dotfiles` installer with:

```bash
cd ~/code/$GITHUB_USERNAME/dotfiles && zsh install.sh
```

Check the emails registered with your GitHub Account. You'll need to pick one on the next step:

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
