# Chapter 15 - System and User Security

## 15.1 Introduction

User accounts are designed to provide security on a Linux operating system. Each person on the system must log in using a user account 
- allows the person to access specific files and directories
- disallows such access, accomplished using **file permissions**

**file permissions** = file and directory permissions given by the system to users, groups and everyone else who logs in.  (permissions can be edited by the root user).

User accounts < **groups** (can also be used to provide access to files/directories). 

*Each user belongs to at least one group* (often many) to allow users to more easily share data that is stored in files with other users.

User and group account data is stored in **database files**. Knowing the content of these files allows you to better understand which users have access to files and directories on the system. These database files also contain vital security information that may affect the ability of a user to log in and access the system.

Several commands provide the ability to see user and group account information, as well as to switch from one user account to another (provided you have the appropriate authority to do so). 

These commands are valuable for :
- investigating usage of the system
- troubleshooting system problems
- monitoring unauthorized access to the system.

## 15.2 Administrative Accounts

There are many different ways to execute a command that requires administrative or root privileges. Logging in to the system as the root user allows you to execute commands as the administrator. This access is potentially dangerous because you may forget that you are logged in as root and might run a command that could cause problems on the system. As a result, it is not recommended to log in as the root user directly.

*you should only execute commands as root if administrative privileges are needed*. 
- If the root account is disabled, as it is on the Ubuntu distribution, then administrative commands can be executed using the **`sudo` command**.
- If the root account is enabled, then a regular user can execute the **`su` command** to switch accounts to the root account.

When you log in to the system directly as root to execute commands, then everything about your session runs as the root user. If using the graphical environment, this is especially dangerous as the graphical login process is comprised of many different executables (programs that run during login).*Each program that runs as the root user represents a greater threat than a process run as a standard user, as those programs would be allowed to do nearly anything*, whereas standard user programs are very restricted in what they can do.

The other potential danger with logging into the system as root is that a person that does this *may forget to log out to do their non-administrative work, allowing programs such as browsers and email clients to be run as the root user without restrictions on what they could do*. The fact that several distributions of Linux, notably Ubuntu, do not allow users to log in as the root user should be enough indication that this is not the preferred way to perform administrative tasks.

### 15.2.1 Switching Users

The su command allows you to run a shell as a different user. While switching to the root user is what the su command is used for most frequently, it can also switch to other users as well.

`su [options] [username]`

When switching users utilizing the `login shell` option is recommended, as the login shell fully configures the new shell with the settings of the new user, ensuring any commands executed run correctly. If this option is omitted, the new shell changes the UID but doesn't fully log in the user. The login shell option can be specified one of three ways:

- su -
- su -l
- su --login

By default, if a username is not specified, the su command opens a new shell as the root user. The following two commands are equivalent ways to start a shell as the root user:

- su - root
- su -

After pressing Enter to execute either one of these commands, the user must provide the password of the root user to start the new shell. If you don't know the password of the account that you are shifting to, then the su command will fail.

Notice in the example below, and in our virtual machines, the command prompt changes to reflect the current user.

After using the shell started by the su command to perform the necessary administrative tasks, return to your original shell (and original user account) by using the exit command.

```bash
sysadmin@localhost:~$ su -
Password: netlab123
root@localhost:~# id
uid=0(root) gid=0(root) groups=0(root)
root@localhost:~# exit
logout
sysadmin@localhost:~$ id
uid=1001(sysadmin) gid=1001(sysadmin) groups=1001(sysadmin),4(adm),27(sudo)
```

### 15.2.2 Executing Privileged Commands

The **sudo** command allows users to execute commands as another user. Similar to the su command, the root user is assumed by default.

`sudo [options] command`

In distributions that do not allow the root user to login directly or via the su command, the installation process automatically configures one user account to be able to use the sudo command to execute commands as if the root user executed them. For example, administrative privileges are necessary to view the /etc/shadow file:

*The prompt for the password will not appear again as long as the user continues to execute sudo commands less than five minutes apart.*

