### Launch the VM and Install Ubuntu

{% if os == "macos" %}

Click on the big play button.

> :rotating_light: If at a certain you click inside the black screen, **it will capture your mouse pointer**. You won't be able to do anything on your machine anymore. In that case, **hit `Ctrl` and `Command`** at the same time on your keyboard.

{% else %}

1. While the machine boots up, you will probably be asked something about side channel mitigations. Just click on *OK*.
1. Same when asked about removable devices.

{% endif %}

From now on you'll have to navigate using the arrows, the `<Tab>`, and the `<Enter>` key on your keyboard. Old school!


#### Configure the machine

We'll guide you through the screens step by step.

1. Stick to the default option to **launch Ubuntu**, the first option, and hit `<Enter>` on your keyboard.

1. You'll see lots of messages appear. After a bit you'll be prompted to choose a **language**. Choose *English* and `<Enter>`.

1. You will be asked if you want to update to 26.04. No because we want to stick to Ubuntu 24.04. Choose ***Continue without updating*** and `<Enter>`.

1. In the next step, select your **keyboard** layout, or use `Identify keyboard` if you don't know. Finally select *Done* and hit `<Enter>`.

1. In the next screen, *Choose the **base** for the installation*, choose *Ubuntu Server* and then *Done* and `<Enter>`.

1. In the next step, **network configuration**, stick to the default option, and `<Enter>`.

1. In the next step, **proxy**, just `<Enter>`.

1. Then it will start **testing** if it can connect to the internet to check the Ubuntu archives. Wait until above the rectangle it says *This mirror location passed tests*. Then hit `<Enter>`.

1. In the next step, **storage**, just hit `<Enter>`.

1. In the **summary** screen, hit `<Enter>`.

1. Then you'll be asked to **continue**. Use the arrows to select *Continue* and then `<Enter>`.

#### Create a user account

In the next step, we'll give our machine a name, and define your username and password.

> :rotating_light: Write down everything you input here! :rotating_light:

When you completed a field, use `<Enter>` to jump to the next one.

- **Your name**: This is just a friendly name. Your first name will do.
- **Your server name**: use `myvm`.
- **Username**: use your first name, in lowercase.
- **Password**: up to you, pick something easy you'll remember like the password for your physical machine or something short. Nobody has access to your VM unless they already have access to your physical machine anyway.

#### Continue the configuration

1. In the next screen, **Ubuntu Pro**, keep the default option to *Skip for now*. We don't need it.

1. In the screen asking about **OpenSSH**, make sure to have an X next to *Install OpenSSH Server* by hitting `<Space>` on your keyboard. Then arrow down to select *Done* and `<Enter>`.

1. In the next screen, it asks to install popular **snaps**. We don't want that. Just arrow down to select *Done* and `<Enter>`.

#### Now wait: Ubuntu is being installed

At this point, you will see a long list of messages scroll by while Ubuntu is being installed. Time to wait. It might take many minutes, sometimes without a change on the screen. If you're in doubt, arrow down to see the *Full log* and hit `<Enter>`. This one should change more frequently.

At a certain point you'll see *Installation complete* in the orange bar at the top of the screen. If you're in the full log, select *Close* and `<Enter>`.

Finish by selecting *Reboot Now* and `<Enter>`. This will reboot your VM, not your physical machine.

When it says *Please remove the installation medium*, hit `<Enter>`, even if it gives a warning about being unable to unmount the cdrom.

Your machine will now reboot.

#### Logging in to the machine

After the reboot it will ask for your login. That is the **username** you specified. Your first name in lowercase is what we suggested.

Then your **password**. Normally the same as your physical machine. Type it in. Nothing will appear, that's normal. It doesn't show anything for security reasons: someone watching along won't even know how long your password is!

After hitting `<Enter>`, you should be logged in. You'll see a lot of the text, and at the end you should see the prompt of your VM:

```bash
yourusername@myvm:~$
```

Congratulations! You have installed your VM and logged into it!

