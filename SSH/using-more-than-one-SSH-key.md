# Using more than one SSH key
If you're here, you probably tried to do something like add more than one SSH User in your computer using the same SSH key in order to give access to your computer to two different services. The main problem is that you can only use a key for each insance of a service, so you can't give the same key to different instances of the same service. For example, you cannot use the same key in two different users of GitHub, so you'll need a solution for this. In this case, it can be a little bit difficult, because you have to connect to GitHub with a key, and your device may don't know which key has to use in order to connect via SSH. Here I'll give you an easy and powerfull solution to solve this problem. Let's hands on!

## 1. Locate your .ssh folder
Usually, your .ssh folder is located at your user's root folder, so you should be capable to find it at `~/.ssh` (or `~\.ssh` if you're using Windows). If you don't find that folder on your root folder, please check if you have OpenSSH installed on your device, and install it if you haven't it.

## 2. Working at .ssh folder
If you found that folder, I'm sure that you have alredy run the command `ls ~/.ssh` in order to check what is inside that folder. If you're using any SSH connection, you may see some files like: `known_hosts`, `id_rsa`, and `id_rsa.pub`, for example. Don't worry if your `.ssh` folder is empty, it's ok if it is.

### What are the id_rsa and id_rsa.pub files?
The RSA algorithm (Rivest, Shamir y Adleman) is a widely used method for secure data encryption and digital signature. It is a public-key cryptography algorithm, which means that it uses a pair of keys for encryption and decryption: a public key (the id_rsa.pub file), which is used to encrypt the data, and a private key (the id_rsa file), which is used to decrypt it. The security of the RSA algorithm is based on the difficulty of factoring large composite numbers, which are used as the keys. If you want to know more about RSA you can check [this](!https://web.archive.org/web/20070127130201/http://theory.lcs.mit.edu/~rivest/rsapaper.pdf).

### What is the known_hosts file?
The known_hosts file is used by the SSH protocol to keep track of the remote hosts that a user has connected to. The file stores the hostname and the public key of the remote host, and is used to verify the identity of the remote host when the user connects to it again in the future. When the user attempts to connect to a remote host, SSH will check the known_hosts file for the host's public key. If the key is found and matches the key presented by the remote host, the connection is allowed. If the key is not found or does not match, the user is prompted to confirm whether they want to continue with the connection, as it may indicate that the remote host's identity has been compromised. 

### There exists more algorithms like RSA?
There are several alternatives to RSA that can be used for SSH (Secure Shell) authentication. Some of the most commonly used alternatives include:
1. **DSA (Digital Signature Algorithm):** DSA is a public-key algorithm that is similar to RSA but is optimized for signing data rather than encrypting it. DSA keys are typically smaller than RSA keys and are considered more secure for signing data.
2. **ECDSA (Elliptic Curve Digital Signature Algorithm):** ECDSA is a public-key algorithm that is based on the mathematics of elliptic curves. It is considered to be more secure than RSA and DSA because it uses smaller key sizes to achieve the same level of security.
3. **Ed25519:** Is a public-key algorithm that is based on a new type of curve called Edwards curve. It is considered to be more secure than RSA and DSA because it uses smaller key sizes to achieve the same level of security and it's been designed to be resistant to side-channel attacks.
4. **SSH-Ed25519:** This is a combination of the SSH protocol and the Ed25519 public-key algorithm. It provides secure shell access to remote servers with the added security of the Ed25519 algorithm.
Each algorithm has its own set of benefits and trade-offs, and which one to use depends on the specific needs of the organization.

Now you know all you need to understand all the steps we'll perform at this tutorial. We'll use only the RSA algorithm. but you could use any algorithm of the list, so feel free to use them if you need them.

## 3. Creating a SSH connection
First of all, we need to create a new SSH connection to keep working. Let's imagine that you have two GitHub users and you want to create two SSH connections to them from the same computer. As I said before, you cannot use the same key for both users, so you'll need create two SSH connections. And we'll use the `ssh-keygen` command to create them. But first of all, you should open your terminal as a `root user` with `sudo su` command (Or open your terminal as an administrator if you're using Windows). Then you must follow these steps:
1. We'll access to the `.ssh` folder with `cd ~/.ssh` to make things easier.
2. After that we'll create our first RSA pair of keys with the command:
```
ssh-keygen -t rsa -C "your@email.com" -f "Your-GitHub-Username"
```
Remember, you can use any algorithm you want, but you have to use, at least, your GitHub email in the command. You can choose if the name of the key (the `-f` argument) is your GitHub (or any organization) username or not, but I think it's usefull in order to identificate the key quickly if you need to reset it or delete it.
3. Now the `ssh-keygen` will ask you for something called Passphrase. You can omit it and press `Enter` (twice, because it will ask you to introduce the same passphrase again). After that, the terminal will show you a randomart (it's an unique fingerprint of your connection), and finally you'll be able to check if the key was created by running the command `ls`. You'll see two new files, `GitHubUser`, and `GitHubUser.pub`.
4. Congratulations! You have a new SSH connection created! But wait, it's created, but it isn't registrated...

## 4. Working with the ssh-agent
The SSH Agent is a program that runs on a computer and holds the private keys used for public key authentication, allowing the user to use their keys without having to enter the passphrase every time. This is particularly useful for automating tasks and for logging into remote servers without having to manually enter the passphrase. In our case we have to register our new key through the command `ssh-add`. This is an easy step, you have to run `ssh-add ~/.ssh/GitHubUser` and you'll have all done here.

But... if you have a message like:
``` 
Error connecting to agent: No such file or directory
```
Don't worry, now I'll take care of you. If you haven't any problems with the ssh-agent, please go to the next point.
### WHAT THE F&$%! IS HAPPENNING??!!
Please calm down. Take a cup of coffee. Remember when I told you that you may use your terminal as a root user or as an administrator? Well, it's time to do the administrator things. 
1. First of all, check if you have running the `ssh-agent` service by running: `ssh-agent bash` or `eval "$(ssh-agent)"`. If you have a message like `unable to start ssh-agent service, error :1058`, don't panic. You're probably on Windows, right? Because this should work with Linux. We'll keep to the next step.
2. You are in Windows and you're unable to start the `ssh-agent` service, but why? Well, you should check now if the `ssh-agent` is stopped, and you can do this by running: `Get-Service ssh-agent`. You should get something like this:
```
Status   Name               DisplayName
------   ----               -----------
Stopped  ssh-agent          OpenSSH Authentication Agent
```
3. You probably don't remember if you have stopped the `ssh-agent` service. Don't worry, you can check if it has been disabled by your computer running: `Get-Service ssh-agent | Select StartType`, and you'll probably get something like this:
```
StartType
---------
Disabled
```
4. Let's enable the `ssh-agent` by running: `Get-Service -Name ssh-agent | Set-Service -StartupType Manual`. And it's all done! You can keep working.
5. After that, you'll have to do the `ssh-agent bash` and the `ssh-add` things again.
6. REMEMBER: You have to do this as an administrator, in other case you'll get an error message because a normal user doesn't has permissions to do this.

## 5. Now it's time for GitHub
You have your keys created and registrated for your two GitHub users, but GitHub doesn't know your keys. This step is very important (and easy). You have to login into your GitHub account and go to the `Settings` section of your user. (Click on your user icon at the top-right of the GitHub site, and select the `Settings` option).

After that, you have to look for a section `SSH and GPG Keys`, located at the left menu of the `Settings` section. There you'll be able to add a `New SSH Key` by clicking the proper button. Once you do that, you have to give a Name for the key in order to identify it in the GitHub site, and copy the content of the `~/.ssh/GitHubUser.pub` file from your computer (It's important to copy the content of the `.pub` file). Of course, if your first user is called `John` and your second user is called `Lola`, you'll have to copy `John.pub` and `Lola.pub` to the proper users. The key type will be: `Authentication Key` in this case. 

