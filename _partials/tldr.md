## TLDR

Add TLDR - a modern addition to MAN pages, which will help you find nice documentation and examples on most Linux commands:

```bash
echo "alias tldr='docker run --rm -it -v ~/.tldr/:/root/.tldr/ nutellinoit/tldr'" >> ~/.aliases
```

You can try `tldr` with:

```bash
tldr gh
```

<img alt="tldr" src="images/tldr.png" width=500>
