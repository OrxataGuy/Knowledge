# How to link your GitHub repository with Plesk

## Attention
For this guide, I'll use Plesk Obsidian Version 18.0.44.
There are options that may change in the future.

## Linking the GitHub repository with Plesk
I'll asume that you have your GitHub repository ready to be linked with Plesk, so we'll navigate to the Plesk's Git Tool.

Here we can add new repositories, so we will add one. 

There are many fields that we can configure here, but we'll pay attention to only one: the repository URL.

We will add the GitHub repository SSH link to this field (Not the HTTP or the HTTPS). You can find it in the main view of your repository by clicking on the right `Code` button. There you'll find the links to clone your GitHub repository. (In this case we need the SSH link).

Once you have added your GitHub repository SSH link to the repository URL field, the Plesk will automatically show to you an SSH-RSA certificate. This is the public ssh key to access to your machine. We've to set up this SSH key in GitHub.

We'll do this in the GitHub webpage, by clicking on your profile and picking the `Settings` option. Now you've to find out the `SSH and GPG keys` section and click the `New SSH key` button. 

Now you can set an identificative name for your machine, and the rsa key that Plesk have provided to you.

Once you've done this, you'll be able to configure how you want the application to be deployed to the server and the server path where **GitHub will copy the content of your repository**.

## Note
If you want to do this in your machine, or Plesk (or anything other system) doesn't gives to you a public SSH key, you can generate one by following this steps. (This will allow you to set up your machine to use ssh with GitHub with your user. It's very usefull.).

### Step 1

Check if your user's root folder contains a folder called `.ssh`. Make sure that you can see hidden folders. **If it does, don't follow the Step 2**.

### Step 2 (Only if you don't have the .ssh folder)
Your user's root folder does not contain a folder called `.ssh`, so we will generate a new SSH key for you. If we have a current SSH key, we will overwrite it with a new one, so we must do it with caution.

For this we'll run this command: `ssh-keygen`. This command will create a new SSH key after a form that does not need to be filled out. Pressing `Enter` until you have generated the key is sufficient. 

Once finished, we will see that we have a hidden folder called .ssh in our user root folder.

### Step 3
We'll enter to the `.ssh` folder and here you should see two files, `id_rsa` and `id_rsa.pub`. We'll copy the content of the `id_rsa.pub` in the `SSH and GPG keys` section of GitHub. 





