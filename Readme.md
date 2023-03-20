*****************************************************************************************************************************************************
Challenge1
The database server called centos-host is running short on space! You have been asked to add an LVM volume for the Database team using
some of the existing disks on this server.
1)Install the correct packages that will allow the use of "lvm" on the centos machine.
2) Create a Physical Volume for "/dev/vdb" & "/dev/vdc"
3) Create a volume group called "dba_storage" using the physical volumes "/dev/vdb" and "/dev/vdc"
4) Create an "lvm" called "volume_1" from the volume group called "dba_storage". Make use of the entire space available in the volume group.
5) Format the lvm volume "volume_1" as an "XFS" filesystem
6) Mount the filesystem at the path "/mnt/dba_storage".
7) Make sure that this mount point is persistent across reboots with the correct default options.
8) Create a group called "dba_users" and add the user called 'bob' to this group
9) Ensure that the mountpoint "/mnt/dba_storage" has the group ownership set to the "dba_users" group
10) Ensure that the mount point "/mnt/dba_storage" has "read/write" and execute permissions for the owner and group and no permissions 
for anyone else


*****************************************************************************************************************************************************

Challenge2
The app server called centos-host is running a Go app on the 8081 port. You have been asked to troubleshoot some issues with 
yum/dnf on this system, Install Nginx server, configure Nginx as a reverse proxy for this Go app, install firewalld package and 
then configure some firewall rules.
From clicking the icons found in the attached callenge2
1) Bob is able to login into GoApp using username "test" and password "test"
2) Configure Nginx as a reverse proxy for the GoApp so that we can access the GoApp on port "80
3) Start and enable the "nginx" service
4) Start GoApp by running the "nohup go run main.go &" command from "/home/bob/go-app/" directory, it can take few seconds to start.
5) Install "nginx" package.
6) Install "firewalld" package
7) Troubleshoot the issues with "yum/dnf" and make sure you are able to install the packages on "centos-host"
8) Start and Enable "firewalld" service
9) Add firewall rules to allow only incoming port "22", "80" and "8081"
10) The firewall rules must be permanent and effective immediately.

*****************************************************************************************************************************************************
Challenge3
Some new developers have joined our team, so we need to create some users/groups and further need to setup some permissions 
and access rights for them
1) Creat a group called "devs"
2) Create a user called "ray" , change his login shell to "/bin/sh" and set "D3vU3r321" password for this user
3) Make user "ray" a member of "devs" group
4) Create a user called "lisa", change her login shell to "/bin/sh" and set "D3vUd3r123" password for this user
5) Make user "lisa" a member of "devs" group
6) Make sure all users under "devs" group can only run the "dnf" command with "sudo" and without entering any password
7) Edit the disk quota for the group called "devs". Limit the amount of storage space it can use (not inodes). Set a "soft" 
limit of "100MB" and a "hard" limit of "500MB" on "/data" partition
8) Configure a "resource limit" for the "devs" group so that this group (members of the group) can not run more than "30 processes"
 in their session. This should be both a "hard limit" and a "soft limit", written in a single line
9) Create a group called "admins"
10) Create a user called "david" , change his login shell to "/bin/zsh" and set "D3vUd3raaw" password for this user
11) Make user "david" a member of "admins" group
12) Create a user called "natasha" , change her login shell to "/bin/zsh" and set "DwfawUd113" password for this user
13) Make user "natasha" a member of "admins" grou
14) Give some additional permissions to "admins" group on "/data" directory so that any user who is the member the 
"admins" group has "full permissions" on this directory
15) Make sure "/data" directory is owned by user "bob" and group "devs" and "user/group" owner has "full" permissions 
but "other" should not have any permissions
16) Make sure "/data" directory is owned by user "bob"