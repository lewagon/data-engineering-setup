# Setup instructions

You will find below the instructions to set up your computer for [Le Wagon Data Engineering course](https://www.lewagon.com/)

A part of the setup will be done on your **local machine** but most of the configuration will be done on a **virtual machine**.

Please **read instructions carefully and execute all commands in the following order**. If you get stuck, don't hesitate to ask a teacher for help :raising_hand:

This setup is largely automated with [**Terraform** 🔗](https://developer.hashicorp.com/terraform) and [**Ansible** 🔗](https://docs.ansible.com/). **Terraform** and **Ansible** are [_Infrastructure as Code_ 🔗](https://en.wikipedia.org/wiki/Infrastructure_as_code) tools.
- **Terraform** excels at creating and destroying cloud resources - like virtual machines, IP addresses, databases and more!
- **Ansible** is used to configure linux machines with specific settings and software. Perfect for fine-tuning the Virtual Machine you will be creating with Terraform!

There are three main components to the setup!

## Part 1: Setup your local computer

In this section you'll setup your local computer and create some accounts. It will include:
1. Installing the primary communication tool you'll use on the bootcamp: **Slack**!
2. Create some accounts: Github, Google Cloud Platform (GCP)
3. Install **Visual Studio Code (VS Code)**
4. Install and authentication the GCP command line tool: `gcloud`
5. Install **Terraform** on your local computer
6. Create your virtual machine with **Terraform** and connect to it with **VS Code**!

## Part 2: Configure your Virtual Machine Part 1

All parts of this section happen on your virtual machine.

This section includes:
1. Authenticate your virtual machine with `gcloud`
2. Download and run an **Ansible** playbook to partially configure your virtual machine
3. Login to the Github command line tool on your virtual machine
4. Copy the Le Wagon recommended **dotfiles**. **Dotfiles** are settings that will enhance your terminal and developer experience!

## Part 3: Configure your Virtual Machine Part 2

All parts of this section happen on your virtual machine.

In this section you will:
1. Download and run a second **Ansible** playbook for some more VM fine tuning
2. Test your set up to make sure that everything has installed correctly
3. Create isolated python environments for all your challenges

Don't worry, we'll go into more detail in each of the individual sections 👌

---

There will be copying and pasting of terminal commands in this Setup Guide. There is no expectation that you understand everything that is happening.

🎯 The goal of the session is to get your VM set up correctly and completely so you can fully focus on learning in future sessions, not dealing with lingering setup issues!

Let's start :rocket:

# Part 1: Local Setup
