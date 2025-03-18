# Setup instructions

You will find below the instructions to set up your computer for [Le Wagon Data Engineering course](https://www.lewagon.com/)

A part of the setup will be done on your **local machine** but most of the configuration will be done on a **virtual machine**.

Please **read instructions carefully and execute all commands in the following order**. If you get stuck, don't hesitate to ask a teacher for help :raising_hand:

This setup is largely automated with **Terraform** and **Ansible**. There are four main components to the setup! **Terraform** and **ansible** are _Infrastructure as Code_ tools.
- **Terraform** excels at creating and destroying cloud resources, like virtual machines, IP addresses!
- **Ansible** is used to configure linux servers with specific settings and software. Perfect for fine-tuning the Virtual Machine you will be creating!

## Part 1: Setup your local computer

In this section you'll setup your local computer and create some accounts. It will include things like:
1. Install some communication tools: Zoom, Slack
2. Create some accounts: Github, Google Cloud Platform (GCP)
3. Install Visual Studio Code (VS Code)
4. Install and authentication the GCP command line tool: `gcloud`.
5. Install **terraform** on your local computer.
6. Create your virtual machine with **terraform** and connect to it with **VS Code**!

## Part 2: Configure your Virtual Machine Part 1

All parts of this section happen on your virtual machine.

This section includes:
1. Authenticate your virtual machine with `gcloud`
2. Download and run an **ansible** playbook to partially configure your virtual machine.
3. Login to the Github command line tool on your virtual machine
4. Copy some Le Wagon **dotfiles**. **Dotfiles** are settings that will enhance your terminal and developer experience!

## Part 3: Configure your Virtual Machine Part 2

All parts of this section happen on your virtual machine.

In this section you will:
1. Download and run a second **ansible** playbook for some more fine tuning.
2. Test your set up to make sure that everything has installed correctly.
3. Create some python environments.


Don't worry, we'll go into more detail in each of the individual sections.

Let's start :rocket:
