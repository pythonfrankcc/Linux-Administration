#File and Permission Management

#Most configuration files in Linux are in plaintext format thus important knowledge on how to use text editors:sed,awk,printf, nano and vim is important


#sed: make automated modifications to files. The basic format for the sed command is sed ‘s/RE/string/’ file.RE:Regular Expression
#awk: used to modify text that is in a simple database format
[student@OCS ~]$ head /etc/passwd | awk -F: '{print $1,$7}'

#printf:used by BASH scripters to format data before displaying it to the user who is running the script
[student@OCS ~]$ printf "%5f \n" $total


#Compression and archiving
#gzip: gzip command replaces the original file with the compressed file.
#gunzip:e gunzip command to decompress gzipped files
#bzip2:command replaces the original file with the compressed file

#gzip and bzip2 are not that different with the difference being the algos used in Compression


#zip:used to merge multiple files into a single compressed file.
[student@OCS ~]$ zip mail /etc/mail*
#tar: is to merge multiple files into a single file
tar -cf sample.tar files_to_merge

#to list content of .tar File
tar -tf sample.tar

#to extract contents of tar File
tar -xf sample.tar

#xz: command to compress files
[student@OCS ~]$ xz juju

#gzip, bzip2 and xz are very similar with their differences being the algos

#cpio:command is to create archives
[student@OCS ~]$ find /etc -name "*.conf" | cpio -ov > conf.cpio



#File metadata: information about a file, other than file contents. For this we have the stat and file command
#Files and dir consist of various parts and many of these are stored in a filesystem element called an inode. Everything about a file except the data and filename are stored in the inode.

#you can see the inode information using the stat command
[root@OCS ~]$ stat /etc/passwd

#File command reports about the contents within a file
[student@localhost ~]$ file /etc/hosts
/etc/hosts: ASCII text

#The main reason for understanding on links, ie, soft and hard links, is to know whether to make a copy or just link
#Symbolic links or Soft links
#When you create a soft link the original file contains the data, and the link points to the original file. Any changes in the original file result to changes in the linked file as it is 
#just a pointer and a deletion of the original file results to a broken link and a complete data loss making the soft link file completely worthless
[root@OCS ~]$ ln -s /boot/initrd.img-3.16.0-30-generic initrd
#you use ln-s and can create a soft link to any file or dir. The linked file has a separate inode table to the original


#Hard links: In this there is no way to distinguish between the original and the linked file, as they are just two filenames that point to the same inode and therefore the same data
#if you had 10 hard linked files and you delete 9 the data is still maintained in the last File
[root@OCS ~]$ ln /etc/hosts myhosts

#You can only make a hard link to a file (not a directory) that resides on the same filesystem as the original file
[root@OCS ~]$ ls -l myhosts
-rw-r--r-- 2 root root 186 Jul 11 2015 myhosts
#the 2 after permissions indicates that this is a hard link File


#copying files between Systems
#rsync t handles this more efficiently than other remote copy methods.
rsync [options] source destination

#scp: copy files to and from remote systems via the Secure Shell service
scp filename user@machine:/directory

#nc: The nc (or netcat) utility is used for just about anything under the sun involving TCP or UDP. It can open TCP connections, send UDP packets, listen on arbitrary TCP and UDP ports, do port
#scanning, and deal with both IPv4 and IPv6. Unlike telnet(1), nc scripts nicely, and separates error messages onto standard error instead of sending them to standard output, as telnet(1) does with some.

#suppose you want to know if a specific port is being blocked by your company firewall before you bring online a service that makes use of this port
# listen for connections on that port
[root@server ~]# nc -l 3333

