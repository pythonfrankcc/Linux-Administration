#This is on Process and services management
#Systemd uses "targets" and here is a typical systemd boot sequence
#system.target >>basic.target >> multi-user.target >> graphical.target
#Targets are defined in the e /usr/lib/systemd/system
cat /usr/lib/systemd/system/graphical.target

#The default target is defined by a symbolic link from /etc/systemd/system/default.target to the target in the /usr/lib/systemd/system directory, as in this example:
 ls -l /etc/systemd/system/default.target
 
 lrwxrwxrwx. 1 root root 36 Jun 11 20:47
 /etc/systemd/system/default.target ->
 /lib/systemd/system/graphical.target
 
 #You can also use the below command to see the default target
systemctl get-default

#the following command is used to show the list of available targets
systemctl list-unit-files --type=target | head

#to set the default target one uses
systemctl set-default graphical-user.target

#to change to another target
systemctl isolate multi-user.target


#when you mask a service you make it completely impossible to start or enable.
#This is commonly done when there is a conflicting service on a system that, for some reason, can’t or shouldn’t be removed from the system
systemctl mask service

#to schedule jobs you can use the cron and at utilities
#the cron utility makes used of the crond daemon. The crond checks both the cron and at jobs to determine which commands to be executed and when to execute them

#here is a few options that allow one to view and modify the crontab file, -e:edit, -l:list the crontab file contents, -r: removes all entries from the crontab file
#fields of the crontab file
#minute hour DayOfTheMonth MonthOfTheYear DayOfTheWeek CommandName

#As the administrator you can use the configuration files to determine whether a user can use the crontab command. The /etc/cron.deny and the /etc/cron.allow are used for this purpose
#the format for /etc/cron.deny and /etc/allow is one user per line

#if only the /etc/cron.deny file is available it means deny the names given and allow all the rest of the users and if the /etc/cron.allow is the only file that exists it means allow only
#the usernames given and all the rest should be denied

#the file /etc/crontab acts as the system crontab 
17 * * * * root cd / && run-parts /etc/cron.hourly
#there should be 7 entries separated by one or more space characters

#Remember that crontab is for scheduling a process to run routinely, and at is used to schedule a process to run once.


#the difference between SIGTERM, SIGKILL AND SIGHUP
#SIGTERM:also known as signal 15 and is the signal sent when you use kill on a process with the catch that a process can be programmed to ignore the SIGTERM signals
#SIGKILL: This is signal sent when you use kill -9 and forces a stop without gracefully doing away with the system which may result in data loss if the process had sth in the memory
#SIGHUP:When a parent is stopped it sends a hang-up signal to all children and for one to continue to run a command on terminating a session you use nohup (command name)


#lsof command is used to list all open files like so
lsof | wc -l
#a more useful technique would be to list all files related to open network connections

lsof -i
[root@OCS ~]# lsof -i
COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
avahi-dae 674 avahi 13u IPv4 15730 0t0
 UDP *:mdns
avahi-dae 674 avahi 14u IPv4 15731 0t0
 UDP *:49932
sshd 1411 root 3u IPv4 18771 0t0
 TCP *:ssh (LISTEN)
sshd 1411 root 4u IPv6 18779 0t0
 TCP *:ssh (LISTEN)
master 2632 root 14u IPv4 20790 0t0
 TCP localhost:smtp (LISTEN)
master 2632 root 15u IPv6 20791 0t0
 TCP localhost:smtp (LISTEN)
dnsmasq 2739 nobody 3u IPv4 21518 0t0
 UDP *:bootps
dnsmasq 2739 nobody 5u IPv4 21525 0t0
 UDP 192.168.122.1:domain
dnsmasq 2739 nobody 6u IPv4 21526 0t0
 TCP 192.168.122.1:domain (LISTEN)
cupsd 4099 root 12u IPv6 564510 0t0
 TCP localhost:ipp (LISTEN)
Process Management
103
cupsd 4099 root 13u IPv4 564511 0t0
 TCP localhost:ipp (LISTEN)
dhclient 26133 root 6u IPv4 1151444 0t0
 UDP *:bootpc
dhclient 26133 root 20u IPv4 1151433 0t0
 UDP *:14638
dhclient 26133 root 21u IPv6 1151434 0t0
 UDP *:47997


#the default priority to access the cpu for any job created by a user is 0 and the nice value ranges from -20(highest) to 19(lowest)
[student@OCS ~]$ nice -n 5 firefox

#It is important to note that a regular user cannot assign a negative nice value and this values can only be assigned by the root user


#process states include Zombie, Sleeping, Running and stopped
#Zombie: This is when a process has terminated but has not been entirely cleared out of memory. When a child process ends it is the responsibility of the parent to tell the system that all details
#related to the child should be removed from memory and in rare cases this may not happen which may indicate a bug

#Sleeping: A process that is in an uninterruptible sleep state is a process that is performing certain system calls that prevent it from being interrupted (that is, killed).
#A process that is in an interruptible sleep state is one that is performing some sort of I/O (input/output) operation, such as accessing a hard disk. This is a fairly common state, as I/O operations
#may take some time.

#pgrep is a combination of the ps and grep command eg
[student@OCS ~]$ ps -e | grep sleep
#can be replaced by
[student@OCS ~]$ pgrep sleep

#pkill command, you can provide a process name, a username, or another method to indicate which process or processes to send a signal to
#for example, if you want to kill all the processes being ran under the username Sarah you use
[student@OCS ~]$ pkill -u sarah


#e pidof command is useful when you know the name of a command that you want to control, but you don’t know the command’s PID (process ID)
[student@OCS ~]$ pidof dovecot