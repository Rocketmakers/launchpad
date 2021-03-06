# Launchpad

## Do this:

Install XCode from the app store

Run the following command

```
$ curl -o- https://raw.githubusercontent.com/Rocketmakers/launchpad/master/launchpad.sh | bash
```


Installs the following:

 * Correct `~/.bash_profile` and `~/.bashrc` setup
 * Homebrew
 * Git, git-flow, and gitflow-semver
 * httpie
 * sqitch for PostgreSQL
 * Caskroom for Homebrew
 * Docker for Mac
 * Chrome and Firefox
 * Beyond Compare
 * Slack
 * Royal TSX
 * nodenv
 * Node 6.5.0
 * Yeoman (global)
 * rbenv
 * Ruby 2.3.1

Optionally installs the following (you'll be asked for each one):

 * Atom
 * VS Code
 * pgAdmin
 * Mongohub
 * Dropbox

## Improving this script

Please add things which you think are necessary or useful! If it is small or
definitely needed, just add a line which installs it. If it is big and/or
contentious, add it as an optional by calling the `optional_install` function.
