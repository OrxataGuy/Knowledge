# You've deleted your Linux's user root folder 
_(And now you don't know where to hide)_

# Don't panic
It's a relatively easy problem to fix and hopefully you'll be able to get your data back.

# How to resolve this
We will recover the `/home/<username>` folder from our system.

1. First, we'll need to access to the system boot mode. You can usually do this by pressing `Shift+Esc` at system startup. (But maybe your system is different, sometimes when you start, while the system is loading, the system itself tells you how to access boot mode).
2. When we are in boot mode, we'll pick the "Boot into Recovery Mode". This will allow us to access to the root command line of the system.
3. Here we'll run this statement:
```
mount -rw -o remount /
```
This will remount the root folder of the system (But we'll don't have data yet).
4. We'll run the command `passwd` in order to change the root password.
5. After this, we'll reboot the system and in the login panel, we'll press `Ctrl+Alt+F1` to get the command line and we'll login as root.
6. Now, we'll run this statements:
```
cd /home
mv ./<username> ./<username>.bak
mkdir <username>
chown -R <username>:<username> /home/<username>
```
In this way we will have created a new user folder for our user, we will have the old (corrupt) folder as a copy ending in ".bak" from which we can rescue all the data we need.