```console
sysadmin@localhost:~$ head /etc/shadow
head: cannot open '/etc/shadow' for reading: Permission denied
sysadmin@localhost:~$ sudo head /etc/shadow
[sudo] password for sysadmin: netlab123
root:6Yga95H98HbxqsMEIBTZ0YomlMffYCV9VE1SQ4T2H3SHXw41M02SQtfAdDVE9mqGp2hr20
daemon:*:16463:0:99999:7:::
bin:*:16463:0:99999:7:::
sys:*:16463:0:99999:7:::
sync:*:16463:0:99999:7:::
games:*:16463:0:99999:7:::
man:*:16463:0:99999:7:::
lp:*:16463:0:99999:7:::
mail:*:16463:0:99999:7:::
news:*:16463:0:99999:7:::
```

Using the sudo command to execute an administrative command results in an entry placed in a log file. Each entry includes the name of the user who executed the command, the command that was executed and the date and time of execution. This allows for increased accountability, compared to a system where many users might know the root password and can either log in directly as root or use the su command to execute commands as the root user.

One big advantage of using sudo to execute administrative commands is that it reduces the risk of a user accidentally executing a command as root. 

## 15.3 User Accounts

There are several text files in the `/etc` directory that contain the account data of the users and groups defined on the system. 

eg. `/etc/passwd` to see if a specific user account has been defined on the system


```shell
sysadmin@localhost:~$ tail -5 /etc/passwd
syslog:x:101:103::/home/syslog:/bin/false
bind:x:102:105::/var/cache/bind:/bin/false
sshd:x:103:65534::/var/run/sshd:/usr/sbin/nologin
operator:x:1000:37::/root:/bin/sh
sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash
```


- Name | **sysadmin**:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash 
  
The first field contains the name of the user or the username. This name is used when logging in to the system and when file ownership is viewed with the ls -l command. It is provided to make it easier for regular users to refer to the account, while the system typically utilizes the **user ID** internally.

- Password Placeholder | sysadmin:**x**:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash

At one time, the password for the user was stored in this location, however, now the x in this field indicates to the system that the password is in the `/etc/shadow `file.

- User ID | sysadmin:x:**1001**:1001:System Administrator,,,,:/home/sysadmin:/bin/bash

Each account is assigned a user ID (UID). Usernames are not directly used by the system, which typically defines the account by the UID instead. eg, files are owned by UIDs, not by usernames.

- Primary Group ID | sysadmin:x:1001:**1001**:System Administrator,,,,:/home/sysadmin:/bin/bash

This field indicates that the user is a member of that group, which means the user has special permissions on any file that is owned by this group.

- Comment | sysadmin:x:1001:1001:**System Administrator,,,,**:/home/sysadmin:/bin/bash

This field can contain any information about the user, including their real name or other useful information.

- Home Directory | sysadmin:x:1001:1001:System Administrator,,,,:**/home/sysadmin**:/bin/bash
  
This field defines the location of the user's home directory. For regular users, this would typically be /home/username. For example, a username of bob would have a home directory of /home/bob.

The root user usually has a different place for the home directory, the */root* directory.

- Shell | sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:**/bin/bash**

This field indicates the location of the user's login shell. By default, the user is placed in this shell whenever they log into a command line environment or open a terminal window. The bash shell /bin/bash is the most common shell for Linux users.

An efficient way to check if a specific user has been defined on a system is to search the /etc/passwd file using the grep command. For example, to see the account information for the user named sysadmin, use the following command:

```shell
sysadmin@localhost:~$ grep sysadmin /etc/passwd
sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash
```

### 15.3.1 Passwords

As previously mentioned, the `/etc/shadow` file contains account information related to the user's password. However, regular users can't view the contents of the /etc/shadow file for security reasons. To view the contents of this file, log in as the administrator (the root account):

```shell
sysadmin@localhost:~$ su -
Password: netlab123
root@localhost:~# tail -5 /etc/shadow
syslog:*:16874:0:99999:7:::
bind:*:16874:0:99999:7:::
sshd:*:16874:0:99999:7:::
operator:!:16874:0:99999:7:::
sysadmin:$6$c75ekQWF$.GpiZpFnIXLzkALjDpZXmjxZcIll14OvL2mFSIfnc1aU2cQ/221QL5AX5RjKXpXPJRQ0uVN35TY3/..c7v0.n0:16874:5:30:7:60:15050:
```

‌⁠​each line is separated into fields by colon characters. The following describes each of the fields in detail, from left to right, using the last line of the output of the previous graphic:

