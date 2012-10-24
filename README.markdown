My Enviroment
===================

Install
-------


Then, clone your Github fork onto your laptop and install it:

    curl -L http://goo.gl/ERQk8 | sh

Why fork?
---------

You should be able to experiment with your own dotfiles, save them in version
control, and still get updates from `brunohenrique/myEnv`.

The `master` branch is for your customizations and the `upstream` branch is for
myEnv updates.

Set up the upstream branch
--------------------------

You only have to do this once:

    git remote add upstream git@github.com:brunohenrique/myEnv.git
    git fetch upstream
    git checkout -b upstream upstream/master

Make your own customizations
----------------------------

For example, the top of your `~/.gitconfig` might look like this:

    [user]
      name = Bruno Henrique - Garu
      email = squall.bruno@gmail.com

Get myEnv updates
------------------------

Each time you want to include changes:

    git checkout upstream
    git pull
    git checkout master
    git rebase upstream

