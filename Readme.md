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


****************************************************************************************************************************************************
challenge4
Some of our apps generate some raw data and store the same in /home/bob/preserved directory. We want to clean and manipulate some data and then 
want to create an archive of that data

1) Create a script called "/home/bob/filter.sh".
2) Find the "hidden" files in "/home/bob/preserved" directory and copy them in "/opt/appdata/hidden/" directory (create the destination 
directory if doesn't exist).
3) Find the "non-hidden" files in "/home/bob/preserved" directory and copy them in "/opt/appdata/files/" directory (create the destination 
directory if doesn't exist).
4) Find and delete the files in "/opt/appdata" directory that contain a word ending with the letter "t" (case sensitive).
5) Create a "softlink" called "/home/bob/appdata.tar.gz" of "/opt/appdata.tar.gz" file.
6) Create a "tar.gz" archive of "/opt/appdata" directory and save the archive to this file: "/opt/appdata.tar.gz"
7) The "appdata.tar.gz" archive should have the final processed data.
8) Add the "sticky bit" special permission on "/opt/appdata" directory (keep the other permissions as it is).
9) Make "bob" the "user" and the "group" owner of "/opt/appdata.tar.gz" file.
10) The "user/group" owner should have "read only" permissions on "/opt/appdata.tar.gz" file and "others" should not have any permissions.
11) Change all the occurrences of the word "yes" to "no" in all files present under "/opt/appdata/" directory.
12) Change all the occurrences of the word "raw" to "processed" in all files present under "/opt/appdata/" directory. It must be a 
"case-insensitive" replacement, means all words must be replaced like "raw , Raw , RAW" etc.
13) Create "/opt/appdata" directory
14) Do not delete any files from "/home/bob/preserved" directory.

*****************************************************************************************************************************************************
challenge5

1)Create a bash script called "container-stop.sh" under "/home/bob/" which should be able to stop the "myapp" container. It should also display a 
message "myapp container stopped!"
2) Add a cron job for the "root" user which should run "container-stop.sh" script at "12am" everyday.
3) Add a cron job for the "root" user which should run "container-start.sh" script at "8am" everyday.
4) The "root" account is currently locked on "centos-host", please unlock it.
5) Make user "root" a member of "wheel" group
6) Add a local DNS entry for the database hostname "mydb.kodekloud.com" so that it can resolve to "10.0.0.50" IP address.
7) Set a password for mysql root user to "S3cure#321"
8) Install "mariadb" database server on this server and "start/enable" its service.
9) Add an extra IP to "eth1" interface on this system: 10.0.0.50/24
10) Pull "nginx" docker image.
11) Create and run a new Docker container based on the "nginx" image. The container should be named as "myapp" and 
the port "80" on the host should be mapped to the port "80" on the container.
12) Edit the PAM configuration file for the "su" utility so that this utility only accepts the requests from the 
users that are part of the "wheel" group and the requests from the users should be accepted immediately, without asking for any password.




