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
extensions to your Atom installation. For each package listed below, run
`apm install <name-of-package>` in the terminal to perform the installation.

```bash
  # OSX and LINUX
  apm install aligner
```

If you get a `command not found` response in your terminal, you have not
installed shell commands correctly.

```bash
  # OSX and LINUX
  apm install aligner-scss
```

```bash
  # OSX and LINUX
  apm install aligner-css
```

Now that we have some practice with running 'apm install <package_name>', we can
use a shortcut that installs all packages in one go!

```bash
  # OSX and LINUX
  apm install aligner-ruby atom-beautify linter-jshint editorconfig \
  esformatter fixmyjs git-diff-details git-history git-plus language-markdown \
  less-than-slash linter linter-csslint linter-eslint linter-markdown \
  linter-rubocop linter-ruby linter-scss-lint linter-tidy markdown-writer \
  sort-lines language-ember-htmlbars
```

Part of being a good developer is using tools that help you make fewer mistakes.
To that end, let's configure a useful feature in Atom: autosave! First, let's
enable the autosave plugin.

```bash
  apm enable autosave

  # Expect the following response

  # Not Disabled:
  #    autosave
  # Please specify a package to enable
```

Next, open Atom's settings, click the packages tab, and search for autosave.
Then open the "Settings" panel for the autosave plugin.

