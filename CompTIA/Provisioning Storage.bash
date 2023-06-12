#Configuring and managing storage using appropriate tools
#You can partition using two alternatives 
LVM and RAID

#Tools that can be used to create or view partitions, including parted and fdisk

#fdisk is used when using MBR based disk partitioning, ie, non-GUID partition tables

#parted allows you to modify both MBR based partition tables and GUID based partition tables eg the use of parted mkpart: creates a new partition while parted mkpartfs creates both partition and file system


#the partprobe is only needed in situations where the partition table has changed and the system needs to be informed of the changes
#The most common example is when you use the fdisk command to change a partition on a device that currently has mounted filesystems. The fdisk command attempts to inform the system of changes to the 
#partition table by using a kernel call, which fails because of the “live” filesystem. To overcome this, just execute the partprobe command after exiting the fdisk utility.

#the systemd.mount is used by the Systemd to mount and unmount resources during the boot process.It utilizes the /etc/fstab file

#syntax of the /etc/fstab
#/dev/sda1 / ext4 defaults 1 1 : The device to mount, mount point,filesystem type, mount options (defaults), Dump level (1),  fsck pass field (1) 

#the use of the mount command which can display the list of the currently mounted filesystems and also manually mount a filesystem like so mount /dev/sdb1 /data

#the same way the mount can be used to mount a filsesystem we have the use of the unmount command that can also be used to manually unmount a filesystem like shown below
mount | grep /data
umount /data

#among the available commands for the unmount are -r which is used to unmount the filesystem as read-only in the case that the unmount fails and the -f command which forces an unmount,
#typically used on NFS mounts when the NFS server is unresponsive

#lsblk command is used to view the device files used to access the filesystem
#blkid used to see the labels and the UUID

#Linux unified Key Setup(LUKS) is related to linux filesystem encryotion and describes how filesystems are to be encrypted in Linux and is generally what is referred to as an unofficial standard
#LUKS does not force any one form of encryption on one, eg we can use DMcrypt which is a kernel module that allows the kernel to understand encrypted filesystems
#aside from the use of DMcrypt you should also make note of two commands that create and mount an encrypted filesystem cryptsetup and cryptmount but you will only use one eg cryptsetup as so
#You will need to load up some kernel modules
[root@onecoursesource ~]# modprobe dm-crypt
[root@onecoursesource ~]# modprobe aes
[root@onecoursesource ~]# modprobe sha256
#Next, create a LUKS-formatted password on a new partition. Note that if you are using an existing partition, you first need to back up all data and unmount the partition. The following command 
#overrides data on the /dev/sda3 partition
[root@onecoursesource ~]# cryptsetup --verbose --verify-passphrase luksFormat /dev/sda3
WARNING!
========
This will overwrite data on /dev/sda3 irrevocably.
Are you sure? (Type uppercase yes): YES
Enter passphrase:
Verify passphrase:
Command successful.

#You will need to use this passphrase to decrypt the filesystem whenever you need to mount the filesystem.

#the modprobe command is used to add or to remove kernel modules, which are pieces of code that can be dynamically loaded into the running kernel.

#xfs filesystem is designed for high performance and handling larger file sizes

#ext4 supports larger filesystems and individual file sizes and has better performance that ext3

#the mkfs which is used to create filesystems on a partition is actually a front-end utility for other commands eg when you run mkfs -t ext4 /dev/sdb7 what will execute is mkfs.ext4 /dev/sdb7



#the resize2fs command is commonly used in conjuction with resizing the logical volume and once the LVM has been resized we have to resize the underlying ext3 or ext4 filesystem
#if the plan is to make the LVM bigger we first use the lvextend then resize2fs with the extending there is no need for a size

lvextend -L+1G /dev/vol0/lv0
resize2fs /dev/vol0/lv0

#if the plan is to make the lv smaller you first reduce the filesystem and then use the lvreduce command which decreases the size of the LV, if you reduce the LV first the system would not be 
#able to access the filesystem beyond the new LV size
resize2fs /dev/vol0/lv0 2G
lvreduce -L2G /dev/vol0/lv0

#tune2fs command is used to display or modify specific metadata for an ext2/ext3/ext4 filesystem
#when it comes to modifying filesystem metadata we can -J modifies the journal options, -o modifies the mount options, -L modifies the filesystem label, -m modifies the % of the fs reserved for root

#to change a label of a filesystem
# e2label /dev/sda3 pluto


#the BTRFs tool also known as a butter FS is a general purpose linux filesystem that uses a method called B-trees to manage filesystem structure.


#reasons for using an LVM, we can merge several physical disks together, regular partitions are not resizable.
#LVM uses one or more physical devicees merged into a single container of space that can be created into partition like devices.It can be whole hard disks, partitions on a hard disk, software RAID devices



#the lvchange command is used to change the attributes of an LV.One of the most common use is to change the state of an LV to active
lvchange -ay /dev/vol0/lv0

#To deactivate
lvchange -an /dev/vol0/lv0

#the space within PVs is broken into small chunks called extents.Each extent is 4MB by default but can be modified when creating the VG by using the -s option to the vgcreate command

#lvresize
lvresize -L +10G dev/vol0/lv0

#when you want to add a new PV to a VG you can use the vgextend command
vgextend vol0 /dev/sde



#Raid0: This is also known as strippping where some data is written on one portion and another on another portion and so on
#Raid1:Mirroring where 2 or more disks appear as a single storage device. Data written on one drive is also written to all other drives
#Raid4: This involves the use of what is called a parity 
#Raid5: This is similar to RAID4 but involves the spreading of parity data over multiple disks in a round robin approach
#Raid10: This combines both raid 1 and 0 

#creation of a software RAID device 
mdadm -C /dev/md0 -l 1 -n 2 /dev/sdb /dev/sdc
mdadm: array /dev/md0 started
#-c specifies the device name for the RAID device, -l specifies the RAID level,-n specifies the no of physical storage devices to use in the RAID



#after you create a RAID device you can see information about the device by viewing the contents of the /proc/mdstat file
more /proc/mdstat
Personalities : [raid1]
md0 : active raid1 sdc[1] sdb[0]
 987840 blocks [2/2] [UU]
unused devices: <none>



#SAN/NAS
#Two most common network filesystems include: NFS and SMB
#NFS was originally created by Sun Microsystems and the primary configuration for NFS server can be found in /etc/exports.
#This is the file you use to specify what directories you want to share to the NFS clients. The syntax is as follows
#Directory hostname(options)
/usr/share/doc jupiter(rw) mars(ro)


#SMB
#This was invented by IBM
#Both SMB and NFS are example of DFS, which is, used to share files and directories across a network.
#CIFS may be used in conjuction with SMB, it is a SMB protocal famous in windows OS
#the linux software that allows SMB sharing is called SAMBA.The condiguration of SAMBA is the /etc/SAMBA/smb.conf


#storage hardware
#fcstat: you can see information about storage devices attached to Fibre Channel