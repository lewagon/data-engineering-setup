## Let's Make!

Almost there! In the second ansible playbook, the `lewagon/data-engineering-challenges` repository was forked from Le Wagon to you. Let's review how it works.

Our setup will look a bit like this:

![](/images/repo_overview.png)

This allows you to work on challenges, but if we push any changes to the content, you can still access them!

Check your remotes match `origin` your data engineering challenges and `upstream` lewagon's!

```bash
cd ~/code/$(gh api user | jq -r '.login')/data-engineering-challenges
git remote -v
```

Should return:

```
origin  git@github.com:<your_github_username>/data-engineering-challenges.git (fetch)
origin  git@github.com:<your_github_username>/data-engineering-challenges.git (push)
upstream        git@github.com:lewagon/data-engineering-challenges.git (fetch)
upstream        git@github.com:lewagon/data-engineering-challenges.git (push)
```

From challenge folder root **on the vm**, we'll run `make install`, which triggers 3 operations:

- `make install-poetry`: `cd` inside each challenge folders, and `poetry install` inside each! (takes a while)
- `make allow-envrc`: allow direnv to execute inside each folder (otherwise you have to manually "allow" it)
- `make own-repo`: allows your user to be the linux "owner" of all files in this challenge folder

Let's make!

```bash
make install
```

This will take a while. You have time to grab a coffee ☕️, take a break, or start the next step while all your poetry environments are installing.

⚠️ If at the very end of this process you get a few errors like: `direnv: error .envrc file not found` or a Python version isn't available (relating to `Dask`) - that is normal and nothing to worry about 👌
