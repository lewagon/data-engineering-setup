## Dotfiles

Let's jazz up your terminal, zsh, and VS Code by installing Le Wagon's curated [dotfiles](http://github.com/lewagon/dotfiles) **on your Virtual Machine**.

To make this setup your own and customise it further to suit yourself, you'll need to make a _fork_ of it and store it on your own Github account.

Forking means that it will create a new repo in your GitHub account, identical to the original one. You'll have a new repository on your GitHub account, `your_github_username/dotfiles`. We need to fork because each of you will need to put specific information (e.g. your name) in those files.

Open your terminal on your VM and run the following command:

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

You should see your Github username printed.

❗ If you do not see your Github username being printed - **stop here** - and raise a ticket with a TA 🙋 There may be a problem with the previous step (`gh auth`).

Time to fork the repo and clone it on your Virtual Machine:

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

:warning: You **need** to put one of the emails listed above thanks to the previous `gh api ...` command.
If you don't enter a valid email, Kitt will not be able to track your progress. 💡 Select the `@users.noreply.github.com` address if you don't want your email to appear in public repositories you may contribute to.
