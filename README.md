setup.git
=========
Clone and run this on a new server running Debian 8:

Because blank systems don't come with sudo, run as root first time.
While you're root, add your user to the sudo group.

After running as root, run as user (assumes you now have sudo setup)

```sh
su
apt-get install -y git
exit
cd $HOME
git clone https://github.com/stillgreyfox/setup.git
su
adduser <yourUser> sudo
./setup/setup.sh
exit
./setup/setup.sh
```

See also http://github.com/stillgreyfox/dotfiles and
http://github.com/startup-class/dotfiles
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.
