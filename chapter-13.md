# Chapter 13 - Where Data is Stored

## 13.1 Introduction


> When most people refer to Linux, they are really referring to a combination of software called **GNU/Linux**, which defines the operating system. **GNU** is the free software that surrounds the kernel and provides open source equivalents of many common UNIX commands. The Linux part of this combination is the **Linux kernel**, which is the core of the operating system. The kernel is loaded at boot time and stays running to manage every aspect of the functioning system.

An implementation of the Linux kernel includes many subsystems that are a part of the kernel itself and others that may be loaded in a modular fashion when needed. 

Key functions of the Linux kernel include : 
- a system call interface
- process management
- memory management
- virtual filesystems
- networking
- device drivers.

The **shell** sends commands from the user -->  kernel --> manages the processes that carry out those commands --> by giving them access to devices such as memory, disks, network interfaces, keyboards, mice, monitors and more.

A typical Linux system has thousands of files. The **Filesystem Hierarchy Standard** provides a guideline for distributions on how to organize these files. It is important to understand the role of the Linux kernel and how it both processes and provides information about the system under the **/proc and /sys pseudo filesystems**.


## 13.2 Processes

- the `/proc` directory = a directory containing a pseudo filesystem providing access to information about active processes
- the `/dev` directory =  Hardware devices 
- the `/sys` directory = information about hardware devices 

**Pseudo filesystems** appear to be real files on disk but exist only in memory. Most pseudo file systems such as /proc are designed to appear to be a hierarchical tree off the root of the system of directories, files and subdirectories, but in reality only exist in the system's memory, and only appear to be resident on the storage device that the root file system is on.

The /proc directory : 
- contains information about running processes
- contains information about the system hardware and the current kernel configuration.

The /proc directory is read, and its information utilized by many different commands on the system, including but not limited to `top, free, mount, umount` and many many others. It is rarely necessary for a user to mine the /proc directory directly—it’s easier to use the commands that utilize its information.

```bash
sysadmin@localhost:~$ ls /proc
1          cpuinfo      irq          modules       sys
128        crypto       kallsyms     mounts        sysrq-trigger
17         devices      kcore        mtrr          sysvipc
21         diskstats    key-users    net           thread-self 
23         dma          keys         pagetypeinfo  timer_list
39         driver       kmsg         partitions    timer_stats
60         execdomains  kpagecgroup  sched_debug   tty
72         fb           kpagecount   schedstat     uptime
acpi       filesystems  kpageflags   scsi          version
```

- There is a numbered directory for each running process on the system, where the name of the directory matches the **process ID (PID)** for the running process.
> cd For example, the numerals 72 denote PID 72, a running program, which is represented by a directory of the same name, containing many files and subdirectories that describe that running process, it’s configuration, use of memory, and many other items.

On a running Linux system, there is always a process ID or PID 1.

There are also a number of regular files in the /proc directory that provide information about the running kernel:

- `/proc/cmdline` | Information that was passed to the kernel when it was first started, such as command line parameters and special instructions
- `/proc/meminfo` | Information about the use of memory by the kernel
- `/proc/modules` | A list of modules currently loaded into the kernel to add extra functionality

Again, there is rarely a need to view these files directly, as other commands offer more user-friendly output and an alternative way to view this information.

> While most of the "files" underneath the /proc directory cannot be modified, even by the root user, the "files" underneath the /proc/sys directory are potentially meant to be changed by the root user. Modifying these files changes the behavior of the Linux kernel.

Direct modification of these files causes only temporary changes to the kernel. To make changes permanent (persistent even after rebooting), entries can be added to the appropriate section of the `/etc/sysctl.conf` file.

For example, the /proc/sys/net/ipv4 directory contains a file named icmp_echo_ignore_all. If that file contains a zero 0 character, as it normally does, then the system will respond to icmp requests. If that file contains a one 1 character, then the system will not respond to icmp requests:

```bash
sysadmin@localhost:~$ su -
Password: 
root@localhost:~# cat /proc/sys/net/ipv4/icmp_echo_ignore_all 
0
root@localhost:~# ping -c1 localhost
PING localhost.localdomain (127.0.0.1) 56(84) bytes of data.
64 bytes from localhost.localdomain (127.0.0.1): icmp_seq=1 ttl=64 time=0.026 ms
 
--- localhost.localdomain ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.026/0.026/0.026/0.000 ms
root@localhost:~# echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
root@localhost:~# ping -c1 localhost
PING localhost.localdomain (127.0.0.1) 56(84) bytes of data.
 
--- localhost.localdomain ping statistics ---
1 packets transmitted, 0 received, 100% packet loss, time 1
```