![Atom Settings > Packages](https://cloud.githubusercontent.com/assets/388761/21697829/41986714-d362-11e6-87ac-f0c42eac72e0.png)

Lastly, ensure the "Enabled" option is checked.

![Autosave Settings](https://cloud.githubusercontent.com/assets/388761/21697838/47338b72-d362-11e6-9106-4a5f476945ca.png)

## Shell Configuration (OS X only)

OS X ships with utilities that are slightly different from standard Linux tools.
To smooth out *some* of the differences, we need to change how OS X loads our
shell (`bash`) configuration.

1.  Make sure that a `.bashrc` file exists in your home directory. In your
    terminal, type:

    ```bash
    # OSX ONLY
    touch ~/.bashrc
    ```

1.  Make sure that a `.bash_profile` file exists in your home directory. In your
    terminal, type:

    ```bash
    # OSX ONLY
    touch ~/.bash_profile
    ```

1.  Bash is usually configured to load `.bashrc` from `.bash_profile`, but OS X
    doesn't do this by default. So we add a command to do so. In your terminal,
    type:

    ```bash
    # OSX ONLY
    echo 'test -f ~/.bashrc && source ~/.bashrc' >> ~/.bash_profile
    ```

1.  Next, we'll look at `.bash_profile` to make sure it has the contents we
    expect. Type the following in the terminal to look at the contents of the file:

    ```bash
    # OSX ONLY
    cat ~/.bash_profile
    ```

    At the bottom, you should have something that looks like this:

    ```bash
    # OSX ONLY
    # ~/.bash_profile

    test -f ~/.bashrc && source ~/.bashrc
    ```

1.  Much of the software we'll be installing goes in `/usr/local/bin`, a
    directory that OS X doesn't search by default. You will also need to update
    `/etc/paths` to add this directory. In your terminal, type:

    ```bash
    # OSX ONLY
    echo '/\/usr\/local\/bin/\nd\nwq' | sudo ed /etc/paths
    echo '1i\n/usr/local/bin\n.\nwq' | sudo ed /etc/paths
    ```

1.  Finally, let's inspect our changes by typing:

    ```bash
    # OSX and LINUX
    cat /etc/paths
    ```

    It should look like this:

    ```bash
    # OSX and LINUX
    # /etc/paths

    /usr/local/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    ```

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

- First, set permissions for `/usr/local` by entering the following command
  into your terminal.

    ```bash
    # OSX and LINUX
    chown -R $(whoami):admin /usr/local
    ```

-   Second, enter this command into your terminal:

    ```bash
    # OSX and LINUX
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

-   Homebrew has a built-in diagnostic tool to determine if it's working
    correctly; you can run it by entering the following command in your terminal:

    ```bash
    # OSX and LINUX
    brew doctor
    ```

**NOTE: YOUR SYSTEM WILL PROBABLY THROW SOME ERRORS HERE!** Some of these
errors are probably minor, but some might not be; please wait until one of the
consultants has given you the go-ahead before moving on.

-   Once Homebrew says `Your system is ready to brew`, run the following command
update Homebrew's directory of packages.

```bash
# OSX and LINUX
brew update
```

-   Lastly, install tidy-html5

```bash
# OSX and LINUX
brew install tidy-html5
```

### Installing NVM and Node/NPM

We're going to be installing Node next; Node (and its various packages) will be
the foundation of a large part of the course. First, though, we're going to
download a tool called [NVM](https://github.com/creationix/nvm) that allows us
to maintain multiple different versions of Node, in case we want to switch
between them for different projects. Then we'll download Node, and use its
associated package manager, NPM, to download and install the following Node
modules:

-   JShint, a tool for testing JavaScript code quality. (`jshint`)
-   Grunt, a tool for automating background tasks. (`grunt-cli`)

```bash
# OSX and LINUX
brew install nvm
```

**Restart your terminal (close it and reopen it; not just the window!)**

-   Open your `.bashrc` file by typing `atom ~/.bashrc` and paste in the
    following depending on your operating system:

    ```bash
    # OSX ONLY
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
    ```

    ```bash
    #LINUX ONLY
    export NVM_DIR="/home/$(whoami)/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    ```

-   Use NVM to install the latest longterm stable version of Node (4.4.7)

    ```bash
    # OSX and LINUX
    nvm install --lts=boron
    nvm alias default v6
    nvm use default
    ```

-   ***Restart your Terminal by quitting the application and re-opening it.***

-   ***AGAIN, Restart your Terminal***

-   Finally, use NPM to install the Node modules mentioned earlier and make them
    available across all of our projects.

    Just like we did before with the Atom packages install, we can string
    together the various packages we'd like installed into one executable
    command:

    ```bash
    # OSX and LINUX
    npm install --global npm
    npm install --global jshint jsonlint grunt-cli remark-lint jscs bower phantomjs-prebuilt
    ```

### Git (and GitHub)

If you haven't done so already, go to [GitHub](http://www.github.com) and create
and account; be sure to write down your username and password somewhere, since
we'll be using these credentials later.

Enter the command:
`brew install git`

## Configuring Git

Now let's take care of some settings.

-   Show the current Git branch in the terminal prompt, and tweak Git's EDITOR
    variable so that commit message pop-ups open in Atom. Run the command:

    ```bash
    atom ~/.bashrc
    ```

-   Paste the following code into the bottom of the file:

    ```bash
    # Git
    function parse_git_branch {
      ref=$(git symbolic-ref HEAD 2> /dev/null) || return
      echo "("${ref#refs/heads/}")"
    }
    export PS1="\w \$(parse_git_branch)\n\$ "
    export EDITOR='atom --wait'
    export VISUAL='atom --wait'
    ```

-   Colorize git in the command line

    ```bash
    git config --global color.ui true
    ```

-   Configure Git

    Use the same email you used to sign up for your gitHub account, and your
    gitHub username. Do not include the `<` or `>`; these are an indication that
    you should change the content in between them.

    ```bash
    git config --global user.name "<yourUsername>"
    git config --global user.email "<your_email@example.com>"
    git config --global pull.rebase true
    git config --global branch.autosetuprebase always
    git config --global push.default simple
    git config --global branch.autosetupmerge true
    git config --global core.editor "atom --wait"
    ```

## Linking with GitHub

### Both OSX and Linux

In order to push commits to GitHub from the command line, we need Git and
GitHub to have a matching set of SSH keys.

-   Generate a new key by running

    ```bash
    ssh-keygen -t rsa -C "<your_email@example.com>"
    ```

(Feel free to put in a password or select a non-default location for your keys,
but it's not necessary to do so; to move ahead, just keep hitting `enter`).

-   Add this new key to your system by running:

    ```bash
    ssh-add ~/.ssh/id_rsa
    ```

-   Copy the new key to your clipboard using either:

    ```bash
    # OSX ONLY
      pbcopy < ~/.ssh/id_rsa.pub
    ```

    **OR**

    ```bash
    # LINUX ONLY
      xclip -selection clipboard < ~/.ssh/id_rsa.pub
    ```

-   Log into GitHub.com, go to [https://github.com/settings/ssh](https://github.com/settings/ssh),
    and paste in your SSH key. To test it out, type the following into the command
    line:

    ```bash
    ssh -T git@github.com
    ```

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

Last thing, now that you have git and GitHub we want this repo on your local
computer. Please follow along as I show you how to fork, clone and put the repo
in the correct directory.

-   Now that our local machine is set up with Git, we need to `fork and clone`
    the [orientation repo](https://github.com/ga-wdi-boston/orientation). Once you
    fork to your Github  account, make sure you copy the HTTPS clone link (It will
    look something like `https://github.com/<your github name>/orientation.git`)

-   In your root directory `cd ~`, let's move to our downloads file by `cd
    Downloads/`, then run `git clone <link copied from github>`.

-   Move into the `oritentation` directory by `cd orientation/`. Now we have to set up
    a global 'excludesfile', listing all the files that we might want git to ignore.

    ```bash
    git config --global core.excludesfile ~/.gitignore
    cp .gitignore ~/.gitignore # from this repository directory
    ```

### Install [`hub`](https://github.com/github/hub)

> hub is a command line tool that wraps git in order to extend it with extra
> features and commands that make working with GitHub easier. -- [`hub`
> README](https://github.com/github/hub).

#### OSX ONLY
```bash
# OSX only
brew install hub
```

After installing `hub`, add the following line to your `~/.bashrc`.

```bash
# OSX only
eval "$(hub alias -s)"
```

#### Linux ONLY

Paste at a Terminal prompt:

```sh
# LINUX ONLY
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
```

```sh
# LINUX ONLY
PATH="$HOME/.linuxbrew/bin:$PATH"
```

Edit your ~/.bash_profile to add ~/.linuxbrew/bin to your PATH:

```sh
# LINUX ONLY
echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile
```

Now you need to install some setup-tools:

```sh
# LINUX ONLY
sudo apt-get install build-essential curl git python-setuptools ruby
```

You're done! Try installing hub:

```sh
# LINUX ONLY
brew install hub
```

## Rbenv, Ruby, and Rails

Rbenv is a tool that we can use to manage multiple versions of Ruby and
determine which version we use for a particular project.

Before we install Rbenv we want to make sure a similar Ruby manager rvm is not
already installed and if it is then we will uninstall it.

```bash
# OSX and LINUX
rvm -h
# expect rvm -h to result in message 'rvm command not found'
# if you do not see the message 'rvm command not found' then run
rvm implode
```

### Linux ONLY

Rbenv on Linux depends on another library called `libffi-dev`. Download and
install it with the following command.

```bash
# LINUX ONLY
sudo apt-get install libffi-dev
```

1.  Install Rbenv

    ```bash
    # OSX and LINUX
    brew install rbenv
    ```

1.  Configure rbenv to use the correct directories:

    `atom ~/.bashrc` and paste in the following code **BEFORE** the stuff you pasted
    in about Git.

    ```bash
    # OSX and LINUX
    # Rbenv
    if which rbenv > /dev/null; then
     eval "$(rbenv init -)"
    fi
    ```

1.  Once you've done this, run the following command to reload the terminal's
    settings:

    ```bash
    # OSX and LINUX
    source ~/.bashrc
    ```

1.  ***Note: after installing gems you may need to run this command***

    ```bash
    # OSX and LINUX
    rbenv rehash
    ```

1.  Install `ruby-build`, a plugin for rbenv.

    ```bash
    # OSX ONLY
    brew install ruby-build
    ```

    ```bash
    # LINUX ONLY
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    ```

    Don't worry if the above step doesn't take. Some Linux machines may not need it.

1.  Before installing our Ruby versions, we need to confirm that rbenv has been
    installed correctly.

    ```bash
    # OSX and LINUX
    rbenv --version
    # expecting message 'rbenv 1.1.0'
    # if you do not get the message 'rbenv 1.1.0' refer to an instructor
    ```

1.  Next, we will install a default gem, `bundler`.
    ```bash
    # OSX and LINUX
    echo bundler > ~/.rbenv/default-gems
    ```

1.  Install version 2.3.1 of Ruby and make it the system-wide default using the
    command:

    ```bash
    # OSX and LINUX
    rbenv install 2.3.1
    rbenv global 2.3.1
    ```

    You can see what versions of Ruby rbenv has downloaded by running
    `rbenv versions`; to see which version you are currently using, type either
    `rbenv version` or `ruby -v`.

1.  Now that you have Ruby installed, you can begin to install gems on your own.
    However, gems usually come with a lot of unnecessary documentation - let's tell
    Ruby to skip those by running the following command:

    ```bash
    # OSX and LINUX
    echo 'gem: --no-document' >> ~/.gemrc
    ```

## Postgres

Next, we'll download Postgres, a database program that we'll be using for most
of the course.

1.  First, download and install Postgres.
    #### OSX ONLY
    ```bash
    # OSX ONLY
    brew install postgres
    ```
    #### LINUX ONLY
    Run to install Postgres and its dependencies.

    ```bash
    # LINUX ONLY
    sudo apt-get install postgresql libpq-dev
    ```

1.  Then, configure your new Postgres installation by entering the following
    lines into the console:

    #### OSX ONLY

    ```bash
    # OSX ONLY
    mkdir -p ~/Library/LaunchAgents

    ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

    createdb `whoami`
    ```

    #### LINUX ONLY
    ```bash
    # LINUX ONLY
    sudo -u postgres createuser `whoami` -s

    sudo -u postgres createdb `whoami`
    ```

    > Whether you're on OS X or Linux, you can test your configuration by running
    > `psql` in the console.
    > To quit, type `\q`

    See [https://help.ubuntu.com/community/PostgreSQL](https://help.ubuntu.com/community/PostgreSQL) if you run into any issues with the installation.

1.  Finally, install the `pg` gem from the command line so that Ruby programs
    can communicate with Postgres.

    ```bash
    # OSX and LINUX
    gem install pg
    ```

## Other Goodies

```bash
# OSX and LINUX
brew install libsass
```

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