- Username | **sysadmin**:6c75ekQWF$.GpiZpFnIXLzkALjDpZXmjxZcIll14OvL2mFSIfnc1aU2cQ/221QL5AX5RjKXpXPJRQ0uVN35TY3/..c7v0.n0:16874:5:30:7:60:15050::

This field contains the username of the account, which matches the account name in the /etc/passwd file.

- Password | sysadmin:**s6c75ekQWF$.GpiZpFnIXLzkALjDpZXmjxZcIll14OvL2mFSIfnc1aU2cQ221QL5AX5RjKXpXPJRQ0uVN35TY3/..c7v0.n0**:16874:5:30:7:60:15050::

The password field contains the encrypted password for the account. This very long string is a **one-way encryption**, meaning that it can't be "reversed" to determine the original password. 

While regular users have encrypted passwords in this field, system accounts have an asterisk * character in this field.

- Last Change | sysadmin:pw_placeholder:**16874**:5:30:7:60:15050::

This field contains a number that represents the last time the password was changed. The number 16874 is the number of days since January 1, 1970 (called the Epoch).

This value generates automatically when the user's password is modified. It is used by the password aging features provided by the rest of the fields of this file.

- Minimum | sysadmin:pw_placeholder:16874:**5**:30:7:60:15050::

This field indicates the minimum number of days between password changes. It is one of the password aging fields; a non-zero value in this field indicates that after a user changes their password, the password can't be changed again for the specified number of days, 5 days in this example. This field is important when the maximum field is used.

A value of zero in this field means the user can always change their password.

- Maximum

sysadmin:pw_placeholder:16874:5:**30**:7:60:15050:

This field indicates the maximum number of days the password is valid. It is used to force users to change their passwords on a regular basis. A value of 30 in this field means the user must change their password at least every 30 days to avoid having their account locked out.

Note that if the minimum field is set to 0, the user may be able to immediately set their password back to the original value, defeating the purpose of forcing the user to change their password every 30 days. So, if the maximum field is set, the minimum field is ordinarily set as well.

For example, a minimum:maximum of 5:30 means the user must change their password every 30 days and, after changing, the user must wait 5 days before they can change their password again.

If the max field is set to 99999, the maximum possible value, then the user essentially never has to change their password (because 99999 days is approximately 274 years).

- Warn

sysadmin:pw_placeholder:16874:5:30:**7**:60:15050::

If the maximum field is set, the warn field indicates the number of days before password expiry that the system warns the user. For example, if the warn field is set to 7, then any time during the 7 days before the maximum time frame is reached, the user will be warned to change their password during the login processes.

The user is only warned at login, so some administrators have taken the approach of setting the warn field to a higher value to provide a greater chance of having a warning issued.

If the maximum time frame is set to 99999, then the warn field is basically useless.

- Inactive | sysadmin:pw_placeholder:16874:5:30:7:**60**:15050::

If the user ignores the warnings and exceeds the password timeframe, their account will be locked out. In that case, the inactive field provides the user with a "grace" period in which their password can be changed, but only during the login process.

If the inactive field is set to 60, the user has 60 days to change to a new password. If they fail to do so, then the administrator would be needed to reset the password for the user.

- Expire | sysadmin:pw_placeholder:16874:5:30:7:60:**15050**::

This field indicates the day the account will expire, represented by the number of days from January 1, 1970. An expired account is locked, not deleted, meaning the administrator can reset the password to unlock the account.

Accounts with expiration dates are commonly provided to temporary employees or contractors. The account automatically expires after the user's last day of work.

When an administrator sets this field, a tool is used to convert from a real date to an Epoch date. There are also several free converters available on the Internet.

- Reserved | sysadmin:pw_placeholder:16874:5:30:7:60:15050**::**

Currently not used, this field is reserved for future use.

> In addition to the grep command, another technique for retrieving user information contained in the /etc/passwd and /etc/shadow files is to use the `getent` command. One advantage of this command is that it can retrieve account information that is defined locally, in files such as /etc/passwd and /etc/shadow, or on a network directory server.

The general syntax of a `getent` command is:

`getent database record `

For example, the following command would retrieve account information for the sysadmin user from the /etc/passwd file:

