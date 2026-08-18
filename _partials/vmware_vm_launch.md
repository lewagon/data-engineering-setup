### Launch the VM for the first time

Click on the big play button.

From now on you'll have to navigate using the arrows on your keyboard. Old school!

> If at a certain you click inside the black screen, it will capture your mouse pointer. You won't be able to do anything on your machine anymore. In that case, hit `Ctrl` and `Command` at the same time on your keyboard.

#### Configure the machine

Stick to the default option to launch option, the first option, and hit `<Enter>` on your keyboard.

You'll see lots of messages. Then you'll be prompted to choose a language. Choose *English* and `<Enter>`.

It prompts to update to 26.04. We don't want that because we want to use the same setup as everyone else, with Ubuntu 22.04. Choose *Continue without updating* and `<Enter>`.

In the next step, follow the instructions to select your keyboard, or use `Identify keyboard`. Finally select *Done* and hit `<Enter>`.

In the next screen, *Choose the base for the installation*, choose *Ubuntu Server* and then *Done* and `<Enter>`.

In the next step, networking, stick to the default option, and `<Enter>`.

In the next step, proxy, you can normally just `<Enter>`.

Then it will start testing if it can connect to the internet to check the Ubuntu archives. Wait until above the rectangle it says *This mirror location passed tests*. Then hit `<Enter>`.

In the next step, *storage*, just hit `<Enter>`.

In the summary screen, hit `<Enter>`.

Then you'll be asked to continue. Use the arrows to select *Continue* and then `<Enter>`.

#### Create a user account

In the next step, we'll identify the machine, and your username and password.

> Write down everything you input here!

When you completed a field, use `<Enter>` to jump to the next one.

- Your name: your name, it's just a friendly name. Your first name suffices.
- Your server name: `myvm`.
- Username: your first name, lowercase.
- Password: up to you, pick something easy you'll remember. Maybe the password for your physical machine. Nobody has access to your VM unless they already have access to your machine anyway.

#### Continue the configuration

In the next screen, keep the default option to *Skip for now*. We don't need Ubuntu Pro.

In the screen asking about OpenSSH, make sure to have an X next to *Install OpenSSH Server* by hitting `<Space>` on your keyboard. Then arrow down to select *Done* and `<Enter>`.

In the next screen, it asks to install popular snaps. We don't want that. Just arrow down to select *Done* and `<Enter>`.

#### Now wait

At this point, you will see a long list of messages scroll by while Ubuntu is installing. Time to wait. It might take many minutes, sometimes without a change on the screen. If you're in doubt, arrow down to see the *Full log* and hit `<Enter>`.

At a certain point you'll see *Installation complete* in the orange bar at the top of the screen.

If you're in the full log, select *Close* and `<Enter>`.

Finish by selecting *Reboot Now* and `<Enter>`. This will reboot your VM, not your physical machine.

When it says *Please remove the installation medium*, hit `<Enter>`, even if it gives a warning about being unable to unmount the cdrom.

#### Rebooting the machine

Your machine will now reboot.

It will ask for your login. That is the username you specified. Your first name in lowercase normally.

Then your password. Normally the same as your physical machine. Type it in. Nothing will appear, that's normal. It doesn't show anything for security reasons: someone watching along won't even know how long your password is!

After hitting `<Enter>`, you should be logged in. You'll see a lot of the text, and at the end:

```bash
yourusername@myvm:~$
```

Congratulations! You are inside your VM!

