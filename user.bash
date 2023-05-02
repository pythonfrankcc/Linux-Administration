#!/usr/bin/env bash

#user, group and directory permission changes and management
# Prompt for the new user's username

read -p "Enter the username for the new user: " USERNAME


# Create the new user
useradd $USERNAME

# Prompt for the new user's password
read -sp "Enter the password for the new user: " PASSWORD
echo "$USERNAME:$PASSWORD" | chpasswd

#the | is used to redirect the output of the "echo" command to the "chpasswd" command


# Change the new user's shell login to your desired one
chsh -s /bin/bash $USERNAME

# Prompt for the group to which you want to add the new user
read -p "Enter the group name to which you want to add the user: " GROUP


# Add the new user to the specified group
usermod -aG $GROUP $USERNAME

echo "User $USERNAME created and added to group $GROUP."



#in the case where you want members of the devs group to run the dnf command using the sudo command and without prompting for a password
#open the /etc/sudoers file using the sudo visudo command and add the following line at the end of the file
#%devs ALL=(ALL) NOPASSWD: /usr/bin/dnf

#save and close the file



#since adding users to the sudoers will remove the element of using passwords and adding the user to the sudo group gives the user too much power on a server you are left with a work around
#not adding the user to the sudo group but ensuring that the user can still use the sudo command by prompting the user for his password



#create a new file in the /etc/sudoers.d/ directory using a text editor like so
#sudo nano /etc/sudoers.d/bob-sudo

#add the following file, replacing bob with the actual username of the user you want to grant "sudo" privileges to
#bob ALL=(ALL) NOPASSWD: ALL

#make sure that the file you have created is owned by root user and has the correct permissions
#sudo chown root:root /etc/sudoers.d/bob-sudo
#sudo chmod 0440 /etc/suoders.d/bob-sudo


#the first 0 shows that there are no special permissions, that is, setuid, setgid, stickybit

#Setuid: When the setuid bit is set on an executable file, it allows any user who runs the file to temporarily assume the permissions of the file's owner. This is useful in situations where a 
#user needs temporary access to resources that they would not normally have permission to access. For example, the passwd command is setuid root, which allows users to change their own password, 
#even though they do not have root privileges.


#Setgid: When the setgid bit is set on a directory, it allows any file created within that directory to inherit the group ownership of the parent directory, rather than the primary group of the 
#user who created the file. This is useful for situations where multiple users need to work on the same set of files, but need to ensure that the files are owned by a specific group. For example, 
#the /var/www/html directory on a web server might be setgid so that any files created within it are owned by the www-data group, which is typically used by web servers.

#Sticky bit: When the sticky bit is set on a directory, it ensures that only the owner of a file can delete or rename the file within that directory. This is useful for situations where multiple 
#users have write access to the same directory, but should not be able to delete each other's files. For example, the /tmp directory is typically set with the sticky bit so that files created within 
#it can be accessed by multiple users, but only the owner of a file can delete it.





#First, you need to ensure that quotas are enabled on the file system containing the /data directory. You can check if quotas are enabled by running the mount command and looking for the 
#usrquota and grpquota options in the output. If these options are not present, you need to enable quotas by editing the /etc/fstab file and adding the usrquota,grpquota options to the relevant 
#file system. After editing the /etc/fstab file, you can remount the file system or reboot the system for the changes to take effect.



#Once quotas are enabled, you can use the setquota command to set the resource quotas for the devs group. Here's an example command that sets a soft limit of 100 MB and a hard limit of 500 MB on 
#the /data directory for the devs group:
#sudo setquota -g devs 0 100M 500M 0 /data
#the first 0= 0 inodes (not used in this example)
#the last 0= 0 time limit (not used in this example)


#checking using the mount command to see if a quota has been set
#mount | grep /data
#what you will see if a quota has been set
#/dev/sda1 on /data type ext4 (rw,relatime,usrquota,grpquota,data=ordered)

#what you will see if a quota has not been set
#/dev/sda1 on /data type ext4 (rw,relatime,data=ordered)

#normally this is the output that you will see on a mounted directory without the quotas being set
#/dev/sda1 /data ext4 defaults 0 0

#to add the userquota and the groupquota here is how to go about it
#/dev/sda1 /data ext4 defaults,usrquota,grpquota 0 0

#then remount like so
#sudo mount -o remount /data


