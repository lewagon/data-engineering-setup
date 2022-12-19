## Let's Make!

Lets clone the challenges onto your **virtual machine**

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

Then

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/data-engineering-challenges --clone
```
You want this setup

<img src="https://wagon-public-datasets.s3.amazonaws.com/data-engineering/W0D1/repo-setup.png" width=700 />

Check your remotes match `origin` your data engineerg challenges and `upstream` lewagon's!
```bash
git remote -v
origin          git@github.com:brunolajoie/data-engineering-challenges.git (fetch)
origin          git@github.com:brunolajoie/data-engineering-challenges.git (push)
upstream        git@github.com:lewagon/data-engineering-challenges.git (fetch)
upstream        git@github.com:lewagon/data-engineering-challenges.git (push)
```

From challenge folder root **on the vm**, we'll run `make install`, which triggers 3 operations:

- `make install-poetry`: `cd` inside each challenge folders, and `poetry install` inside each! (takes a while)
- `make allow-envrc`: allow direnv to execute inside each folder (otherwise you have to manually "allow" it)
- `make own-repo`: allows your user to be the linux "owner" of all files in this challenge folder

Let's make! (You've got time for a coffee ☕️, or start next step during the install)

```bash
make install
```
