## Dotfiles

Let's enhance the developer experience on your Virtual Machine by install Le Wagon's pre-configured [dotfiles 🔗](https://github.com/lewagon/dotfiles) for your terminal, zsh and VS Code.

To customise this configuration for yourself, you'll need to **fork** the repository to your own Github account.

**Forking** creates a copy of the repository under your account (`your_github_username/dotfiles`), which you can then modify with your personal information, such as your name.

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
