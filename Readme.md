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
