#the boot process
mkinitrd /boot/initrd-5.17.4.x86_64.img 5.17.4

#the use of the mkinitrd executes the dracut utility which creates the initrams file which has a unique file for each kernel

#usage of grub2-install
#Typically the bootloader is installed during the boot process, but it is possible that the bootloader becomes corrupt and needs to be re-installed.To install this you use the gtub2-install
#together with the device you want the bootloader installed on, eg on the first SATA drive

 grub2-install /dev/sda
 
 #grub2-mkconfig which is only used for GRUB2 generates /boot/grub/grub.cfg or /boot/grub/menu.lst from the /etc/default/grub or /etc/grub.d
 #grub2-update provodes another way of running the grub2-mkconfig utility and is used mostly for backward compatibility for some systems
 
 
 #initrd.img: Typically the Linux kernel is configured with few kernel modules enabled by default. Additional modules are normally required during the boot process before the filesystems are mounted.
#These additional modules are stored within a compressed file called initrd.img

#vmlinuz: The vmlinuz file is stored in the /boot directory. Each version of the kernel has a different vmlinuz file, typically with a name that includes the version of the kernel

#On the grub boot menu here is what you can actually do
#:Arrow keys for selecting the stanza
#e- Used to edit the currently selected stanza
#c-Used to enter a GRUB command prompt
#p-Only applicable whn you have a password

#PreBoot Execution Environment(PXE): allows you to boot a system across the network, assuming that a boot server has been created on the network.
#PXE uses a Dynamic Host Configuration Protocol (DHCP) server to obtain network configuration information, such as an IP address and subnet address


#Kernel Panic: occurs when something goes wrong with the kernel and the system crashes.Typically when this happens, data is stored using a feature called kdump


#/dev filesystem is based on memory and not stored on the hard disk and has access to physical devices and virtual devices
#/dev/sd* represents SATA devices with the first being sda and the second being sdb
#/dev/hd* represents IDE based devices
#/dev/dm* represent software RAID or LVM devices


#The next part is Basic Package Configuration from Source Code
[root@OCS unix]# ls
configure Makefile osdep.h Packaging README.OS390 unix.c zipup.h
#the first step is to run the configure file after making the file executable
[root@OCS unix]#chmod u+x configure
[root@OCS unix]# ./configure

#The result of the configure is the Makefile which provides how to build and install the Package

#the make command uses the Makefile



#Storage Concepts
#File Storage:a remote storage device is used by the local system. The remote storage device is shared to the local system via a network filesystem structure, and users can place files and 
#directories on the remote system.

#Common networking Filesystems: nfs, smb, CIFS
#NFS:it has provided a standard way of sharing directory structures between Unix and Linux systems.
#SMB:This filesystem, which is also known as the Samba filesystem, is based on cifs and designed to provide network-based sharing.
#CIFS:This filesystem is used on Microsoft Windows systems to share folders across the network. Samba utilities on Linux are used to connect to cifs shares.


#Block Storage: This is a physical device storage eg SSDs, RAID drives, SAN
#Data on block storages is accessible via filesystems eg ext3, ext4 and xfs.


#Object Storage: This is for cloud objects and is rather accessed via a URL.Stores data as objects, examples, AWS S3, Google Cloud Storage and IBM Cloud storage

#Trditional partition tables are stored on the MBR with a newer partition table called the GUID PARTITION TABLE (GPT) with less limitations as opposed to MBR.
#An MBR has restrictions of only permitting 4 partitions by default,but with one of the primary partitions being able to be converted into an extended partition and have aadditional logical partitions


#The GPT was designed to overcome the limitations of the MBR and supports upto 128 partitions per hard disk

#dmidecode:used to display a description of hardware components.
[root@OCS ~]# dmidecode | head