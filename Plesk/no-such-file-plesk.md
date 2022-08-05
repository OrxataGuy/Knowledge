# Plesk's command line tells you that you don't have some tool
_(But you know that tool is installed)_

We will check if the tools are installed in our environment with this statement:
```
ls /usr/bin | grep the_tool_we're_looking_for
```
After this, if any result appears, it means that our tool is accessible. But if this message appears:
```
...: No such file or directory in Plesk.
```
It probably means that the tool has some direct dependency on another tool that we don't have in the environment. In my case composer appeared in the environment, but PHP did not.

Once we know what dependencies we need, we will check that they are installed on the system and link them to our environment. We will do all this from the `/opt/plesk/our_tool` folder.

We can check if a tool is installed by running:
```
ls /opt/plesk/our_tool/
```
If any result appears, it means that out tool is installed, and we can link it to our environment. If nothing appears, it means that our tool is not installed on the system and we need to install it with the required statement or with the Plesk's GUI.

Now that we know what the tool is installed on the system, we'll run on the command line this statement:
```
ln -s /opt/plesk/our_tool/tool_version/bin/tool /usr/bin/tool
```
And after this, we will have linked the tool installed on our system and we will be able to use it.