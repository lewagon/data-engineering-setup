## Let's Make!

Almost there! In the second ansible playbook, the `lewagon/data-engineering-challenges` repository was forked from Le Wagon to your own GitHub account (in the same way as the dotfiles). Let's review how it works.

Our setup will look a bit like this:

![](/images/repo_overview.png)

This allows you to work on challenges, but if any updates are made to the challenge content, you still have access to them!

Check that the `origin` and `upstream` remotes for your `data-engineering-challenges` repository are pointing at the correct repositories on GitHub, run the following:

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