### 13.2.1 Process Hierarchy

When the kernel finishes loading during the boot procedure, it starts the init process and assigns it a PID of 1. This process then starts other system processes, and each process is assigned a PID in sequential order.

> On a **System V-based system**, the init process would be the `/sbin/init` program. On a **systemd-based system**, the `/bin/systemd` file is typically executed but is almost always a link to the `/lib/system/systemd` executable. Regardless of which type of system init process that is being run, the information about the process can be found in the `/proc/1` directory.

As either of the init processes starts up other processes, they, in turn, may start up processes, which may start up other processes, on and on. When one process starts another process, the process that performs the starting is called the **parent process** and the process that is started is called the **child process**. When viewing processes, the parent PID is labeled PPID.

When the system has been running for a long time, it may eventually reach the maximum PID value, which can be viewed and configured through the `/proc/sys/kernel/pid_max` file. Once the largest PID has been used, the system "rolls over" and continues seamlessly by assigning PID values that are available at the bottom of the range.

Processes can be “mapped” into a family tree of parent and child couplings. If you want to view this tree, the command `pstree` displays it:

```bash
sysadmin@localhost:~$ pstree
init-+-cron
‌⁠​​
     |-login---bash---pstree
     |-named---18*[{named}]
     |-rsyslogd---2*[{rsyslogd}]
     `-sshd
```

If you were to examine the parent and child processes relationship using the output of the previous command, it could be described as the following:

- init is the parent of login
- login is the child of init
- login is the parent of bash
- bash is the child of login
- bash is the parent of pstree
- pstree is the child of bash


### 13.2.2 Viewing Process Snapshot

Another way of viewing processes is with the `ps` command. By default, the ps command only shows the current processes running in the current shell. Ironically, even though you are trying to obtain information about processes, the ps command includes itself in the output:

```bash
sysadmin@localhost:~$ ps
  PID TTY          TIME CMD
 6054 ?        00:00:00 bash
 6070 ?        00:00:01 xeyes
 6090 ?        00:00:01 firefox
 6146 ?        00:00:00 ps
```

If you run ps with the option `--forest`, then, similar to the pstree command, it shows lines indicating the parent and child relationship:

To be able to view all processes on the system execute either the `ps aux` command or the `ps -ef` command:


The output of all processes running on a system can be overwhelming. In the preceding examples, the output of the ps command was filtered by the head command, so only the first ten processes were shown. If you don't filter the output of the ps command, then you are likely to have to scroll through hundreds of processes to find what might interest you.

A common way to reduce the number of lines of output that the user might have to sort through is to use the grep command to filter the output display lines that match a keyword, such as a process name. For example, to only view information about the firefox process, execute a command like:

Sending the output to a pager such as the less command can also make the output of the ps command more manageable.

An administrator may be more concerned about the processes of another user. There are several styles of options that the ps command supports, resulting in different ways to view an individual user's processes. To use the traditional UNIX option to view the processes of a specific user, use the -u option:

```bash
sysadmin@localhost:~$ ps --forest
  PID TTY          TIME CMD
‌⁠​​⁠
 6054 ?        00:00:00 bash
 6090 ?        00:00:02   \_ firefox
 6180 ?        00:00:00   \_ dash
 6181 ?        00:00:00        \_ xeyes
 6188 ?        00:00:00        \_ ps