Finally add the key by clicking the `Add SSH Key` button.

## 6. Using the SSH connections
I think this may be the most difficult step of this tutorial. Now we have a SSH pair of keys to use an SSH connection with github, and it's registered on GitHub, so we should be able to use it, but our computer doesn't know which key has to use. It's type to talk about the `config` file.
I'll give you a `config` file example in order to make things easier to you. You'll find that file at `~/.ssh`, and if you don't find it, just create it. Note that it's not `config.txt` or `config.conf`. It's just `config`, without anything else. Windows users, I'm talking to you. Make sure that it's only `config`.

Inside the `config` file, we'll say to the SSH protocol how to use the keys. Actually, we'll create something like host alias to our keys. The `config` file will contain something like this:
```
# Lola github account: 
Host lola.github.com
   HostName github.com
   IdentityFile ~/.ssh/Lola
   IdentitiesOnly yes
```
And it you'll have to create new registers like this, if you have another user called John, you can just copy and paste it changing the name Lola with John.

And that's it!! Now you can try to access to GitHub as Lola via SSH by running: 
```
ssh -T git@lola.github.com
```
And you'll be able to clone and work with Lola repositories by running
```
git clone git@lola.github.com:Lola/TestRepository
cd TestRepository
```

## 7. What happens with my GitHub configuration in my computer?
Good question. You have to keep in mind that you're using more than one user on your computer, so you'll have to check if you're using the proper user in each repository. For example, if you're working in a repository of the user `Lola`, you can just access to the repository `cd TestRepository`, and run  `git config --list`. You'll be able to see something like this:
```
// Other config variables...
user.name=Lola
user.email=lola@example.com
...
```
If you have this configuration, you can work with it without any hesitation, but if you have something like:
```
// Other config variables...
user.name=John
user.email=john@doe.com
...
```
And you're working in a `Lola` repository, you'll have to change that variables by running `git config user.email "lola@example.com"` and `git config user.name "Lola"` in order to use that repository as `Lola` (because that repository is from `Lola`).

Now you know all you have to know to use more than one GitHub users through SSH in your computer. I hope you find usefull this post. See later! :)
