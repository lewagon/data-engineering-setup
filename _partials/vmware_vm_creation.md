## Create the VM

{% if os == "macos" %}

1. In the application, in the top left corner, **click on the `+` icon**, and select ***New***.
1. Choose ***Install from disc or disc image***.
1. Drag the **ISO** you downloaded earlier into the app, or click on the button to *Use another disc or disc image...* and navigate to the ISO you downloaded.
1. Click on ***Continue***.

Next we'll **customize the VM** a bit. By default it uses 4 Gb of your RAM and 20 Gb of your hard drive.

1. **Increase the hard drive**:

    1. Click on *Customize settings* and then click on *Save*.
    1. Click on *Hard Disk*.
    1. Increase the size to *30 Gb*, click on *Apply* and close the dialog box.

1. **Increase the memory**: do this only i you have more than 8 Gb of RAM on your machine:

    1. On top of the big black window you will find an icon in the form of a wrench (a spanner). Click it to go back to the settings.
    1. Click on *Processors and Memory*.
    1. Increase the memory so you keep at least 4 Gb for your own machine.
    1. Close the dialog box. (There is no apply button here.)

{% else %}

1. In the application, **click on the button with the big `+` and *Create a New Virtual Machine**.
1. Stick to the pre-selected *Typical* configuration, and click on *Next*.
1. In the next step, browse to the **ISO** you downloaded earlier, and click on *Next*.
1. Leave the default options for the **VM name**, and click on *Next*.
1. Leave the default options for the **VM location**, and click on *Next*.
1. Increase the **disk capacity** to *30 Gb*, and click on *Next*.
1. In the **Ready to Create Virtual Machine**, click on *Finish*.

{% endif %}