sysadmin@localhost:~$ ps aux | head
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0  17872  2892 ?        Ss   08:06   0:00 /sbin?? /init
syslog      17  0.0  0.0 175744  2768 ?        Sl   08:06   0:00 /usr/sbin/rsyslogd -c5
root        21  0.0  0.0  19124  2092 ?        Ss   08:06   0:00 /usr/sbin/cron
root        23  0.0  0.0  50048  3460 ?        Ss   08:06   0:00 /usr/sbin/sshd
bind        39  0.0  0.0 385988 19888 ?        Ssl  08:06   0:00 /usr/sbin/named -u bind
root        48  0.0  0.0  54464  2680 ?        S    08:06   0:00 /bin/login -f
sysadmin    60  0.0  0.0  18088  3260 ?        S    08:06   0:00 -bash
sysadmin   122  0.0  0.0  15288  2164 ?        R+   16:26   0:00 ps aux
sysadmin   123  0.0  0.0  18088   496 ?        D+   16:26   0:00 -bash
sysadmin@localhost:~$ ps -ef | head
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 08:06 ?        00:00:00 /sbin?? /init
syslog      17     1  0 08:06 ?        00:00:00 /usr/sbin/rsyslogd -c5
root        21     1  0 08:06 ?        00:00:00 /usr/sbin/cron
root        23     1  0 08:06 ?        00:00:00 /usr/sbin/sshd
bind        39     1  0 08:06 ?        00:00:00 /usr/sbin/named -u bind
root        48     1  0 08:06 ?        00:00:00 /bin/login -f
sysadmin    60    48  0 08:06 ?        00:00:00 -bash
sysadmin   124    60  0 16:46 ?        00:00:00 ps -ef
sysadmin   125    60  0 16:46 ?        00:00:00 head
sysadmin@localhost:~$ ps -e | grep firefox
 6090 pts/0    00:00:07 firefox
sysadmin@localhost:~$ ps -u root
  PID TTY          TIME CMD
    1 ?        00:00:00 init
   13 ?        00:00:00 cron
   15 ?        00:00:00 sshd
   43 ?        00:00:00 login
```


### 13.2.3 Viewing Processes in Real Time

Whereas the ps command provides a snapshot of the processes running at the instant the command is executed, the top command has a dynamic, screen-based interface that regularly updates the output of running processes. The top command is executed as follows:

```bash
sysadmin@localhost:~$ top
top - 00:26:56 up 28 days, 20:53,  1 user,  load average: 0.11, 0.15, 0.17
Tasks:   8 total,   1 running,   7 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.2 us,  0.2 sy,  0.0 ni, 99.6 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 13201464+total, 76979904 free, 47522152 used,  7512580 buff/cache
KiB Swap: 13419622+total, 13415368+free,    42544 used. 83867456 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    1 root      20   0   18376   3036   2764 S   0.0  0.0   0:00.12 init
    9 syslog    20   0  191328   5648   3100 S   0.0  0.0   0:00.04 rsyslogd
   13 root      20   0   28356   2552   2320 S   0.0  0.0   0:00.00 cron
   15 root      20   0   72296   3228   2484 S   0.0  0.0   0:00.00 sshd
   24 bind      20   0  878888  39324   7148 S   0.0  0.0   0:02.72 named
   43 root      20   0   78636   3612   3060 S   0.0  0.0   0:00.00 login
   56 sysadmin  20   0   18508   3440   3040 S   0.0  0.0   0:00.00 bash
   72 sysadmin  20   0   36600   3132   2696 R   0.0  0.0   0:00.03 top
```

By default, the output of the top command is sorted by the percentage % of CPU time that each process is currently using, with the higher values listed first, meaning more CPU-intensive processes are listed first:


There is an extensive amount of interactive commands that can be executed from within the running top program. Use the H key to view a full list.

One of the advantages of the top command is that it can be left running to stay on top of processes for monitoring purposes. If a process begins to dominate, or run away with the system, then by default it will appear at the top of the list presented by the top command. An administrator that is running the top command can then take one of two actions:

- Key	Action `K`	Terminate the runaway process.
- `R` Adjust the priority of the process.

Pressing the K key while the top command is running will prompt the user to provide the PID and then a signal number. 
- Sending the default signal requests the process terminate
- Sending signal number 9, the KILL signal, forces the process to terminate.

Pressing the R key while the top command is running will prompt the user for the process to renice, and then for a niceness value. **Niceness values** can range from -20 to 19, and affect priority. --> Only the root user can use a niceness value that is a lower number than the current one, or a negative niceness value, which causes the process to run with an increased priority. Any user can provide a niceness value that is higher than the current niceness value, which causes the process to run with a lowered priority.

Another advantage of the top command is that it can provide an overall representation of how busy the system is currently and the trend over time.

```bash
top - 00:26:56 up 28 days, 20:53,  1 user,  load average: 0.11, 0.15, 0.17
Tasks:   8 total,   1 running,   7 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.2 us,  0.2 sy,  0.0 ni, 99.6 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
KiB Mem : 13201464+total, 76979904 free, 47522152 used,  7512580 buff/cache
KiB Swap: 13419622+total, 13415368+free,    42544 used. 83867456 avail Mem

  PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    1 root      20   0   18376   3036   2764 S   0.0  0.0   0:00.12 init
    9 syslog    20   0  191328   5648   3100 S   0.0  0.0   0:00.04 rsyslogd
   13 root      20   0   28356   2552   2320 S   0.0  0.0   0:00.00 cron
   15 root      20   0   72296   3228   2484 S   0.0  0.0   0:00.00 sshd
   24 bind      20   0  878888  39324   7148 S   0.0  0.0   0:02.72 named
   43 root      20   0   78636   3612   3060 S   0.0  0.0   0:00.00 login
   56 sysadmin  20   0   18508   3440   3040 S   0.0  0.0   0:00.00 bash
   72 sysadmin  20   0   36600   3132   2696 R   0.0  0.0   0:00.03 top