```shell
sysadmin@localhost:~$ getent passwd sysadmin
sysadmin:x:1001:1001:System Administrator,,,,:/home/sysadmin:/bin/bash
```

## 15.4 System Accounts

Users log into the system using regular user accounts. Typically, these accounts have UID values of greater than 500 (on some systems 1,000). The root user has special access to the system. This access is provided to the account with a UID of 0.

There are additional accounts that are not designed for users to log into. These accounts, *typically from UID 1 to UID 499*, are called **system accounts**, and they are designed to provide accounts for services that are running on the system.

System accounts have some fields in the /etc/passwd and /etc/shadow files that are different than other accounts.  

eg: 
- system accounts rarely have home directories as they typically are not used to create or store files. 
- In the /etc/passwd file, system accounts have a non-login program in the shell field:

sshd:x:103:65534::/var/run/sshd:**/usr/sbin/nologin**

- In the /etc/shadow file, system accounts typically have an asterisk * character in place of the password field:

sshd:*:16874:0:99999:7:::

Most system accounts are necessary for the system to function correctly. You should not delete a system account unless you are certain that removing the account won't cause problems. Take time to learn what each system account does; system administrators are tasked with ensuring the security of the system, and that includes properly securing the system accounts.

## 15.5 Group Accounts

Your level of access to a system is not determined solely by your user account. Each user can be a member of one or more groups, which *can also affect the level of access to the system*.

Traditionally, UNIX systems limited users to belonging to no more than a total of sixteen groups, but the recent Linux kernels support users with over sixty-five thousand group memberships.

The `/etc/passwd` file defines the primary group membership for a user. Supplemental group membership (or secondary group membership) and the groups themselves are defined in the `/etc/group` file.

The `/etc/group `file is another colon-delimited file. The following describes the fields in more detail, using a line that describes a typical group account.

- Group Name : **mail**:x:12:mail,postfix

This field contains the group name. As with usernames, names are more natural for people to remember than numbers. The system typically uses group IDs rather than group names.

- Password Placeholder : mail:**x**:12:mail,postfix

While there are passwords for groups, they are rarely used in Linux. If the administrator makes a group password, it would be stored in the `/etc/gshadow` file. The x in this field is used to indicate that the password is not stored in this file.

- GID : mail:x:**12**:mail,postfix

Each group is associated with a unique group ID (GID) which is placed in this field.

- User List : mail:x:12:**mail,postfix**
  
This last field is used to indicate who is a member of the group. While primary group membership is defined in the /etc/passwd file, users who are assigned to additional groups would have their username placed in this field of the /etc/group file. In this case, the mail and postfix users are secondary members of the mail group.

It is very common for a username to also appear as a group name. It is also common for a user to belong to a group with the same name.

To view information about a specific group, either the grep or getent commands can be used. For example, the following commands display the mail group account information:

```shell
sysadmin@localhost:~$ grep mail /etc/group
mail:x:12:mail,postfix
sysadmin@localhost:~$ getent group mail
mail:x:12:mail,postfix
```

## 15.6 Viewing User Information

 The id command is used to print user and group information for a specified user.

`id [options] username`

When switching between different user accounts, it can be confusing as to which account is currently logged in. When executed without an argument, the id command outputs information about the current user, allowing you to confirm your identity on the system.

```shell
sysadmin@localhost:~$ id
uid=1001(sysadmin) gid=1001(sysadmin) groups=1001(sysadmin),4(adm),27(sudo)
sysadmin@localhost:~$ id root
uid=0(root) gid=0(root) groups=0(root)
sysadmin@localhost:~$ id -g
1001
sysadmin@localhost:~$ id -G
1001 4 27
```

- The output of the id command always lists the user account information first, using the user ID and username first
- After the username the primary group is listed, denoted by both the group ID and group name:
- Other information listed includes the groups the user belongs to, again denoted by group IDs followed by the group names. The user shown belongs to three groups:
- If the command is given a username as an argument, such as root, it displays information about the specified account:
- To print only the user's primary group, use the `-g option`‌
- The id command can also be used to verify the user's secondary group memberships, to print this information, use the `-G option`


The output of the previous example aligns with the contents of the /etc/group file, as a search for sysadmin reveals:

```shell
sysadmin@localhost:~$ cat /etc/group | grep sysadmin
adm:x:4:syslog,sysadmin
sudo:x:27:sysadmin
sysadmin:x:1001:
```

