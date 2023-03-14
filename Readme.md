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
10) Ensure that the mount point "/mnt/dba_storage" has "read/write" and execute permissions for the owner and group and no permissions for anyone else


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