```

The load averages shown in the first line of output from the top command indicate how busy the system has been during the last one, five and fifteen minutes. This information can also be viewed by executing the `uptime` command or directly by displaying the contents of the `/proc/loadavg` file:

Note: To exit the top program and return to the prompt, type q.

```bash
sysadmin@localhost:~$ cat /proc/loadavg
0.12 0.46 0.25 1/254 3052
```

:

0.12 0.46 0.25 1/254 3052

- The first three numbers in this file indicate the load average over the last one, five and fifteen minute intervals.
- The fourth value is a fraction which shows the number of processes currently executing code on the CPU 1 and the total number of processes 254.
- The fifth value is the last PID value that executed code on the CPU.

The number reported as a load average is proportional to the number of CPU cores that are able to execute processes. On a single-core CPU, a value of one (1) would mean that the system is fully-loaded. On a four core CPU, a value of 1 would mean that the system is only 1/4 or 25% loaded.

Another reason administrators like to keep the top command running is the ability to monitor memory usage in real-time. Both the top and the free command display statistics for how overall memory is being used.

The top command can also show the percentage of memory used by each process, so a process that is consuming an inordinate amount of memory can quickly be identified.

## 13.3 Memory

Memory on a modern Linux system is 
- governed and managed by the kernel.
- The hardware memory on the system is shared by all the processes on the system, through a method called **virtual addressing**. 
- The physical memory can be referenced by a number of processes, any of which may think they are able to address more memory than they actually can.
- Virtual addressing allows many processes to access the same memory without conflicts or crashes. It does this by allocating certain areas of a physical (or virtual) hard disk to be used in place of physical RAM. Memory is divided into blocks of equally sized units that can be addressed like any other resource on the system. Not only can the system access memory from local system addresses, but it can also access memory that is located elsewhere, such as on a different computer, a virtual device, or even on a volume that is physically located on another continent!

While a detailed review of Linux memory addressing is beyond the scope of this course, it’s important to note the difference between user space and kernel space.

- **Kernel space** is where code for the kernel is stored and executed. This is generally in a “protected” range of memory addresses and remains isolated from other processes with lower privileges.
- **User space**, on the other hand, is available to users and programs. They communicate with the Kernel through “system call” APIs that act as intermediaries between regular programs and the Kernel. This system of separating potentially unstable or malicious programs from the critical work of the Kernel is what gives Linux systems the stability and resilience that application developers rely on.

### 13.3.1 Viewing Memory

Executing the free command without any options provides a snapshot of the memory being used at that moment.

If you want to monitor memory usage over time with the free command, then you can execute it with the `-s` option (how often to update) and specify that number of seconds. For example, executing the following free command would update the output every ten seconds:

```bash
sysadmin@localhost:~$ free -s 10
              total        used        free      shared  buff/cache   available
Mem:      132014640    47304084    77189512        3008     7521044    84085528
Swap:     134196220       42544   134153676

              total        used        free      shared  buff/cache   available