## 15.7 Viewing Current Users

The `who` command displays 
- a list of users who are currently logged into the system
- where they are logged in from
- when they logged in. Through the use of options
- information such as the current runlevel (a functional state of the computer) and the time that the system was booted.


```shell
sysadmin@localhost:~$ who
root     	tty2        2013-10-11 10:00
sysadmin	tty1        2013-10-11 09:58 (:0)
sysadmin 	pts/0       2013-10-11 09:59 (:0.0)
sysadmin 	pts/1       2013-10-11 10:00 (example.com)
```

- Username (root) = This column indicates the name of the user who is logged in. Note that by "logged in" we mean "any login process and open terminal window".
- Terminal (tty2) = This column indicates which terminal window the user is working in.
  - If the terminal name starts with **tty**, then this is an indication of a local login, as this is a regular command line terminal.
  - If the terminal name starts with **pts**, then this indicates the user is using a pseudo terminal or running a process that acts as a terminal.
- Date (2013-10-11 10:00) = This column indicates when the user logged in.
- Host = After the date and time, some location information may appear
  - If the location information contains a hostname, domain name or IP address (example.com), then the user has logged in remotely
  - If there is a colon and a number (:0), then this indicates that they have performed a local graphical login:
  - If no location information is shown in the last column, then this means the user logged in via a local command line process:


> The who command has several options for displaying system status information. For example, the `-b `option shows the last time the system started (booted), and the `-r` option shows the time the system reached the current runlevel:

> There may be instances where more information about users, and what they are doing on the system, is needed. The `w` command provides a more detailed list about the users currently on the system than the who command. It also provides a summary of the system status.

The first line of output from the w command is identical to that of the uptime command. It shows the current time, how long the system has been running, the total number of users currently logged on and the load on the system averaged over the last 1, 5 and 15 minute time periods. Load average is CPU utilization where a value of 100 would mean full CPU usage during that period of time.

```shell
sysadmin@localhost:~$ who -b -r
         system boot  	2013-10-11 09:54
         run-level 5    2013-10-11 09:54
sysadmin@localhost:~$ w
 10:44:03 up 50 min,  4 users,  load average: 0.78, 0.44, 0.19
USER     	TTY     FROM	    LOGIN@   IDLE  	JCPU   	PCPU    WHAT
root     	tty2    -           10:00    43:44 	0.01s  	0.01s   -bash
sysadmin 	tty1    :0          09:58    50:02	5.68s 	0.16s   pam: gdm-password
sysadmin	pts/0   :0.0        09:59    0.00s      0.14s  	0.13s   ssh 192.168.1.2
sysadmin 	pts/1   example.com 10:00    0.00s  	0.03s  	0.01s   w
```


- USER	root	The name of the user who is logged in.
- TTY	tty2	Which terminal window the user is working in.
- FROM	example.com	Where the user logged in from.
- LOGIN@	10:00	When the user logged in.
- IDLE	43:44	How long the user has been idle since the last command was executed.
- JCPU	0.01s	The total cpu time used by all processes run since login.
- PCPU	0.01s	The total cpu time for the current process.
- WHAT	-bash	The current process that the user is running.

## 15.8 Viewing Login History

The last command reads the entire login history from the `/var/log/wtmp` file and displays all logins and reboot records by default. An interesting detail of the reboot records is that it displays the version of the Linux kernel that was booted instead of the login location. The /var/log/wtmp file *keeps a log of all users who have logged in and out the system*.

```shell
sysadmin@localhost:~$ last
sysadmin console Tue Sep 18 02:31   still logged in
sysadmin console                    Tue Sep 18 02:31 - 02:31  (00:00)
wtmp begins Tue Sep 18 02:31:57 2018       
```
 
The `last` command is slightly different from the who and w commands. By default, it also shows the username, terminal, and login location, not just of the current login sessions, but previous sessions as well. Unlike the who and w commands, it displays the date and time the user logged into the system. If the user has logged off the system, then it will display the total time the user spent logged in, otherwise it will display still logged in.


> The who command reads from the `/var/log/utmp` file which logs current users, while the last command reads from the `/var/log/wtmp` file, which keeps a history of all user logins.
