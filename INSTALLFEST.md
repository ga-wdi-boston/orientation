# Installfest

Follow these instructions to set up your laptop for work in WDI. If you've
previously set up a development environment on your computer, you may wish to
skip some of these steps; **do not do so** without first checking with an
consultant!

If at any point you are unsure of whether you have done something correctly,
ask a consultant. It's important in many cases that we do these steps in order.
In general, if you receive no output, the command has executed successfully. (No
news is good news.) If you receive output in your terminal that you didn't
expect, please notify a consultant.

## Git (and GitHub)

If you haven't done so already, go to [GitHub](http://www.github.com) and create
an account; be sure to write down your username and password somewhere, since
we'll be using these credentials later.


Now that you are set up with GitHub, we want this repo on your local
computer. Please follow along as I show you how to fork, clone and put the repo
in the correct directory.

-   We need to `fork and clone`
    the [orientation repo](https://github.com/ga-wdi-boston/orientation). Once you
    fork to your Github  account, make sure you copy the HTTPS clone link (It will
    look something like `https://github.com/<your github name>/orientation.git`)

-   In your root directory `cd ~`, let's move to our downloads file by `cd
    Downloads/`, then run `git clone <link copied from github>`.

-   Move into the `oritentation` directory by typing `cd orientation/`. This directory contains another directory called `config/` containing scripts that we will run to set up our machines!

### Configuring Git

Now let's take care of some settings. Run the command below in your terminal. When prompted, enter the same email you used to sign up for your Github account and your Github username.

```bash
  config/git.sh
```

(Feel free to put in a password or select a non-default location for your keys when prompted,
but it's not necessary to do so; to move ahead, just keep hitting `enter`).

-   Log into GitHub.com, go to [https://github.com/settings/ssh](https://github.com/settings/ssh),
    and paste in your SSH key.

    If you get a prompt along the lines of

    ```bash
    The authenticity of host 'github.com (xxx.xxx.xxx.xxx)'... can\'t be established.
    RSA key fingerprint is XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX.
    Are you sure you want to continue connecting (yes/no)?
    ```

    Just type 'yes'. If everything's working, you should get a response like the
    following:

    ```bash
    Hi yourUsername! You\'ve succesfully authenticated, but GitHub does not provide shell access.
    ```

## Shell Configuration (OS X only)

OS X ships with utilities that are slightly different from standard Linux tools.
To smooth out *some* of the differences, we need to change how OS X loads our
shell (`bash`) configuration.

 In your
    terminal, type:

```bash
  config/bash.sh
```

Now, we will verify the changes made by the previous script:

    In your command line you should see output like this:

    /usr/local/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin


## Homebrew

Those of you who are on Ubuntu may already have a powerful package manager, `apt`,
built into your operating system. However, for both OS X and Linux we'll
be installing a 3rd-party package manager called Homebrew to install software
from the command line.

### Command Line Tools

In order for Homebrew to work, we'll need to rely on a number of programs that
come pre-installed on Linux. Install these tools **via the terminal** using the
command:

```shell
# OSX ONLY
xcode-select --install
```

You should click on the `Install` button when a dialog box appears.

<img width="449"
 alt="cdn_osxdaily_com_wp-content_uploads_2014_02_confirm-install-command-line-tools-mac-os-x_jpg"
 src="https://cloud.githubusercontent.com/assets/388761/23191483/da2ed6c4-f86b-11e6-8f8c-df842736b899.png"
/>

This may require that you run a Software Update before proceeding.

## Install Homebrew

- We will now execute a script to install homebrew. Enter the following command
  into your terminal.

    ```bash
    config/homebrew.sh
    ```

**NOTE: YOUR SYSTEM WILL PROBABLY THROW SOME ERRORS HERE!** Some of these
errors are probably minor, but some might not be; please wait until one of the
consultants has given you the go-ahead before moving on.

-   After resolving errors, enter:

```bash
  brew doctor
```

-   Once Homebrew says `Your system is ready to brew`, run the following command

```bash
config/homebrew.sh update
```

### Installing NVM and Node/NPM

We're going to be installing Node next; Node (and its various packages) will be
the foundation of a large part of the course. First, though, we're going to
download a tool called [NVM](https://github.com/creationix/nvm) that allows us
to maintain multiple different versions of Node, in case we want to switch
between them for different projects. Then we'll download Node, and use its
associated package manager, NPM, to download and install some Node
modules.

```bash
# OSX and LINUX
brew install nvm
```

**Restart your terminal (close it and reopen it; not just the window!)**

-   Run the following command in your terminal:

    ```bash
    config/nvm.sh
    ```

-   ***AGAIN, Restart your Terminal***

-   Finally, we will install the Node modules mentioned earlier and make them
    available across all of our projects.

    ```bash
    config/npm.sh
    ```
### Install [`hub`](https://github.com/github/hub)

> hub is a command line tool that wraps git in order to extend it with extra
> features and commands that make working with GitHub easier. -- [`hub`
> README](https://github.com/github/hub).

```bash
config/hub.sh
```

## Atom

The text editor we'll be using in this course is called **Atom**; it was
developed by the GitHub team, and is highly extensible.

***Note: From this point forward you will open Atom from the command line***

### OSX ONLY

1.  Download Atom from [Atom.io](https://atom.io/).
1.  Move Atom from downloads to the Application directory.

### Linux ONLY

Download the `.deb` file from [Atom.io](https://atom.io/)
Once finished run the following command:

```bash
# LINUX ONLY
sudo dpkg -i atom-amd64.deb
```

### Atom Shell commands

Once Atom is successfully downloaded, open it and in the 'Atom' menu item, click
on 'install shell commands' to install the necessary toolkit.

### Atom Add-Ons

We're going to use Atom's package manager, `apm`, to add a number of helpful
extensions to your Atom installation.

```bash
  config/atom.sh
```

If you get a `command not found` response in your terminal, you have not
installed shell commands correctly.

Part of being a good developer is using tools that help you make fewer mistakes.
To that end, let's configure a useful feature in Atom: autosave! First, let's
enable the autosave plugin.

```
  # Expect the following response from previous script

   Not Disabled:
      autosave
   Please specify a package to enable
```

Next, open Atom's settings, click the packages tab, and search for autosave.
Then open the "Settings" panel for the autosave plugin.

![Atom Settings > Packages](https://cloud.githubusercontent.com/assets/388761/21697829/41986714-d362-11e6-87ac-f0c42eac72e0.png)

Lastly, ensure the "Enabled" option is checked.

![Autosave Settings](https://cloud.githubusercontent.com/assets/388761/21697838/47338b72-d362-11e6-9106-4a5f476945ca.png)

## Chrome

If you do not already have Google Chrome, download it now and set it as your
default browser.

When done do the following on any page in Chrome:

-   Press Command + option + J simultaneously to open up the Chrome inspector
-   On the top right of the inspector window there are three dots, click that.
-   Goto settings and make sure yours look like the following image.

![Chrome Inspector Settings](https://cloud.githubusercontent.com/assets/5384023/21694746/c5732f78-d354-11e6-9cad-9b712ae66a68.png)

-   Next, close the settings section by clicking on the X at the top right.
-   Then click on the Console tab at the top and make sure yours looks like the following image.

![Chrome Inspector Console](https://cloud.githubusercontent.com/assets/388761/15828344/e518662e-2bdc-11e6-8ceb-890eb1ffb1a6.png)

-   Finally, click on the Sources tab that is next to the Console tab.
-   Make sure yours looks like the following image.

![Chrome Inspector Sources](https://cloud.githubusercontent.com/assets/5384023/21694848/2b115a6c-d355-11e6-9ed6-1d6d0a320fa7.png)

## Evernote
__Suggested__

[Download and install Evernote](https://evernote.com/evernote/)

## ScreenHero
__Suggested__

You will be sent and invitation to download screenhero, an app that allows you
to share your screen with other users. This is a useful tool for remote
debugging and pair-programming. Please download this and setup your account when
you get your invite via email.

# CONGRATULATIONS! YOU'RE READY TO ROLL!
