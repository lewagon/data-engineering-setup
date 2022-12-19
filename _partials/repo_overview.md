## Let's Make!

Lets clone the challenges onto your **virtual machine**

```bash
export GITHUB_USERNAME=`gh api user | jq -r '.login'`
echo $GITHUB_USERNAME
```

Then

```bash
mkdir -p ~/code/$GITHUB_USERNAME && cd $_
gh repo fork lewagon/data-engineering-setup --clone
```

From challenge folder root **on the vm**, we'll run `make install`, which triggers 3 operations:

- `make install-poetry`: `cd` inside each challenge folders, and `poetry install` inside each! (takes a while)
- `make allow-envrc`: allow direnv to execute inside each folder (otherwise you have to manually "allow" it)
- `make own-repo`: allows your user to be the linux "owner" of all files in this challenge folder

Let's make! (You've got time for a coffee ☕️, or start next step during the install)

```bash
make install
```
