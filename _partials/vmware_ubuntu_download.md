## Download Ubuntu ISO

In a later step we will install Ubuntu on our VM, so we need an installation image (ISO). Let's start downloading it already because it is almost 3 Gb!

{% if os == "macos" %}

Do you have an Intel Mac (2020 or before), or an *Apple Silicon* Mac (a.k.a. *M1*, *M2*, *M3*, *M4*, *M5*) (late 2020 and later)?

<details>
  <summary>Expand this if you're unsure.
  </summary>

  1. Click on the Apple icon in the top left corner of your screen.
  1. Click on *About this Mac*.
  1. Check what it says next to *Chip*: 
      - Does it start with *Apple*? You have an **Apple Silicon** Mac.
      - Does it start with *Intel*? You have an **Intel** Mac.

  Remember this for the rest of the bootcamp!

</details>

<br>

The difference is important because they have different architectures:
- Apple Silicon is ARM architecture.
- Intel based macs use the AMD64 architecture.

This will be important when:
- We choose the Ubuntu version to install.
- We install binaries for tools we'll use.
- We use Docker images.

Let's download:

- If you have **Apple Silicon**: download [this ISO image](https://cdimage.ubuntu.com/ubuntu/releases/24.04/release/ubuntu-24.04.4-live-server-arm64.iso) to your Downloads folder.

- If you have an **Intel-based Mac**: download [this ISO image](https://releases.ubuntu.com/jammy/ubuntu-24.04.4-live-server-amd64.iso) to your Downloads folder.


{% else %}

Your machine most probably has an Intel or AMD processor. Then download [this ISO image](https://releases.ubuntu.com/jammy/ubuntu-24.04.4-live-server-amd64.iso) to your Downloads folder.

In the (rather unlikely) case you'd have an ARM based processor (Snapdragon X), download [this ISO image](https://cdimage.ubuntu.com/ubuntu/releases/24.04/release/ubuntu-24.04.4-live-server-arm64.iso) to your Downloads folder.

{% endif %}

While the image is downloading, continue with the next step.







