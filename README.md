[![Stories in Ready](https://badge.waffle.io/ga-wdi-boston/installfest.svg?label=ready&title=Ready)](http://waffle.io/ga-wdi-boston/installfest)

![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)

Before you come in...
=====================

OS X
----
Please upgrade to the latest version of OS X, Yosemite (10.10.5).

Windows or Linux
----------------

General Assembly no longer officially supports Windows or Linux in immersive programs. If you have a Windows or a Linux machine, you should contact your Immersive Producer. Instructors may provide support for these operating systems at their own discretion.

If you are on a Windows machine, you **must** set up your computer to dual-boot Linux Ubuntu before you can get started.

--------------------------------------------------------------------------------

Installfest!
============

Follow these instructions to set up your laptop for work in WDI. If you've previously set up a development environment on your computer, you may wish to skip some of these steps; **do not do so** without first checking with an instructor!

If at any point you are unsure of whether you have done something correctly, ask an instructor. It's important in many cases that we do these steps in order.sub

Bash (OS X)
===========

OS X ships with utilities that are slightly different from standard Linux tools. To smooth out *some* of the differences, we need to change how OS X loads our shell (`bash`) configuration.

Check if you have a `.bashrc` file in your home directory. Open your terminal and type `ls ~/.bashrc`. If you receive a warning saying no such file or directory exists, type `touch ~/.bashrc`. This creates an empty file for us.

Next, check if you have a `.bash_profile` in your home directory. Open your terminal and type `ls ~/.bash_profile`. If you receive a warning saying no such file or directory exists, type `touch ~/.bash_profile`.

Then, execute the follow commands at the terminal.

```
echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bash_profile
echo 'test -f ~/.bashrc && source ~/.bashrc' >> ~/.bash_profile
```

Next, we'll look at `.bash_profile` to make sure it has the contents we expect. Type `cat ~/.bash_profile` in the terminal to look at the contents of the file. Near the bottom, you should have something that looks like this:

```
# ~/.bash_profile

export PATH=/usr/local/bin:$PATH
test -f ~/.bashrc && source ~/.bashrc
```

You will also need to update `/etc/paths` by running the following commands.

```
echo '/\/usr\/local\/bin/\nd\nwq' | sudo ed /etc/paths
echo '1i\n/usr/local/bin\n.\nwq' | sudo ed /etc/paths
```

Finally, let's inspect our changes by typing `cat /etc/paths`. It should look like this:

```
# /etc/paths

/usr/local/bin
/usr/bin
/bin
/usr/sbin
/sbin
```

Homebrew
========

Those of you who are on Ubuntu already have a powerful package manager, `apt`, built into your operating system. However, OS X doesn't come with a package manager installed, so we'll be installing a 3rd-party package manager called Homebrew to install software from the command line. If you're running Linux, please feel free to skip ahead to the next section.

Command Line Tools
------------------

In order for Homebrew to work, we'll need to rely on a number of programs that come pre-installed on Linux. Install these tools **via the terminal** using the command `xcode-select --install`. This may require that you run a Software Update before proceeding.

Install Homebrew
----------------

1. First, go to [http://mxcl.github.io/homebrew/](http://mxcl.github.io/homebrew/), scroll down to "Installation" and copy and paste the entire command listed there into your terminal.

1. Homebrew has a built-in diagnostic tool to determine if it's working correctly; you can run it by entering the command `brew doctor` into your terminal.

    **NOTE: YOUR SYSTEM WILL PROBABLY THROW SOME ERRORS HERE!** Some of these errors are probably minor, but some might not be; please wait until one of the instructors has given you the go-ahead before moving on.

1. Once Homebrew says `Your system is ready to brew`, run  `brew update` to update Homebrew's directory of packages.

1. Lastly, install Brew Cask, a Homebrew add-on for installing GUI applications from the command line.

    `brew install caskroom/cask/brew-cask`

Atom
====
The text editor we'll be using in this course is called **Atom**; it was developed by the GitHub team, and is highly extensible.

Installing Atom
---------------
Run the following command(s) to install Atom.

##### OS X

```
brew cask install atom
```

##### Linux

```
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install atom
```

Atom Add-Ons
------------
We're going to use Atom's package manager, `apm`, to add a number of helpful extensions to your Atom installation. For each package listed below, run `apm install <name-of-package>` in the terminal to perform the installation.

- aligner
- aligner-scss
- aligner-css
- aligner-ruby
- atom-beautify
- atom-jshint
- editorconfig
- esformatter
- fixmyjs
- git-diff-details
- git-history
- git-plus
- language-ember-htmlbars
- language-markdown
- linter
- linter-csslint
- linter-eslint
- linter-markdown
- linter-ruby
- linter-scss-lint
- markdown-writer
- sort-lines

NVM and Node/NPM
================

We're going to be installing Node next; Node (and its various packages) will be the foundation of a large part of the course. First, though, we're going to download a tool called [NVM](https://github.com/creationix/nvm) that allows us to maintain multiple different versions of Node, in case we want to switch between them for different projects. Then we'll download Node, and use its associated package manager, NPM, to download and install the following Node modules:

- JShint, a tool for testing JavaScript code quality. (`jshint`)
- Grunt, a tool for automating background tasks. (`grunt-cli`)

--------------------------------------------------------------------------------

1. Run **one** of the following commands to install NVM.

    ```
    # OS X
    brew install nvm
    ```

    ```
    # Linux
    sudo apt-get install npm
    ```

1. Add **one** of the following snippets to your `.bashrc` file:

    ```
    # OS X
    export NVM_DIR=~/.nvm
    source $(brew --prefix nvm)/nvm.sh
    ```

    ```
    # Linux
    export NVM_DIR="/home/your_username/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    ```

1. Use NVM to install the latest stable version of Node (4.2.4)

    ```
    nvm install v4.2.4
    ```
    
    ** if node version 5 is already installed type 
    
    ```
    nvm alias default v4.2.4
    ```
    
    then
    
    ```
    nvm use default
    ```

1. Finally, use NPM to install the Node modules mentioned earlier and make them available across all of our projects.

    ```
    npm install -g jshint grunt-cli
    ```


Git (and GitHub)
================

GitHub
------

If you haven't done so already, go to [GitHub](http://www.github.com) and create and account; be sure to write down your username and password somewhere, since we'll be using these credentials later.

Installing Git
--------------

For OS X, enter the command `brew install git`. For Linux, enter `sudo apt-get install git`. Easy as pie!

Configuring Git
---------------

Now let's take care of some settings.

- Show the current Git branch in the terminal prompt, and tweak Git's EDITOR variable so that commit message pop-ups open in Atom.

    Run the command `atom ~/.bashrc`. Paste the following code into the bottom of the file.

    ```bash
      # Git
      function parse_git_branch {
        ref=$(git symbolic-ref HEAD 2> /dev/null) || return
        echo "("${ref#refs/heads/}")"
      }
      export PS1="\w \$(parse_git_branch)\$ "
      export EDITOR='atom --wait'
    ```

- Colorize git in the command line

    ```
    git config --global color.ui true
    ```

- Set up a global 'excludesfile', listing all the files that we might want git to ignore.

    ```
    git config --global core.excludesfile ~/.gitignore
    echo ".DS_Store" >> ~/.gitignore
    ```

- Set a default user

    ```
    git config --global user.name "yourUsername"
    git config --global user.email "your_email@example.com"
    ```

Linking with GitHub
-------------------

In order to push commits to GitHub from the command line, we need Git and GitHub to have a matching set of SSH keys.

1. Generate a new key by running `ssh-keygen -t rsa -C "your_email@example.com"` (feel free to put in a password or select a non-default location for your keys, but it's not necessary to do so; to move ahead, just keep hitting `enter`).
2. Add this new key to your system by running `ssh-add ~/.ssh/id_rsa`
3. Copy the new key to your clipboard using either `pbcopy < ~/.ssh/id_rsa.pub` (OS X) or `xclip -selection clipboard < ~/.ssh/id_rsa.pub` (Linux); then, log into GitHub.com, go to [https://github.com/settings/ssh](https://github.com/settings/ssh), and paste in your SSH key. To test it out, type the following into the command line:

  `ssh -T git@github.com`

If you get a prompt along the lines of
  ```
  The authenticity of host 'github.com (xxx.xxx.xxx.xxx)'... can't be established.
  RSA key fingerprint is XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX.
  Are you sure you want to continue connecting (yes/no)?
  ```
just type 'yes'. If everything's working, you should get a response like the following:

  `Hi yourUsername! You've succesfully authenticated, but GitHub does not provide shell access.`

Rbenv, Ruby, and Rails
======================

From Rbenv to Ruby
------------------

Rbenv is a tool that we can use to manage multiple versions of Ruby and determine which version we use for a particular project.

1. Install Rbenv

  #####OS X

    Run `brew install rbenv`.

  #####Linux

    Copy and paste this entire line into your terminal and run it.

    `curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash`

2. Tell Rbenv to use homebrew's directories instead of rbenv's

  #####OS X
  Open ~/.bashrc and paste in the following code BEFORE the stuff you pasted in about Git.

    ```bash
    # Rbenv
    export RBENV_ROOT=/usr/local/var/rbenv
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
    ```

  #####Linux

    Open ~/.bashrc and paste in the following code BEFORE the stuff you pasted in about Git.

    ```bash
    # Rbenv
    export RBENV_ROOT="${HOME}/.rbenv"
    if [ -d "${RBENV_ROOT}" ]; then
      export PATH="${RBENV_ROOT}/bin:${PATH}"
      eval "$(rbenv init -)"
    fi
    ```

  Once you've done this, run `source ~/.bashrc` to reload the terminal's settings.

3. (OS X only) Install a tool to re-hash gems after each installation (Linux users, unfortunately must do this manually).

    `brew install rbenv-gem-rehash`

  Then download a package with a number of common gems.

    `brew install rbenv-default-gems`

4. (Linux only) Rbenv on Linux depends on another library called `libffi-dev`. Download and install it with the following command.

    `sudo apt-get install libffi-dev`

5. Install `ruby-build`, a plugin for rbenv.

  #####OS X

    `brew install ruby-build`

  #####Linux

    `git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build`

    `rbenv install ruby-build`

5. Install version 2.2.4 of Ruby and make it the system-wide default using the command

  `rbenv install 2.2.4 && rbenv global 2.2.4`

  You can see what versions of Ruby rbenv has downloaded by running `rbenv versions`; to see which version you are currently using, type either `rbenv version` or `ruby -v`.

## From Ruby to Rails (and more)

Now that you have Ruby installed, you can begin to install gems on your own. However, gems usually come with a lot of unnecessary documentation - let's tell Ruby to skip those by running the following command:

  `echo 'gem: --no-document' >> ~/.gemrc`

Next, we'll go ahead and install Rails.

  `gem install rails`

Here are a couple of other gems we should also install.

  `gem install bundler`
  `gem install rubocop`

#Postgres

Next, we'll download Postgres, a database program that we'll be using for most of the course.

1. First, download and install Postgres.

  #####OS X

  Run `brew install postgres` to install Postgres.

  #####Linux

  Run `sudo apt-get install postgresql libpq-dev` to install Postgres and its dependencies.

1. Then, configure your new Postgres installation by entering the following lines into the console:

  #####OS X

  ```
  mkdir -p ~/Library/LaunchAgents

  ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents

  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

  createdb `whoami`
  ```

  #####Linux

  ```
  sudo -u postgres createuser `whoami` -s

  sudo -u postgres createdb `whoami`

  echo "export PATH=/usr/local/psql/bin:$PATH" >> ~/.bashrc
  ```

  See [https://help.ubuntu.com/community/PostgreSQL](https://help.ubuntu.com/community/PostgreSQL) if you run into any issues with the installation.

  > Whether you're on OS X or Linux, you can test your configuration by running `psql` in the console.

1. Finally, install the `pg` gem from the command line so that Ruby programs can communicate with Postgres.

  `gem install pg`

# Evernote

[Download and install Evernote](https://evernote.com/evernote/)

#CONGRATULATIONS! YOU'RE READY TO ROLL!