Mem:      132014640    47302928    77190668        3008     7521044    84086684
Swap:     134196220       42544   134153676
```

To make it easier to interpret what the free command is outputting, the `-m or -g` options can be useful by showing the output in either megabytes or gigabytes, respectively. Without these options, the output is displayed in bytes:

**memory adjustment**
The third line represents the amount of physical memory after adjusting those values by not taking into account any memory that is in use by the kernel for buffers and caches. Technically, this "used" memory could be "reclaimed" if needed:

**swap memory**
The fourth line of output refers to swap memory, also known as virtual memory. This is space on the hard disk that is used like physical memory when the amount of physical memory becomes low. Effectively, this makes it seem that the system has more memory than it does, but using swap space can also slow down the system

If the amount of memory and swap that is available becomes very low, then the system will begin to automatically terminate processes, making it critical to monitor the system's memory usage. An administrator that notices the system becoming low on free memory can use `top` or kill to terminate the processes of their own choice, rather than letting the system choose

## 13.4 Log Files

As the kernel and various processes run on the system, they produce output that describes how they are running. Some of this output is displayed as standard output and error in the terminal window where the process was executed, though some of this data is not sent to the screen. Instead, it is written to various files. This information is called **log data** or **log messages**.

Log files are useful for many reasons; they help troubleshoot problems and determine whether or not unauthorized access has been attempted.

- Some processes can log their own data to these files 
- other processes rely on a separate process (a daemon) to handle these log data files.

> Note: Syslog is the term that is used almost generically to describe logging in Linux systems as it has been in place quite some time. In some cases, when an author says syslog what they really mean is whatever logging system is currently in use on this distribution.

Logging daemons differ in two main ways in recent distributions. 
- The older method of doing system logging is two daemons (named **syslogd** and **klogd**) working together, 
- in more recent distributions, a single service named **rsyslogd** combines these two functions and more into a single daemon.
- in yet more recent distributions, those based on systemd, the logging daemon is named **journald**, and the logs are designed to allow for mainly text output, but also binary. The standard method for viewing journald-based logs is to use the `journalctl` command.

Regardless of what daemon process being used, the log files themselves are almost always placed into the /var/log directory structure. Although some of the file names may vary, here are some of the more common files to be found in this directory:

- boot.log :	Messages generated as services are started during the startup of the system.
- cron : Messages generated by the crond daemon for jobs to be executed on a recurring basis.
- dmesg : Messages generated by the kernel during system boot up.
- maillog	: Messages produced by the mail daemon for e-mail messages sent or received.
- messages : Messages from the kernel and other processes that don't belong elsewhere. Sometimes named syslog instead of messages after the daemon that writes this file.
- secure : Messages from processes that required authorization or authentication (such as the login process).
- journal :	Messages from the default configuration of the systemd-journald.service; can be configured in the /etc/journald.conf file amongst other places.
- Xorg.0.log : Messages from the X Windows (GUI) server.


You can view the contents of various log files using two different methods. 

- use the `cat` command, or the `less` command to allow for searching, scrolling and other options.
- use the `journalctl` command on systemd-based systems, mainly because the /var/log/journal file now often contains binary information and using the cat or less commands may produce confusing screen behavior from control codes and binary items in the log files.

Log files are **rotated**, meaning older log files are renamed and replaced with newer log files. The file names that appear in the table above may have a numeric or date suffix added to them: for example, secure.0 or secure-20181103.

Rotating a log file typically occurs on a regularly-scheduled basis: for example, once a week. When a log file is rotated, the system stops writing to the log file and adds a suffix to it. Then a new file with the original name is created, and the logging process continues using this new file.

With most modern daemons, a date suffix is used. So, at the end of the week ending November 3, 2018, the logging daemon might stop writing to /var/log/messages (or /var/log/journal), rename that file /var/log/messages-20181103, and then begin writing to a new /var/log/messages file.

Although most log files contain text as their contents, which can be viewed safely with many tools, other files such as the /var/log/btmp and /var/log/wtmp files contain binary. By using the `file` command, users can check the file content type before they view it to make sure that it is safe to view. The following file command classifies /var/log/wtmp as data, which usually means the file is binary:

```bash
sysadmin@localhost:~$ file /var/log/wtmp
/var/log/wtmp: data
```

For the files that contain binary data, there are commands available that will read the files, interpret their contents and then output text. For example, the lastb and last commands can be used to view the /var/log/btmp and /var/log/wtmp files respectively.

> The `lastb` requires root privileges to be executed in our virtual machine environment.

# 13.5 Kernel Messages

The `/var/log/dmesg` file contains the kernel messages that were produced during system startup. The `/var/log/messages` file contains kernel messages that are produced as the system is running, but those messages are mixed in with other messages from daemons or processes.

Although the kernel doesn't have its own log file normally, one can be configured for it by modifying either the `/etc/syslog.conf` file or the `/etc/rsyslog.conf` file. In addition, the `dmesg` command can be used to view the kernel ring buffer, which holds a large number of messages that are generated by the kernel.‌⁠​​⁠​ 

On an active system, or one experiencing many kernel errors, the capacity of this buffer may be exceeded, and some messages might be lost. The size of this buffer is set at the time the kernel is compiled, so it is not trivial to change.

Executing the dmesg command can produce up to 512 kilobytes of text, so filtering the command with a pipe to another command like less or grep is recommended. For example, if a user were troubleshooting problems with a USB device, then searching for the text USB with the grep command is helpful. The `-i` option is used to ignore case:

```bash
sysadmin@localhost:~$ dmesg | grep -i usb
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
ohci_hcd 0000:00:06.0: new USB bus registered, assigned bus number 1
usb usb1: New USB device found, idVendor=1d6b, idProduct=0001
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
```

## 13.6 Filesystem Hierarchy Standard

Among the standards supported by the Linux Foundation is the Filesystem Hierarchy Standard (FHS), which is hosted at the URL http://www.pathname.com/fhs/.

A standard is a set of rules or guidelines that it is recommended to follow. However, these guidelines certainly can be broken, either by entire distributions or by administrators on individual machines.

The FHS standard categorizes each system directory in a couple of ways:

- shareable vs not shareable, referring to whether the directory can be shared on a network and used by multiple machines.
- static files (file contents won't change) vs variable files (file contents can change).
To make these classifications. 

it is often necessary to refer to subdirectories below the top level of directories. 

eg. the /var directory itself cannot be categorized as either shareable or not shareable, but one of i'''irectories, the /var/ mail directory, is shareable. Conversely, the /var/lock directory should not be shareable.

|          | Not Shareable | Shareable |
| -------- | ------------- | --------- |
| Variable | /var/lock     | /var/mail |
| static   | /etc          | /opt      |


The Filesystem Hierarchy Standard defines four hierarchies of directories used in organizing the files of the filesystem. The top-level or root hierarchy follows.

<img src="https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_13_2.png">


- / =>The root directory is to the top level of the Linux system, serving as the first hierarchy. It contains, the following directories: 
- /bin => Essential binaries like the ls, cp, and rm commands, and be a part of the root filesystem
- /boot => Files necessary to boot the system, such as the Linux kernel and associated configuration files
- /dev => Files that represent hardware devices and other special files, such as the /dev/null and /dev/zero files 
- /etc => Essential host configurations files such as the /etc/hosts or /etc/passwd files
- /home => 	User home directories 
- /lib => Essential libraries to support the executable files in the /bin and /sbin directories
- /lib64 => 	Essential libraries built for a specific architecture. For example, the /lib64 directory for 64-bit AMD/Intel x86 compatible processors
- /media => Mount point for removable media mounted automatically
- /mnt => Mount point for temporarily mounting filesystems manually
- /opt => Optional third-party software installation location
- /proc => Virtual filesystem for the kernel to report process information, as well as other information
- /root => 	Home directory of the root user
- /sbin	=> Essential system binaries primarily used by the root user
- /sys =>	Virtual filesystem for information about hardware devices connected to the system
- /srv =>	Location where site-specific services may be hosted
- /tmp => Directory where all users are allowed to create temporary files and that is supposed to be cleared at boot time (but often is not)
- **/usr** => Second hierarchy | Non-essential files for multi-user use
  - /usr/local => Third hierarchy | Files for software not originating from distribution
- **/var** => Fourth hierarchy | Files that change over time
  - /var/cache	=> Files used for caching application data
  - /var/log =>	Most log files
  - /var/lock =>	Lock files for shared resources
  - /var/spool =>	Spool files for printing and mail
  - /var/tmp Temporary files to be preserved between reboots

The second and third hierarchies, located under the /usr and /usr/local directories, repeat the pattern of many of the key directories found under the first hierarchy or root filesystem. The fourth hierarchy, the /var directory, also repeats some of the top-level directories such as lib, opt and tmp.

- While the root filesystem and its contents are considered essential or necessary to boot the system, the 
- /var, /usr and /usr/local directories are deemed non-essential for the boot process. As a result, the root filesystem and its directories may be the only ones available in certain situations like booting into single-user mode, an environment designed for troubleshooting the system.
- The /usr directory is intended to hold software for use by multiple users. The /usr directory is sometimes shared over the network and mounted as read-only.
- The /usr/local hierarchy is for installation of software that does not originate with the distribution. Often this directory is used for software that is compiled from the source code.


### 13.6.1 Organization Within the Filesystem Hierarchy

Although the FHS standard is helpful for a detailed understanding of the layout of the directories used by most Linux distributions, the following provides a more generalized description of the layout of directories as they exist on a typical Linux distribution.

*User Home Directories*

The /home directory has a directory underneath it for each user account. For example, a user bob will have a home directory of /home/bob. Typically, only the user bob will have access to this directory. Without being assigned special permissions on other directories, a user can only create files in
- home directory
- /tmp directory
- /var/tmp directory.

*Binary Directories*

Binary directories contain the programs that users and administrators execute to start processes or applications running on the system.

*User-Specific Binaries*

The binary directories that are intended to be used by non-privileged users include:

- /bin
- /usr/bin
- /usr/local/bin

Sometimes third-party software also store their executable files in directories such as:

- /usr/local/application/bin
- /opt/application/bin

In addition, it is not unusual for each user to have their own bin directory located in their home directory; for example, /home/bob/bin.

*Root-Restricted Binaries*

On the other hand, the sbin directories are primarily intended to be used by the system administrator (the root user). These usually include:

- /sbin
- /usr/sbin
- /usr/local/sbin

Some third-party administrative applications could also use directories such as:

- /usr/local/application/sbin
- /opt/application/sbin
- 
Depending on the distribution, the PATH variable may not contain all of the possible bin and sbin directories. To execute a command in one of these directories, the directory needs to be included in the PATH variable list, or the user needs to specify the path to the command.

*Software Application Directories*

Unlike the Windows operating system, where applications may have all of their files installed in a single subdirectory under the C:\Program Files directory, applications in Linux may have their files in multiple directories spread out throughout the Linux filesystem. For Debian-derived distributions, you can execute the `dpkg -L packagename` command to get the list of file locations. In Red Hat-derived distributions, you can run the `rpm -ql packagename` command for the list of the locations of the files that belong to that application.

The executable program binary files may go in the 

- /usr/bin directory 
- /usr/local/bin 
- /opt/application/bin directories if they came from a third party.

The data for the application may be stored in one of the following subdirectories:

- /usr/share
- /usr/lib
- /opt/application
- /var/lib

The file related to documentation may be stored in one of the following subdirectories:

- /usr/share/doc
- /usr/share/man
- usr/share/info

- The global configuration files for an application are most likely to be stored in a subdirectory under the /etc directory 
- the personalized configuration files (specific for a user) for the application are probably in a hidden subdirectory of the user's home directory.

*Library Directories*

**Libraries** are files which contain code that is shared between multiple programs. Most library file names end in a file extension of `.so`, which means **shared object.**

- Multiple versions of a library may be present because the code may be different within each file even though it may perform similar functions as other versions of the library
- One of the reasons that the code may be different, even though it may do the same thing as another library file, is that it is compiled to run on a different kind of processor. For example, it is typical for systems that use code designed for 64-bit Intel/AMD type processors to have both 32-bit libraries and 64-bit libraries.

The libraries that support the essential binary programs found in the `/bin` and `/sbin` directories are typically located in either `/lib` or `/lib64`.

To support the `/usr/bin` and `/usr/sbin` executables, the `/usr/lib` and `/usr/lib64` library directories are typically used.

For supporting applications that are not distributed with the operating system, the `/usr/local/lib` and `/opt/application/lib` library directories are frequently used.

*Variable Data Directories*

- The /var directory and many of its subdirectories can contain data that changes frequently. If your system is used for email, then either /var/mail or /var/spool/mail is normally used to store users' email data. If you are printing from your system, then the /var/spool/cups directory is used to store the print jobs temporarily.

- Depending on what events are being logged and how much activity is occurring, the system determines how large your log file becomes. On a busy system, there could be a considerable amount of data in the log files. These files are stored in the /var/log directory.

- While the log files can be handy for troubleshooting problems, they can cause problems. One major concern for all of these directories is that they can fill up the disk space quickly on an active system. If the /var directory is not a separate partition, then the root filesystem could become full and cause the system to crash.