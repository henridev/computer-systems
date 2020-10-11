# Chapter 1 - Introduction to Linux



## 1.1 Linux is Everywhere

Hello and welcome to **NDG Linux Essentials**!

While your journey will be ongoing, be comforted that you are learning a set of technologies, commands, and methods that have stood the test of time. Linux utilizes and expands upon many of the commands and ways of accomplishing computing that UNIX began, with a rate of change per year that’s very manageable. Now, some 30+ years on, many of those learned commands are still active and used every day by sysadmins, devops, and architects. Linux is a revolution of evolution, allowing you to learn the majority once and keep up with the small percentage of changes in a continual learning process.



## 1.2 Linux is a Kernel

 **linux** : the kernel of the system (central controller of everything that happens on the computer)

When most people refer to Linux, they are really referring to a combination of software called **GNU/Linux**, which defines the operating system. 

- **GNU** is the free software that provides open source equivalents of many common UNIX commands.
- The **Linux** part of this combination is the Linux kernel, which is the core of the operating system. The kernel is loaded at boot time and stays running to manage every aspect of the functioning system.

The story of Linux begins with **UNIX**, an operating system developed at AT&T Bell Labs in the 1970s. UNIX is written in the **C** language making it uniquely portable amongst competing operating systems, which were typically closely tied to the hardware for which they were written. It quickly gained popularity in research and academic settings, as well as amongst programmers who were attracted to its modularity. Over time it was modified and forked (that is, people modified it, and those modifications served as the basis for other systems) such that at present there are many different variants of UNIX. However, UNIX is now both a trademark and a specification, owned by an industry consortium called the **Open Group**. Only software that has been certified by the Open Group may call itself UNIX.

Linux started in 1991 as a hobby project of **Linus Torvalds**, a Finnish-born computer scientist studying at the University of Helsinki. Frustrated by the licensing of MINIX, a UNIX-like operating system designed for educational use, and its creator’s desire not to make it a full operating system, Linus decided to create his own OS kernel.

Despite adopting all the requirements of the UNIX specification, Linux has not been certified, so Linux really isn’t UNIX! It’s just… UNIX-like.

Prior to and alongside this development was the **GNU Project**, created by **Richard Stallman** in 1983. While GNU initially focused on building their own operating system, they ultimately were far more effective at building tools that go along with a UNIX-like operating system, such as the editors, compilers and user interfaces that make a kernel usable. Since the source was all freely available, Linux programmers were able to incorporate the GNU tools to provide a complete operating system. As such, many of the tools and utilities that are part of the Linux system evolved from these early GNU tools.



## 1.3 Linux is Open Source

**closed-source license** : you get the right to use the machine code, but cannot see the source code. Often the license explicitly says that you may not attempt to reverse engineer the machine code back to source code to figure out what it does!

The development of Linux closely parallels the rise of **open source software.** Open source takes a source-centric view of software. The open source philosophy is that you have a right to obtain the software source code and to modify it for your own use.

Linux adopted this philosophy to great success. Linus made the source programming code (the instructions a computer uses to operate) freely available, allowing others to join in and shape this fledgling operating system. It was not the first system to be developed by a volunteer group, but since it was built from scratch, early adopters could influence the project’s direction. People took the source, made changes, and shared them back with the rest of the group, greatly accelerating the pace of development, and ensuring mistakes from other operating systems were not repeated.



## 1.4 Linux Has Distributions

People that say their computer runs Linux usually refer to the kernel, tools, and suite of applications that come bundled together in what is referred to as a distribution.

Take Linux and the GNU tools, add some user-facing applications like a web browser and an email client, and you have a full Linux system. Individuals and even companies started bundling all this software into distributions almost as soon as Linux became usable. The distribution includes tools that take care of setting up the storage, installing the kernel, and installing the rest of the software. The full-featured distributions also include tools to manage the system and a package manager to help you add and remove software after the installation is complete.

Like UNIX, there are distributions suited to every imaginable purpose. There are distributions that focus on running servers, desktops, or even industry-specific tools such as electronics design or statistical computing. The major players in the market can be traced back to either Red Hat, Debian or Slackware. The most visible difference between Red Hat and Debian derivatives is the package manager though there are other differences in everything from file locations to political philosophies.



## 1.5 Linux Embraces the CLI

- GUI, applications present themselves in windows that can be resized and moved around. There are menus and tools to help users navigate. Graphical applications include web browsers, graphics editing tools and email, to name a few. Below is an example of a graphical desktop, with a menu bar of popular applications to the left, a LibreOffice document being edited in the foreground and a web browser in the background.

<img src="https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/ubuntu-desktop.png" alt="img" style="zoom:30%;" />



-  CLI, a text-based interface to the computer. The CLI relies primarily on keyboard input. Everything the user wants the computer to do is relayed by typing commands rather than clicking on icons. It can be said that when a user clicks on an icon, the computer is telling the user what to do, but, when the user types a command, they are telling the computer what to do.



# Chapter 2 - Operating Systems



## 2.1 Operating Systems

**operating system** : software that runs on a computing device and manages the hardware and software components that make up a functional computing system.

Modern operating systems don’t just manage hardware and software resources, 

- they schedule programs to run in a multi-tasking manner (sharing the processor so that multiple tasks can occur apparently simultaneously), 
- provide standard services that allow users and programs to request something happen (for example a print job) from the operating system, and provided it’s properly requested, the operating system will accept the request and perform the function needed.

Desktop and server operating systems are by nature more complex than an operating system that runs on a single-purpose device such as a firewall, or a mobile phone. From a simple set-top box that provides a menu interface for a cable provider, to supercomputers and massive, parallel computing clusters, the generic term operating system is used to describe whatever software is booted and run on that device.

<img src="https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_2_1.png" alt="The software of a system is the go-between for users and hardware. Software includes the system software, applications, and operating system." style="zoom:37%;" />

Computer users today have a choice mainly between three major operating systems: **Microsoft Windows**, **Apple macOS**, and **Linux**.

Of the three major operating systems listed only Microsoft Windows is unique in its underlying code. Apple’s macOS is a fully-qualified UNIX distribution based on BSD Unix (an operating system distributed until 1995), complemented by a large amount of proprietary code. It runs on hardware specifically optimized to work with Apple software. Linux can be any one of hundreds of distribution packages designed or optimized for whatever task is required. Only Microsoft Windows is based on a proprietary code base that isn’t either UNIX- or Linux-based.

A user can easily interact with any of these systems by pointing and clicking their way through everyday productivity tasks that all behave similarly regardless of the underlying operating system. Except for Windows, which is mostly administered via the GUI, most system administration tasks are performed using typed commands in a terminal. An administrator that is familiar with UNIX can typically perform tasks on a Linux system and vice versa. Many Linux command line functions also have Microsoft equivalents that administrators use to do their work efficiently.

## 2.1.1 Decision Points

### Role

The first decision when specifying any computer system is the machine’s role.

-  Will you be sitting at the console running productivity applications or web browsing? If so, a familiar **desktop** is best. 
- Will the machine be accessed remotely by many users or provide services to remote users? Then it’s a **server**.

Servers typically sit in a rack and share a keyboard and monitor with many other computers, since console access is generally only used for configuration and troubleshooting. Servers generally run as a CLI, which frees up resources for the real purpose of the computer: serving information to clients (any user or system that accesses resources remotely). Desktop systems primarily run a GUI for the ease of use of their users.

### Function

Next, determine the functions of the machine. Is there specific software it needs to run, or specific functions it needs to perform? Will there be hundreds, even thousands, of these machines running at the same time? What is the skill-set of the team managing the computer and software?

### Life Cycle

The service lifetime and risk tolerance of the server also needs to be determined. Operating systems and software upgrades come on a periodic basis, called a **release cycle**. Vendors only support older versions of software for a certain period of time before not offering any updates; this is called a maintenance cycle or **life cycle**.

In an enterprise server environment, maintenance and release cycles are critical considerations because it is time-consuming and expensive to do major upgrades. Instead, the server hardware itself is often replaced because increased performance is worth the extra expense, and the resources involved are often many times more costly than the hardware.

**Consider This**

There is a fair amount of work involved in upgrading a server due to specialized configurations, application software patching and user testing, so a proactive organization will seek to maximize their return on investment in both human and monetary capital.

Modern data centers are addressing this challenge through **virtualization**. In a virtual environment, one physical machine can host dozens, or even hundreds of virtual machines, decreasing space and power requirements, as well as providing for automation of many of the tasks previously done manually by systems administrators. Scripting programs allow virtual machines to be created, configured, deployed and removed from a network without the need for human intervention. Of course, a human still needs to write the script and monitor these systems, at least for now.

The need for physical hardware upgrades has also been decreased immensely with the advent of cloud services providers like **Amazon Web Services**, **Rackspace**, and **Microsoft Azure**. Similar advances have helped desktop administrators manage upgrades in an automated fashion and with little to no user interruption.

### ‌⁠⁠Stability

Individual software releases can be characterized as beta or stable depending on where they are in the release cycle. When a software release has many new features that haven’t been tested, it’s typically referred to as beta. After being tested in the field, its designation changes to stable.

Users who need the latest features can decide to use beta software. This is often done in the development phase of a new deployment and provides the ability to request features not available on the stable release.

Production servers typically use stable software unless needed features are not available, and the risk of running code that has not been thoroughly tested is outweighed by the utility provided.

Software in the open source realm is often released for peer review very early on in its development process, and can very quickly be put into testing and even production environments, providing extremely useful feedback and code submissions to fix issues found or features needed.

Conversely, proprietary software will often be kept secret for most of its development, only reaching a public beta stage when it’s almost ready for release.

### Compatibility

refers to the ability of later operating systems to be compatible with software made for earlier versions. This is usually a concern when it is necessary to upgrade an operating system, but an application software upgrade is not possible due to cost or lack of availability.

The norm for open source software development is to ensure backward compatibility first and break things only as a last resort. The common practice of maintaining and versioning libraries of functions helps this greatly. Typically, a library that is used by one or more programs is versioned as a new release when significant changes have occurred but also keeps all the functions (and compatibility) of earlier versions that may be hard-coded or referred to by existing software.

### Cost

Cost is always a factor when specifying new systems. Microsoft has annual licensing fees that apply to users, servers and other software, as do many other software companies. Ultimately, the choice of operating system will be affected by available hardware, staff resources and skill, cost of purchase, maintenance, and projected future requirements.

Virtualization and outsourced support services offer the modern IT organization the promise of having to pay for only what it uses rather than building in excess capacity. This not only controls costs but offers opportunities for people both inside and outside the organization to provide expertise and value.

### Interface

The first electronic computer systems were controlled by means of switches and plugboards similar to those used by telephone operators at the time. Then came punch cards and finally a text-based terminal system similar to the Linux command line interface (CLI) in use today. The graphical user interface (GUI), with a mouse and buttons to click, was pioneered at Xerox PARC (Palo Alto Research Center) in the early 1970s and popularized by Apple Computer in the 1980s.

Today, operating systems offer both GUI and CLI interfaces, however, most consumer operating systems (Windows, macOS) are designed to shield the user from the ins and outs of the CLI.



## 2.2 Microsoft Windows

**Microsoft** offers different operating systems according to the machine’s role

- The desktop version of Windows has undergone various naming schemes with the current version (as of this writing) being simply **Windows 10**. New versions of this OS come out every 3-5 years and tend to be supported for many years. Backward compatibility is a priority for Microsoft, even going so far as to bundle virtual machine technology so that users can run older software.
- **Windows Server** currently (as of this writing) is at version **2019** to denote the release date. The server can run a GUI but recently Microsoft, largely as a competitive response to Linux, has made incredible strides in its command line scripting capabilities through PowerShell. There is also an optional Desktop Experience package which mimics a standard productivity machine. Microsoft also actively encourages enterprise customers to incorporate its Azure cloud service.

## 2.3 Apple macOS

**Apple** makes the **macOS** operating system, which is partially based on software from the FreeBSD project and has undergone UNIX certification. macOS is well known for being “easy to use”, and as such has continued to be favored by users with limited access to IT resources like schools and small businesses. It is also very popular with programmers due to its robust UNIX underpinnings.

On the server side, **macOS Server** is primarily aimed at smaller organizations. This low-cost addition to macOS desktop allows users to collaborate, and administrators to control access to shared resources. It also provides integration with iOS devices like the iPhone and iPad.

Some large corporate IT departments allow users to choose macOS since users often require less support than standard Microsoft productivity deployments. The continued popularity of macOS has ensured healthy support from software vendors. macOS is also quite popular in the creative industries such as graphics and video production. For many of these users, application choice drives the operating system decision. Apple hardware, being integrated so closely with the operating system, and their insistence on adherence to standards in application programming gives these creative professionals a stable platform to perform many computing-intense functions with fewer concerns about compatibility.



## 2.4 Linux

Linux users typically obtain an operating system by downloading a distribution. 

**Linux distribution** : a bundle of software, typically comprised of the Linux **kernel**, utilities, management tools, and even some application software in a package which also includes the means to update core software and install additional applications.

The distribution takes care of 

- setting up the storage
- building the kernel and installing hardware drivers
- installing applications and utilities to make a fully functional computer system. 

The organizations that create distributions also include tools to manage the system, a package manager to add and remove software, as well as update programs to provide security and functionality patches.

The number of Linux distributions available numbers in the hundreds, so the choice can seem daunting at first. However, the decision points are mostly the same as those highlighted for choosing an operating system.

### Role

With Linux, there are multiple options to choose from depending on organizational needs. The variety of distributions and accompanying software allows the operating system to be significantly more flexible and customizable. Distributions are available for a much wider variety of systems, from commercial offerings for the traditional server or desktop roles, to specialized distributions designed to turn an old computer into a network firewall; from distributions created to power a supercomputer, to those that enable embedded systems. These might focus on running application or web servers, productivity desktops, point-of-sale systems, or even tools dedicated to electronics design or statistical computing.

### Function

Governments and large enterprises may also limit their choices to distributions that offer commercial support because paying for another tier of support may be better than risking extensive outages. For the most part, concerns over security have been addressed through the large open source community, which monitors kernel changes for vulnerabilities and provides bug reporting and fixes at a much larger scale than closed source vendors can achieve.

Support for necessary applications may vary and is, therefore, an additional consideration. Often application vendors choose a subset of distributions to support. Different distributions have different versions of key libraries, and it is difficult for a company to support all these different versions. However, some applications like Firefox and LibreOffice are widely supported and available for all major distributions.

### Life Cycle

Most distributions have both major and minor update cycles to introduce new features and fix existing bugs. Additionally, there are development packages where users can contribute code and submit patches for possible inclusion into new releases.

Linux distributions can be broadly classed in two main categories: 

- enthusiast distribution such as openSUSE’s Tumbleweed has a fast update cycle, is not supported for enterprise and may not contain (or drop) features or software in the next version that are in the current one. Red Hat’s Fedora project uses a similar method of development and release cycle, as does Ubuntu Desktop.

- Enterprise distributions are almost the exact opposite, in that they take care to be stable and consistent, and offer enterprise-grade support for extended periods, anywhere from 5-13 years in the case of SUSE. Enterprise distributions are fewer by far, being offered mainly by Red Hat, Canonical and SUSE.

Application software may be written such that it only supports a specific release of a distribution, requiring users to remain on an older, less secure operating system than they might like. Therefore, some Linux releases are considered to have long-term support (LTS) of 5 years or more while others are only supported for two years or less.

### Stability

Some distributions offer stable, testing, and unstable releases. When choosing an unstable release for required features, consideration must be given to the fact that those features may change at any point during the development cycle. When features have been integrated into the system for a long time, with most of the bugs and issues addressed, the software moves through testing into the stable release.

Other releases depend on beta distributions. For instance, the Fedora distribution releases beta or pre-releases of its software ahead of the full release to minimize bugs. Fedora is often considered the community-oriented beta release of RedHat. Features are added and changed in the Fedora release before finding their way into the enterprise-ready RedHat distribution.

openSUSE and its enterprise counterpart SLES (SUSE Linux Enterprise Server) are similar, in that the community edition is used as a testing ground for the features and functions that will eventually be migrated into the enterprise version. Previously somewhat dissimilar, later versions of the openSUSE and SLES distribution codebases are nearly identical, allowing for easier migration of features and code from one to the other.

> **Consider This**
>
> The Debian distribution warns users about the pitfalls of using the “sid” (unstable) release with the following warning:
>
> ‘"sid" is subject to massive changes and in-place library updates. This can result in a very "unstable" system which contains packages that cannot be installed due to missing libraries, dependencies that cannot be fulfilled, etc. Use it at your own risk!’

### Interface

Like most operating systems, Linux can be used in one of two ways: graphical (GUI) and non-graphical (CLI). 

- In graphical mode, users can have several different windows with terminal applications (shells) open, which is very helpful when performing tasks on multiple remote computers. Administrators and users can log-in with their username and password through a graphical interface.
- The second type of interface, the CLI, is a text-based interface to the computer, where the user types in a command and the computer then executes it. The CLI environment is provided by an application on the computer known as a **terminal**. ‌⁠⁠ The terminal accepts what the user types and passes to a shell. The shell interprets what the user has typed into instructions that can be executed by the operating system. If output is produced by the command, then this text is displayed in the terminal. If problems with the command are encountered, then an error message is displayed.

The CLI starts with a text-based login as shown below. In a successful login, after being prompted for a username and password, you are taken CLI shell customized for the particular user.

```bash
ubuntu 18.04 ubuntu tty2
 
ubuntu login:
```

Here is an example of a CLI screen after logging in:

```bash
ubuntu 18.04 ubuntu tty2
 
ubuntu login: sue
Password:
 
The programs included with the Ubuntu system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.
 
‌⁠⁠ 
Ubuntu comes with ABSOLUTELY NO WARRANTY, to the extent permitted by
applicable law.
 
Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.4.0-72-generic x86_64)      
 
 * Documentation:  https://help.ubuntu.com/
 
212 packages can be updated.
91 updates are security updates.
 
sue@ubuntu:~$ w                                                         
 17:27:22 up 14 min,  2 users,  load average: 1.73, 1.83, 1.69
USER     TTY      FROM              LOGIN@   IDLE   JCPU   PCPU WHAT
sue    tty2                       20:08    14.35  0.05s  0.00s w
```

The original login prompt is at the top, with newer text added below. During login there may be some text displayed called the message of the day (MOTD). This is an opportunity for the systems administrator to pass information to users, or just make a silly joke. Following the MOTD is the command prompt, in the example above, 

>  `w`  command which shows who is logged in.



## 2.4.1 Linux Distributions

### Red Hat

**Red Hat** started as a simple distribution that introduced the Red Hat Package Manager (RPM). The developer eventually formed a company around it, which tried to commercialize a Linux desktop for business. Over time, Red Hat started to focus more on the server applications, such as web- and file-serving and released

- **Red Hat Enterprise Linux (RHEL)**,  a paid service on a long release cycle. A business may value stability and want long release cycles, while a hobbyist or a startup may want the latest software and opt for a shorter release cycle. To satisfy the latter group, Red Hat sponsors the **Fedora Project** which makes a personal desktop comprising the latest software but is still built on the same foundations as the enterprise version.
- **CentOS** came to be, because everything in Red Hat Enterprise Linux is open source . It recompiled all the RHEL packages (converting their source code from the programming language they were written into language usable by the system) and gave them away for free. CentOS and others like it (such as Scientific Linux) are largely compatible with RHEL and integrate some newer software, but do not offer the paid support that Red Hat does.
- **Scientific Linux** is an example of a specific-use distribution based on Red Hat. The project is a Fermilab-sponsored distribution designed to enable scientific computing. Among its many applications, Scientific Linux is used with particle accelerators including the Large Hadron Collider at CERN.

### SUSE

**SUSE**, originally derived from **Slackware**, was one of the first comprehensive Linux distributions, it has many similarities to Red Hat Enterprise Linux. The original company was purchased by Novell in 2003, which was then purchased by the Attachmate Group in 2011. The Attachmate group then merged with Micro Focus International in 2014, and in 2018 SUSE announced plans to go forward as an independent business. Through all of the mergers and acquisitions, SUSE has managed to continue and grow.

While SUSE Linux Enterprise contains proprietary code and is sold as a server product, **openSUSE** is a completely open, free version with multiple desktop packages similar to CentOS and Linux Mint.

### Debian

- **Debian** is more of a community effort, and as such, also promotes the use of open source software and adherence to standards. Debian came up with its own package management system based on the `.deb` file format. While Red Hat leaves non-Intel and AMD platform support to derivative projects, Debian supports many of these platforms directly.
- **Ubuntu** is the most popular Debian-derived distribution. It is the creation of **Canonical**, a company that was made to further the growth of Ubuntu and makes money by providing support. Ubuntu has several different variants for desktop, server and various specialized applications. They also offer an LTS version that is kept up-to-date for 3 years on desktops and 5 years on servers, which gives developers and the companies they work for confidence to build solutions based on a stable distribution.
- **‌⁠⁠Linux Mint** was started as a fork of Ubuntu Linux, while still relying upon the Ubuntu repositories. There are various versions, all free of cost, but some include proprietary codecs, which cannot be distributed without license restrictions in certain countries.

### Android

Linux is a kernel, and many of the commands covered in this course are actually part of the GNU package. That is why some people insist on using the term **GNU/Linux** instead of Linux alone.

**Android**, sponsored by Google, is the world’s most popular Linux distribution. It is fundamentally different from its counterparts. Android uses the **Dalvik** virtual machine with Linux, providing a robust platform for mobile devices such as phones and tablets. However, lacking the traditional packages that are often distributed with Linux (such as GNU and Xorg), Android is generally incompatible with desktop Linux distributions.

This incompatibility means that a Red Hat or Ubuntu user cannot download software from the Google Play store. Likewise, a terminal emulator in Android lacks many of the commands of its Linux counterparts. It is possible, however, to use BusyBox with Android to enable most commands to work.

### Other

**Raspbian** is a specialized Linux distribution optimized to run on **Raspberry Pi** hardware. This combination has seen significant use in training for programmers and hardware designers at all levels. Its low cost and ease of use have made it a favorite of educators worldwide, and many add-on devices are available to extend its capabilities into the physical world. There is a multitude of labs and projects available that teach everything from environmental monitoring to circuit design, machine learning, and robotics.

**Linux From Scratch (LFS)** is more of a learning tool than a working distribution. This project consists of an online book, and source code, with “step-by-step instructions” for building a custom Linux distribution from the source code up. This “distribution” embodies the true spirit of Linux whereby users can modify any aspect of the operating system and learn how all the pieces work together. It’s also a good starting point for anyone who needs specialized functionality or an ultra-compact build for an embedded system project.

We have discussed the distributions explicitly mentioned in the Linux Essentials objectives. Be aware that there are hundreds, if not thousands more that are available. While there are many different distributions of Linux, many of the programs and commands remain the same or are very similar.

<img src="https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_2_3.png" alt="A timeline of Linux distribution evolution. Debian was created in 1993 and has served as the basis for distributions such as Ubuntu (2004), Linux Mint (2006), and Raspbian (2013). SLS started in 1992, evolved into Slackware in 1993, and finally S.U.S.E. in 1994. This distribution has continued to grow over the last two decades and includes SUSE Linux Enterprise (2000) and openSUSE (2006). Red Hat began in 1994 and has fathered a number of distributions including Red Hat Enterprise Linux (2003), CentOS (2004), Scientific Linux (2004) and Fedora (2007)." style="zoom:27%;" />



## 2.4.2 Embedded Systems

Linux started out as something that would only run on a computer like Linus Torvald's: an Intel 386 PC with a specific hard drive controller, but since anyone could add to or change Linux, people started building support for other hardware. Eventually, Linux started supporting other chips with an emphasis on small size and low power consumption.

Because of this flexibility, a significant number of device makers have used Linux as the operating system for their hardware products. Today we call these **embedded systems** because they are designed to do a specific task on hardware optimized for only that purpose. These systems encompass a tremendous diversity of devices that are used today, from cell phones to smart TVs and appliances, to remote monitoring systems for pipelines and factories.

As Linux evolved, specialized processor chips were developed for consumer and industrial devices to take advantage of its capabilities. Support for Linux has become so ubiquitous that it is possible to prototype and bring to market new devices using off-the-shelf components. The rise of cheap, small, adaptable single-board computers like the Raspberry Pi has given experimenters and entrepreneurs everywhere tools to quickly build custom solutions, powered by Linux, that would have taken months of work by specialized teams just a few years ago.

While consumers are familiar with embedded Linux entertainment devices like digital video recorders (DVRs) and “smart TVs,” the real impact of embedded Linux is just starting to be realized. The **internet of things (IoT)** is just ramping up with cheap, ubiquitous devices being deployed on everything from oil wells to solar generating farms. These networks of smart sensors and controllers enable engineers to adjust critical processes in real time while monitoring and reporting back to central control stations. As more processes are being monitored and more data is being integrated with machine learning and artificial intelligence (AI) we can anticipate gains in efficiency, safety and productivity only dreamed of by past generations.

## key-terms 

Android

A Linux distribution that provides a platform for mobile users but lacks the traditional GNU/Linux packages to make it compatible with desktop Linux distributions.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

CentOS

A Linux distribution that is compatible with Red Hat Enterprise Linux but does not offer the paid support that Red Hat does.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

Debian

An operating system that uses the Linux kernel. It that promotes the use of open source software and adherence to standards.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

Linux Mint

A Linux distribution that is a derivative of Ubuntu and still relies upon the Ubuntu repositories.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

Raspberry Pi

A hardware platform used in training for programmers and hardware designers at all levels. Its low cost and ease of use have made it popular with educators.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

Raspbian

A specialized Linux distribution optimized to run on Raspberry Pi hardware.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

Red Hat

A Linux distribution that introduced Red Hat Package Manager (RPM). The developer formed a company by the same name which specializes in open source software.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

SUSE

One of the first comprehensive Linux distributions. It is derived from Slackware which offers many similarities with Red Hat Enterprise Linux.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

Scientific Linux

A specific use distribution based on Red Hat. It was designed to enable scientific computing.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

Ubuntu

The most popular Debian derived distribution. It has several different variants for desktop, server, and various specialized applications as well as an LTS version.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

beta

A software release that has many new features that haven’t been tested.
[Section 2.1.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.1.1)

command line interface (CLI)

A text based interface in which the user enters commands. Feedback, output and programs are presented in text format only.
[Section 2.1.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.1.1)

desktop configuration

Desktop are preferred if the user interacts with the system directly. Desktop system primarily run a GUI for the ease of use of its user.2.1.1
[Section 2.1.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.1.1)

graphical user interface (GUI)

A visual user interface that allows the user to interact with the system using windows, icons, a cursor, etc.
[Section 2.1.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.1.1)

long-term support (LTS)

Associated with the life cycle of distributions, this feature states that software is supported for 5 years or more.
[Section 2.4](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4)

maintenance cycles

The period of time vendors support older versions of software before not offering any updates.
[Section 2.1.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.1.1)

openSUSE

A Linux distribution that is a completely open, free version of SUSE Linux Enterprise with multiple desktop packages similar to CentOS and Linux Mint.
[Section 2.4.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.4.1)

stable

A software release whose updates have been tested in the field.
[Section 2.1.1](https://content.netdevgroup.com/contents/linux-essentials/MX53hsCaJo/2.1.1)



# Chapter 3 - Working in Linux



## 3.1 Navigating the Linux Desktop

To be a Linux systems administrator, it is necessary to be comfortable with Linux as a desktop operating system and have proficiency with basic ICT skills. Using Linux for productivity tasks, rather than depending on Windows or Macintosh systems, accelerates learning by working with Linux tools on a daily basis. Systems administrators do far more than manage servers; they are often called upon to assist users with configuration issues, recommend new software, and update documentation among other tasks.

Most Linux distributions allow users to download a “desktop” installation package that can be loaded onto a USB key. This is one of the first things aspiring system administrators should do; download a major distribution and load it onto an old PC. This process is fairly straightforward, and tutorials are available online. The Linux desktop should be familiar to anyone who has used a PC or Macintosh with icons to select different programs and a “settings” application to configure things like user accounts, WiFi networks, and input devices. After familiarizing oneself with the Linux Graphical User Interface (GUI), or desktop, the next step is learning how to perform tasks from the command line.

## 3.1.1 Getting to the Command Line

The command line interface (CLI) is a simple text input system for entering anything from single-word commands to complicated scripts. Most operating systems have a CLI that provides a direct way of accessing and controlling the computer.

two common ways of accessing the command line

- **GUI based terminal** : a program within the GUI environment that emulates a terminal window. GUI terminals can be accessed through the menu system. For example, on a CentOS machine, you could click on **Applications** on the menu bar, then **System Tools** > and, finally, **Terminal**. If you have a search tools, you can search for **terminal**, as shown here.

  ![A screenshot of using the search function of Ubuntu to find a terminal application.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_3_1.png)

- **virtual terminal** : can be run at the same time as a GUI but requires the user to log in via the virtual terminal before they can execute commands (as they would before accessing the GUI interface).

Each Linux desktop distribution is slightly different, but the application **terminal** or **x-term** will open a terminal window from the GUI. While there are subtle differences between the terms console and terminal window sessions, they are all the same from an administrators standpoint and require the same knowledge of commands to use.

Ordinary command line tasks are starting programs, parsing scripts, and editing text files used for system or application configuration. Most servers boot directly to a terminal, as a GUI can be resource intensive and is generally not needed to perform server-based operations.‌⁠

## 3.2 Applications

The **kernel** of the operating system is like an air traffic controller at an airport, and the applications are the airplanes under its control. 

- The kernel decides which program gets which blocks of memory
- it starts and kills applications
-  and it handles displaying text or graphics on a monitor.

Applications make requests to the kernel and in return receive resources, such as memory, CPU, and disk space. If two applications request the same resource, the kernel decides which one gets it, and in some cases, kills off another application to save the rest of the system and prevent a crash.

The kernel also abstracts some complicated details away from the application. (eg. the application doesn’t know if a block of disk storage is on a solid-state drive, a spinning metal hard disk, or even a network file share. Applications need only follow the kernel’s Application Programming Interface (API) and therefore don’t have to worry about the implementation details) Each application behaves as if it has a large block of memory on the system; the kernel maintains this illusion by remapping smaller blocks of memory, sharing blocks of memory with other applications, or even swapping out untouched blocks to disk.

The kernel also **multitasking** which means the switching of applications. A computer system has a small number of central processing units (CPUs) and a finite amount of memory. The kernel takes care of unloading one task and loading a new one if there is more demand than resources available. When one task has run for a specified amount of time, the CPU pauses it so that another may run. If the computer is doing several tasks at once, the kernel is deciding when to switch focus between tasks. With the tasks rapidly switching, it appears that the computer is doing many things at once.

When we, as users, think of applications, we tend to think of word processors, web browsers, and email clients, however, there are a large variety of application types. The kernel doesn’t differentiate between a user-facing application, a network service that talks to a remote computer, or an internal task. From this, we get an abstraction called a process. A **process** is just one task that is loaded and tracked by the kernel. An application may even need multiple processes to function,  

the kernel takes care of running the processes, starting and stopping them as requested, and handing out system resources.

## 3.2.1 Major Applications

The Linux kernel can run a wide variety of software across many hardware platforms. 

A computer can act as 

- a server, which means it primarily handles data on others’ behalf
- a desktop, which means a user interacts with it directly. 
- The machine can run software or be used as a development machine in the process of creating software. 
- A machine can even adopt multiple roles as Linux makes no distinction; it’s merely a matter of configuring which applications run.

One resulting advantage is that Linux can simulate almost all aspects of a production environment, from development to testing, to verification on scaled-down hardware, which saves costs and time. A Linux administrator could run the same server applications on a desktop or inexpensive virtual server that are run by large internet service providers. Of course, a desktop would not be able to handle the same volume as a major provider would, but almost any configuration can be simulated without needing powerful hardware or server licensing.

Linux software generally falls into one of three categories:

- Server Applications

  Software that has no direct interaction with the monitor and keyboard of the machine it runs on. Its purpose is to serve information to other computers, called clients. Sometimes server applications may not talk to other computers but only sit there and crunch data.

- Desktop Applications

  Web browsers, text editors, music players, or other applications with which users interact directly. In many cases, such as a web browser, the application is talking to a server on the other end and interpreting the data. This is the “client” side of a client/server application.

- Tools

  A loose category of software that exists to make it easier to manage computer systems. Tools can help configure displays, provide a Linux shell that users type commands into, or even more sophisticated tools, called compilers, that convert source code to application programs that the computer can execute.

availability of applications varies depending on the distribution. Often application vendors choose a subset of distributions to support. Different distributions have different versions of key libraries, and it is difficult for a company to support all these different versions. Some applications, however, like Firefox and LibreOffice are widely supported and available for all major distributions.

The Linux community has come up with lots of creative solutions for both desktop and server applications. These applications, many of which make up the backbone of the Internet, are critical to understanding, and utilizing the power of Linux.

Most computing tasks can be accomplished by any number of applications in Linux. There are many web browsers, web servers, database servers, and text editors from which to choose. Evaluating application software is an important skill to be learned by the aspiring Linux administrator. Determining requirements for performance, stability, and cost are just some of the considerations needed for a comprehensive analysis.

## 3.2.2 Server Applications

Linux excels at running server applications because of its reliability and efficiency. The ability to optimize server operating systems with just needed components allows administrators to do more with less, a feature loved by startups and large enterprises alike.

## 3.2.2.1 Web Servers

A web server hosts content for web pages, which are viewed by a web browser using the **HyperText Transfer Protocol (HTTP)** or its encrypted flavor, **HTTPS**. The web page itself can either be static or dynamic. When the web browser requests a **static** page, the web server sends the file as it appears on disk. In the case of a **dynamic** site, the request is sent by the web server to an application, which generates the content. (eg WordPres. Users can develop content through their browser in the WordPress application, and the software turns it into a fully functional dynamic website.

- **Apache** is the dominant web server in use today. Apache was originally a standalone project, but the group has since formed the **Apache Software Foundation** and maintains over a hundred open source software projects. - **Apache HTTPD** is the **daemon**, or server application program, that “serves” web page requests.
- **NGINX**, which is based out of Russia. It focuses on performance by making use of more modern UNIX kernels and only does a subset of what Apache can do. Over 65% of websites are powered by either NGINX or Apache.

## 3.2.2.2 Private Cloud Servers

As individuals, organizations, and companies start to move their data to the cloud, there is a growing demand for private cloud server software that can be deployed and administered internally.

The **ownCloud** project was launched in 2010 by Frank Karlitschek to provide software to store, sync and share data from private cloud servers. It is available in a standard open source GNU AGPLv3 license and an enterprise version that carries a commercial license.

The **Nextcloud** project was forked from ownCloud in 2016 by Karlitschek and has been growing steadily since then. It is provided under a GNU AGPLv3 and aims for “an open, transparent development process.”

Both projects focus on providing private cloud software that meets the needs of both large and small organizations that require security, privacy, and regulatory compliance. While several other projects aim to serve the same users, these two are by far the largest in terms of both deployment and project members.



## 3.2.2.3 Database Servers

Database server applications form the backbone of most online services. Dynamic web applications pull data from and write data to these applications. For example, a web program for tracking online students might consist of a front-end server that presents a web form. When data is entered into the form, it is written to a database application such as **MariaDB**. When instructors need to access student information, the web application queries the database and returns the results through the web application.

MariaDB is a community-developed fork of the **MySQL** relational database management system. It is just one of many database servers used for web development as different requirements dictate the best application for the required tasks.

A database stores information and also allows for easy retrieval and querying. Some other popular databases are **Firebird** and **PostgreSQL**. You might enter raw sales figures into the database and then use a language called **Structured Query Language (SQL)** to aggregate sales by product and date to produce a report.

## 3.2.2.4 Email Servers

Email has always been a widespread use for Linux servers. When discussing email servers, it is always helpful to look at the 3 different tasks required to get email between people:

- Mail Transfer Agent (MTA)

  The most well known MTA (software that is used to transfer electronic messages to other systems) is **Sendmail**. **Postfix** is another popular one and aims to be simpler and more secure than Sendmail.

- Mail Delivery Agent (MDA)

  Also called the **Local Delivery Agent**, it takes care of storing the email in the user’s mailbox. Usually invoked from the final MTA in the chain.

- POP/IMAP Server

  The **Post Office Protocol (POP)** and **Internet Message Access Protocol (IMAP)** are two communication protocols that let an email client running on your computer talk to a remote server to pick up the email.

**Dovecot** is a popular POP/IMAP server owing to its ease of use and low maintenance. **Cyrus IMAP** is another option. Some POP/IMAP servers implement their own mail database format for performance and include the MDA if the custom database is desired. People using standard file formats (such as all the emails in one text file) can choose any MDA.

There are several significant differences between the closed source and open source software worlds, one being that of inclusion of other projects as components to a project or package.In the closed source world, **Microsoft Exchange** is shipped primarily as a software package/suite that includes all the necessary or approved components, all from Microsoft, so there are few if any options to make individual selections. In the open source world, many options can be modularly included or swapped out for package components, and indeed some software packages or suites are just a well-packaged set of otherwise individual components all harmoniously working together.



## 3.2.2.5 File Sharing

- **Samba** is the clear winner for Windows-centric file sharing, . Samba allows a Linux machine to look and behave like a Windows machine so that it can share files and participate in a Windows domain. Samba implements the server components, such as making files available for sharing and certain Windows server roles, and also the client end so that a Linux machine may consume a Windows file share.
- The **Netatalk** project lets a Linux machine perform as an Apple Macintosh file server. The native file sharing protocol for UNIX/Linux is called the **Network File System (NFS)**. NFS is usually part of the kernel which means that a remote file system can be mounted (made accessible) just like a regular disk, making file access transparent to other applications.

As a computer network becomes more substantial, the need for a directory increases. One of the oldest network directory systems is the **Domain Name System (DNS)**. It is used to convert a name like https://www.icann.org/ to an IP address like 192.0.43.7, which is a unique identifier of a computer on the Internet. DNS also holds global information like the address of the MTA for a given domain name. An organization may want to run their own DNS server to host their public-facing names, and also to serve as an internal directory of services. The **Internet Software Consortium** maintains the most popular DNS server, simply called bind after the name of the process that runs the service.

The DNS is focused mainly on computer names and IP addresses and is not easily searchable. Other directories have sprung up to store information such as user accounts and security roles. The **Lightweight Directory Access Protocol (LDAP)** is one common directory system which also powers Microsoft’s Active Directory. In LDAP, an object is stored in a tree, and the position of that object on the tree can be used to derive information about the object and what it stores. For example, a Linux administrator may be stored in a branch of the tree called “IT Department,” which is under a branch called “Operations.” Thus one can find all the technical staff by searching under the “IT Department” branch. **OpenLDAP** is the dominant program used in Linux infrastructure.

One final piece of network infrastructure to discuss here is called the **Dynamic Host Configuration Protocol (DHCP)**. When a computer boots up, it needs an IP address for the local network so it can be uniquely identified. DHCP’s job is to listen for requests and to assign a free address from the DHCP pool. The Internet Software Consortium also maintains the **ISC DHCP** server, which is the most common open source DHCP server.



## 3.2.3 Desktop Applications

The Linux ecosystem has a wide variety of desktop applications. There are games, productivity applications, creative tools, web browsers and more.



## 3.2.3.1 Email

The Mozilla Foundation came out with **Thunderbird**, a full-featured desktop email client. Thunderbird connects to a POP or IMAP server, displays email locally, and sends email through an external SMTP server.

Other notable email clients are **Evolution** and **KMail** which are the GNOME and KDE projects' email clients. Standardization through POP and IMAP and local email formats means that it’s easy to switch between email clients without losing data.

## 3.2.3.2 Creative

For the creative types, there is **Blender**, **GIMP (GNU Image Manipulation Program)**, and **Audacity** which handle 3D movie creation, 2D image manipulation, and audio editing respectively. They have had various degrees of success in professional markets. Blender is used for everything from independent films to Hollywood movies, for example. GIMP supports high-quality photo manipulation, original artwork creation, graphic design elements, and is extensible through scripting in multiple languages. Audacity is a free and open source audio editing tool that is available on multiple operating systems.



## 3.2.3.3 Productivity

Use of common open source applications in presentations and projects is one way to strengthen Linux skills. The basic productivity applications, such as a word processor, spreadsheet, and presentation package are valuable assets. 

**LibreOffice** is a fork of the **OpenOffice** (sometimes called **OpenOffice.org**) application suite. Both offer a full office suite, including tools that strive for compatibility with Microsoft Office in both features and file formats.





## 3.2.3.4 Web Browsers

Linux is a first class citizen for the **Mozilla Firefox** and **Google Chrome** browsers. Both are open source web browsers that are fast, feature-rich, and have excellent support for web developers. These packages are an excellent example of how competition helps to drive open source development – improvements made to one browser spur the development of the other browser. As a result, the Internet has two excellent browsers that push the limits of what can be done on the web, and work across a variety of platforms. Using a browser, while second nature for many, can lead to privacy concerns. By understanding and modifying the configuration options, one can limit the amount of information they share while searching the web and saving content.



## 3.3 Console Tools

Historically, the development of UNIX shows considerable overlap between the skills of software development and systems administration. The tools for managing systems have features of computer languages such as loops (which allow commands to be carried out repeatedly), and some computer programming languages are used extensively in automating systems administration tasks. Thus, one should consider these skills complementary, and at least a basic familiarity with programming is required for competent systems administrators.

## 3.3.1 Shells

At the basic level, users interact with a Linux system through a shell whether connecting to the system remotely or from an attached keyboard. The **shell**’s job is to accept commands (like file manipulations and starting applications) and to pass those to the Linux **kernel** for execution. ‌⁠⁠  The Linux shell provides a rich language for iterating over files and customizing the environment, all without leaving the shell. eg. it is possible to write a single command line that finds files with contents matching a specific pattern, extracts useful information from the file, then copies the new information to a new file.

Linux offers a variety of shells to choose from, mostly differing in how and what can be customized, and the syntax of the built-in scripting language. The two main families are 

- **Bourne shell** was named after its creator Stephen Bourne of Bell Labs. 
- **C shell** was so named because its syntax borrows heavily from the C language. As both these shells were invented in the 1970s, there are more modern versions, the **Bourne Again Shell (Bash)** and the **tcsh** (pronounced as tee-cee-shell). Bash is the default shell on most systems, though tcsh is also typically available.

Programmers have taken favorite features from Bash and tcsh and made other shells, such as the **Korn shell (ksh)** and the **Z shell (zsh)**. The choice of shells is mostly a personal one; users who are comfortable with Bash can operate effectively on most Linux systems. Other shells may offer features that increase productivity in specific use cases.

## 3.3.2 Text Editors

Most Linux systems provide a choice of text editors which are commonly used at the console to edit configuration files. The two main applications are **Vi** (or the more modern **Vim**) and **Emacs**. Both are remarkably powerful tools to edit text files; they differ in the format of the commands and how plugins are written for them. Plugins can be anything from syntax highlighting of software projects to integrated calendars.

Both Vi and Emacs are complex and have a steep learning curve, which is not helpful for simple editing of a small text file. Therefore, **Pico** and **Nano** are available on most systems and provide very basic text editing.

> **Consider This**
>
> The Nano editor was developed as a completely open source editor that is loosely based on Pico, as the license for Pico is not an open source license and forbids making changes and distributing it.
>
> While Nano is simple and easy to use, it doesn’t offer the extensive suite of more advanced editing and key binding features that an editor like Vi does. Administrators should strive to gain some basic familiarity with Vi, though, because it is available on almost every Linux system in existence. When restoring a broken Linux system by running in the distribution’s recovery mode, Vi can be a critical tool, and the best time to learn Vim or any editor is before you desperately need it to fix a broken system.

## 3.4 Package Management

Every Linux system needs to add, remove, and update software.

 In the past this meant downloading the source code, setting it up, compiling it, and copying files onto each system that required updating.

Thankfully, modern distributions use packages, which are compressed files that bundle up an application and its dependencies (or required files), greatly simplifying the installation by making the right directories, copying the proper files into them, and creating such needed items as symbolic links.

A **package manager** takes care of keeping track of which files belong to which package and even downloading updates from repositories, typically a remote server sharing out the appropriate updates for a distribution. In Linux, there are many different software package management systems, but the two most popular are those from Debian and Red Hat.



## 3.4.1 Debian Package Management

The Debian distribution, and its derivatives such as Ubuntu and Mint, use the **Debian package management system**. At the heart of Debian package management are software packages that are distributed as files ending in the `.deb` extension.

The lowest-level tool for managing these files is the `dpkg` command. This command can be tricky for novice Linux users, so the **Advanced Package Tool**, `apt-get` (a front-end program to the `dpkg` tool), makes management of packages easier. Additional command line tools which serve as front-ends to `dpkg` include `aptitude` and GUI front-ends like **Synaptic** and **Software Center**.



## 3.4.2 RPM Package Management

The **Linux Standards Base**, which is a **Linux Foundation** project, is designed to specify (through a consensus) a set of standards that increase the compatibility between conforming Linux systems. According to the Linux Standards Base, the standard package management system is RPM.

RPM makes use of an `.rpm` file for each software package. This system is what distributions derived from Red Hat, including Centos and Fedora, use to manage software. Several other distributions that are not Red Hat derived, such as SUSE, OpenSUSE, and Arch, also use RPM.

‌⁠⁠ Like the Debian system, RPM Package Management systems track dependencies between packages. Tracking dependencies ensures that 

- when a package is installed, the system also installs packages needed by that package to function correctly. 
- software updates and removals are performed properly.

The back-end tool most commonly used for RPM Package Management is the `rpm` command. While the `rpm` command can install, update, query and remove packages, the command line front-end tools such as `yum` and `up2date` automate the process of resolving dependency issues.

> **Note**
>
> A back-end program or application either interacts directly with a front-end program or is "called" by an intermediate program. Back end programs would not interact directly with the user. Basically, there are programs that interact with people (front-end) and programs that interact with other programs (back-end).

There are also GUI-based front-end tools such as **Yumex** and **Gnome PackageKit** that also make RPM package management easier.

Some RPM-based distributions have implemented the **ZYpp** (or **libzypp**) package management style, mostly openSUSE and SUSE Linux Enterprise, but mobile distributions MeeGo, Tizen and Sailfish as well.

The `zypper` command is the basis of the ZYpp method, and it features short and long English commands to perform functions, such as `zypper in packagename` which installs a package including any needed dependencies.

Most of the commands associated with package management require root privileges. The rule of thumb is that if a command affects the state of a package, administrative access is required. In other words, a regular user can perform a query or a search, but to add, update or remove a package requires the command to be executed as the root user.



## 3.5 Development Languages

It should come as no surprise that as software built on contributions from programmers, Linux has excellent support for software development. The shells are built to be programmable, and there are powerful editors included on every system. There are also many development tools available, and many modern programming languages treat Linux as a first-class citizen.

Computer programming languages provide a way for a programmer to enter instructions in a more human readable format, and for those instructions to eventually become translated into something the computer understands. Languages fall into one of two camps: 

- An interpreted language translates the written code into computer code as the program runs
- a compiled language is translated all at once.

Linux itself was written in a compiled language called **C**. The main benefit of C is that the language itself maps closely to the generated machine code so that a skilled programmer can write code that is small and efficient. When computer memory was measured in kilobytes, this was very important. Even with large memory sizes today, C is still helpful for writing code that must run fast, such as an operating system.

- **C++**, which adds object support to C (a different style of programming), 
- **Objective C** that took another direction and is in heavy use in Apple products.
- **Java** language puts a different spin on the compiled approach. Instead of compiling to machine code, Java first imagines a hypothetical CPU called the **Java Virtual Machine (JVM)** and then compiles all the code to that. Each host computer then runs JVM software to translate the JVM instructions (called bytecode) into native instructions.

The additional translation with Java might make you think it would be slow. However, the JVM is relatively simple so it can be implemented quickly and reliably on anything from a powerful computer to a low power device that connects to a television. A compiled Java file can also be run on any computer implementing the JVM!

Another benefit of compiling to an intermediate target is that the JVM can provide services to the application that usually wouldn’t be available on a CPU. Allocating memory to a program is a complex problem, but it’s built into the JVM. As a result, JVM makers can focus their improvements on the JVM as a whole, so any progress they make is instantly available to applications.

**Interpreted languages**, on the other hand, are translated to machine code as they execute. The extra computer power spent doing this can often be recouped by the increased productivity the programmer gains by not having to stop working to compile. Interpreted languages also tend to offer more features than compiled languages, meaning that often less code is needed. The language interpreter itself is usually written in another language such as C, and sometimes even Java! This means that an interpreted language is being run on the JVM, which is translated at runtime into actual machine code.

- **JavaScript** is a high-level interpreted programming language that is one of the core technologies on the world wide web. It is similar to but fundamentally different from Java, which is a completely object-oriented programming language owned by Oracle. JavaScript is a cross-platform scripting language for adding interactive elements to web pages, that is in wide use across the internet. By using JavaScript libraries, web programmers can add everything from simple animations to complex server-side applications for internet users. JavaScript is continuously evolving to meet the functionality and security needs of internet users and is capable of being released under a GNU GPL License.

> **Consider This**
>
> The term object-oriented refers to programing that abstracts complex actions and processes so that the end user only deals with basic tasks. To visualize this concept, think of a machine that performs a complex set of tasks by simply pushing a button.

- **Perl** is an interpreted language. Perl was originally developed to perform text manipulation. Over the years, it gained favor with systems administrators and continues to be improved and used in everything from automation to building web applications.

- **PHP** is a language that was initially built to create dynamic web pages. A PHP file is read by a web server such as Apache. Special tags in the file indicate that parts of the code should be interpreted as instructions. The web server pulls all the different parts of the file together and sends it to the web browser. PHP’s main advantages are that it is easy to learn and available on almost any system. Because of this, many popular projects are built on PHP. Notable examples include WordPress (for blogging), cacti (for monitoring), and even parts of Facebook.

- **Ruby** is another language that was influenced by Perl and Shell, along with many other languages. It makes complex programming tasks relatively easy, and with the inclusion of the Ruby on Rails framework, is a popular choice for building complex web applications. Ruby is also the language that powers many of the leading automation tools like **Chef** and **Puppet**, which make managing a large number of Linux systems much simpler.

- **Python** is another scripting language that is in general use. Much like Ruby it makes complex tasks easier and has a framework called **Django** that makes building web applications very easy. Python has excellent statistical processing abilities and is a favorite in academia.

A computer programming language is just a tool that makes it easier to tell the computer what you want it to do. A **library** bundles common tasks into a distinct package that can be used by the developer. 

- **ImageMagick** is one such library that lets programmers manipulate images in code. ImageMagick also ships with some command line tools that enable programmers to process images from a shell and take advantage of the scripting capabilities there.

- **OpenSSL** is a cryptographic library that is used in everything from web servers to the command line. It provides a standard interface for adding cryptography into a Perl script, for example.

- At a much lower level is the **C library**. The C library provides a basic set of functions for reading and writing to files and displays, and is used by applications and other languages alike.

## 3.6 Security

**Cookies** are the primary mechanism that websites use to track you. Sometimes this tracking is good, such as to keep track of what is in your shopping cart or to keep you logged in when you return to the site.

As you browse the web, a web server can send back the cookie, which is a small piece of text, along with the web page. Your browser stores this information and sends it back with every request to the same site. Cookies are normally only sent back to the site they originated from, so a cookie from example.com wouldn’t be sent to example.org.

However, many sites have embedded scripts that come from third parties, such as a banner advertisement or Google analytics pixel. If both example.com and example.org have a tracking pixel, such as one from an advertiser, then that same cookie will be sent when browsing both sites. The advertiser then knows that you have visited both example.com and example.org.

With a broad enough reach, such as placement on social network sites with “Like” buttons and such, a website can gain an understanding of which websites you frequent and figure out your interests and demographics.

There are various strategies for dealing with this. One is to ignore it. The other is to limit the tracking pixels you accept, either by blocking them entirely or clearing them out periodically.

Browsers typically offer cookie-related settings; users can opt to have the browser tell the site not to track. This voluntary tag is sent in the request, and some sites will honor it. The browser can also be set never to remember third-party cookies and remove regular cookies (such as from the site you are browsing) after being closed.

Tweaking privacy settings can make you more anonymous on the Internet, but it can also cause problems with some sites that depend on third-party cookies. If this happens, you might have to explicitly permit some cookies to be saved.

Browsers also offer a private or incognito mode where cookies and tracking pixels are deleted upon exiting the window. This mode can be helpful if you would like to search for something without letting other websites know what you are looking for.



## 3.6.1 Password Issues

Good password management is essential to security in any computing environment. The Linux systems administrator is often the person responsible for setting and enforcing password policies for users at all levels. The most privileged user on any Linux system is **root**; this account is the primary administrator and is created when the operating system is installed. Often administrators will disable root access as the first line of defense against intrusion since computer hackers will try to gain root access in order to take control of the system.

There are many levels of access and various means of password management on a Linux system. When users are created, they are given different login permissions depending on what groups they are assigned to. For example, administrators can create and manage users while regular users cannot. Services that run on systems such as databases can also have login permissions with their own passwords and privileges. Additionally, there are specific passwords for accessing systems remotely through SSH, FTP, or other management programs.

Managing all these accounts, and their accompanying passwords is a complicated and necessary part of the systems administrator role. Passwords need to be complex enough not to be easily guessed by hackers, yet easy to remember for users. 

Increasingly users and administrators are turning to password manager programs to store login credentials in encrypted form. Another trend is two-factor authentication (2FA), a technique where a password is supplemented by a second “factor,” often a passcode sent to the user's phone or other devices. Keeping up with current security trends, while ensuring authorized users' ease of access, is an ongoing challenge that must be met.



## 3.6.2 Protecting Yourself

 you should protect your computer from accepting incoming connections. A firewall is a device that filters network traffic, and Linux has one built-in. If you are using Ubuntu, then the **Gufw** is a graphical interface to **Ubuntu’s Uncomplicated Firewall (UFW)**.

![A screenshot showing a terminal that has been used to execute the gufw command, which launches a graphical interface for the Ubuntu Uncomplicated Firewall. The firewall window provides a slider button to change the firewall status, and drop down menus to change the Profile, and whether to allow or deny both incoming and outgoing traffic.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_3_5.png)

Under the hood, you are using **iptables**, which is the built-in firewall system. Instead of entering complicated iptables commands you use a GUI. While this GUI lets you build an effective policy for a desktop, it barely scratches the surface of what iptables can do.



## 3.6.3 Privacy Tools

The use of modern privacy tools, both at the server and user level, can help prevent system intrusions and unauthorized access to data.

The good news is that Linux is by default one of the most secure operating systems ever created. Many of the exploits that plague other operating systems simply won’t work on Linux due to the underlying architecture. However, there are still many known weaknesses that hackers can take advantage of so the proactive systems administrator is wise to deploy privacy tools that protect their users as well as the systems they use.

**Encryption** is probably the best-known and most widely-deployed privacy tool in use today. Administrators deploy encryption with authentication keys on almost every system that communicates with the outside world. One well-known example is the **HyperText Transfer Protocol Secure (HTTPS)** standard used on web servers to ensure that data transmitted between users and online resources cannot be intercepted as it travels on the open Internet.

**Virtual private networks (VPN)** have been in use by companies to connect their remote servers and employees for many years. Now they are gaining popularity amongst ordinary users looking to protect their privacy online. They work by creating an encrypted channel of communication between two systems, so the data transmitted between them is scrambled by an algorithm only the systems know.

The **Tor** project has long been involved in creating privacy tools like it’s **Tor Browser** that works by relaying internet requests through a network of servers that prevents websites and others from learning the identity of the person making the request.



## 3.7 The Cloud

No doubt you’ve heard of the cloud. Whether you’re using Google Docs for your homework or storing music and photos on iCloud, you probably have at least some of your digital content hosted on a cloud server somewhere.

Cloud computing has revolutionized the way we access technology. As Internet connectivity and speeds have increased, it’s become easier to move computing resources to remote locations where content can be accessed, manipulated and shared around the globe. Organizations are increasingly looking at the cloud as essential to their businesses and operations. The migration of an organization's IT applications and processes to cloud services, known as **cloud adoption**, is rapidly becoming a strategic business decision for many. With cloud adoption rising significantly all over the globe, cloud computing is not the catchphrase that it once was. Cloud computing is seen as one of the major disruptive technologies of the coming decade which will significantly transform businesses, economies, and lives globally.

Physically, a cloud can be described as computing resources from one or many off-site data centers which can be accessed over the internet. The cloud builds on the benefits of a data center and provides computing solutions to organizations who need to store and process data, and it allows them to delegate management of IT infrastructure to a third-party. The data and resources that organizations store in the cloud can include data, servers, storage, application hosting, analytics and a myriad of other services.

A cloud deployment model provides a basis for how cloud infrastructure is built, managed, and accessed. There are four primary cloud deployment models:

- **Public Cloud**: A public cloud is a cloud infrastructure deployed by a provider to offer cloud services to the general public and organizations over the Internet. In the public cloud model, there may be multiple tenants (consumers) who share common cloud resources. More than likely, many of us have accessed public cloud resources at some point through providers such as Amazon, Google, and other popular public cloud providers.
- **Private Cloud**: A private cloud is a cloud infrastructure that is set up for the sole use of a particular organization. When compared to a public cloud, a private cloud offers organizations a greater degree of privacy, and control over the cloud infrastructure, applications, and data. It can be hosted either on servers managed by the company that is using it or through a managed private cloud provider such as Rackspace or IBM.
- **Community Cloud**: A community cloud is a cloud infrastructure that is set up for the sole use by a group of organizations with common goals or requirements. The organizations participating in the community typically share the cost of the community cloud service. This option may be more expensive than the public cloud; however, it may offer a higher level of control and protection against external threats than a public cloud.
- **Hybrid Cloud**: A hybrid cloud is composed of two or more individual clouds, each of which can be a private, community, or public cloud. A hybrid cloud may change over time as component clouds join and leave. The use of such technology enables data and application portability. It also allows companies to leverage outside resources while retaining control of sensitive resources.



## 3.7.1 Linux in the Cloud

Linux plays a pivotal role in cloud computing. It powers 90% of the public cloud workload, most virtual servers are based on some version of the Linux kernel, and Linux is often used to host the applications behind cloud computing services. So what makes Linux uniquely suited to enabling cloud computing?

**Flexibility**

Cloud computing provides the capability to provision IT resources quickly and at any time. This agility enables rapid development and experimentation that, in turn, facilitates innovation which is essential for research and development, the discovery of new markets and revenue opportunities, creating new customer segments, and the development of new products.

As a result, cloud computing must compensate for the fact that each organization has a unique, evolving set of resource requirements.

Linux stands out here because it is highly adaptable. For starters, Linux is modular by design, and at the center of an enormous ecosystem of open source applications providing endless configuration options to suit various systems and use cases. On top of that, Linux scales efficiently, allowing it to run anything from a tiny remote sensor to an entire server farm.

**Accessibility**

In a traditional environment, IT resources are accessed from dedicated devices, such as a desktop or a laptop. In cloud computing, applications and data reside centrally and are accessed from anywhere over a network from any device, such as desktop, mobile, or thin client, and there is a version of Linux for every single one of these devices.

**Cost-Effective**

Cloud computing is attractive as it has the potential for consumers to reduce their IT costs. In cloud computing, consumers can unilaterally and automatically scale IT resources to meet workload demand, thereby eliminating overhead from underutilized resources. Additionally, the expenses associated with IT configuration, management, floor space, power, and cooling are reduced.

Cloud providers absorb these infrastructure costs but must remain a low-cost alternative. Choosing Linux is one of the most cost-effective solutions providers can deploy. Linux is one of the most power efficient operating systems, and the Linux kernel is completely free, as are many associated applications, utilities, and additional software components.

Enterprise and government organizations can opt to pay for commercially-supported distributions, which are still more cost-effective when compared to licensed competitors. Non-commercial distributions that support cloud computing also are a viable option for many organizations.

Not only can vendors pass these savings onto the customers, offering Linux-based solutions can be cheaper for the client to implement. Setting up Linux on their own systems eliminates expensive user licensing fees potentially associated with competing operating systems.

**Manageability**

While Linux began as a niche operating system, its widespread presence in the IT industry has made Linux use and administration a necessary skill for IT professionals. It is becoming increasingly easy for cloud vendors and consumers to acquire the necessary talent, or reallocate existing team members.

The nature of Linux, built on the C programming language, also lends itself to automated management tools. A significant portion of Linux servers operating in the cloud are created and managed by automated management programs rather than human operators. This process frees up administrators to monitor computing operations rather than manually configuring and updating systems.

**Security**

When using a cloud solution, especially a public cloud, an organization may have concerns related to privacy, external threats, and lack of control over the IT resources and data.

Linux can help offset these issues because it is one of the most secure and reliable operating systems available. Linux is open source, meaning its source code is available for anyone to obtain, review, and modify. This also means the code can be inspected for vulnerabilities and compatibility issues, resulting in an extensive community effort to rectify these issues and uphold the robust reputation of Linux.

**Virtualization**

Virtualization is one of the most significant advancements that has contributed to the enablement cloud of computing.

Linux is a **multi-user operating system**, which means that many different users can work on the same system simultaneously and for the most part can’t do things to harm other users. However, this does have limitations – users can hog disk space or take up too much memory or CPU resources and make the system slow for everyone. Sharing the system in multi-user mode also requires that everyone run as unprivileged users, so letting each user run their own web server, for example, is challenging.

Virtualization is the process where one physical computer, called the host, runs multiple copies of an operating system, each copy called a **guest**. These guest images can be pre-configured for specific functions to allow rapid deployment, often automatically, when needed. The host system runs software called a **hypervisor** that switches resources between the various guests just like the Linux kernel does for individual processes. With bare metal hypervisors, the hypervisor runs directly on computer hardware rather than on top of an OS freeing up more resources for guest images.

Virtualization works because servers spend most of their time idling and don’t need physical resources such as a monitor and keyboard. With software from companies like **VMWare** and **Openbox**, you can now take a powerful CPU and by using it to run multiple virtual machines administrators can optimize usage of physical resources and dramatically reduce costs over the previous one-machine, one-OS data center model. The main limitation is usually memory, however, with advances in hypervisor technology and CPUs, it is possible to put more virtual machines on one host than ever.

In a virtualized environment one host can run dozens of guest operating systems, and with support from the CPU itself, the guests don’t even know they are running on a virtual machine. Each guest gets its own virtual resources and communicates with the network on its own. It is not even necessary to run the same operating system on all the guests, which further reduces the number of physical servers needed.

Virtualization offers a way for an enterprise to lower power usage and reduce data center space over an equivalent fleet of physical servers. Guests are now just software configurations, so it is easy to spin up a new machine for testing and destroy it when its usefulness has passed.

Since it is possible to run multiple instances of an operating system on one physical machine and connect to it over the network, the location of the machine doesn’t matter. Cloud computing takes this approach and allows administrators to have virtual machines in a remote data center owned by another company, and only pay for the resources used. Cloud computing vendors can take advantage of scales of economy to offer computing resources at far lower prices than operating an on-site data center.

**Containers and Bare Metal Deployments**

With the rise of containerization technologies like **Docker** and **Kubernetes** application software is now being written that runs in a serverless environment. Essentially, programmers are creating software that does one single function of a system (like database processing or storage) that runs in a container. These **containers** are organized in **pods** that run within a **node** and can talk with each other, and the outside world if needed. Nodes, in turn, are organized and controlled by a **master node** that provides services to each component within the structure. Building applications in this way decouples each of the components from the others, and from the overhead of running an OS. Since each piece of the puzzle can be automatically destroyed and recreated by the master node they no longer need to be as robust as software that runs on top of an OS. Although these new programming architectures are in many ways bypassing the need for a traditional OS the underlying technology that makes them work is still Linux. So, working in Linux will increasingly be working within a development team that draws on the disciplines of programming, database design, networking, and systems administration to create the systems of the future.



# Chapter 4 - Open Source Software and Licensing



## 4.1 Introduction

Software projects take the form of **source code**, which is a human-readable set of computer instructions. Since source code is not understood directly by the computer, it must be compiled into machine instructions by a compiler. The **compiler** is a special program that gathers all of the source code files and generates instructions that can be run on the computer, such as by the Linux kernel.

Historically, commercial software has been sold under a **closed source license**, meaning that users have the right to use the machine code, also known as the binary or executable, but cannot see the source code. Often the license explicitly states that users may not attempt to reverse engineer the machine code back to source code to figure out what it does.

**Consider This**

Source code compiled into binary programs is one method of creating programs and running computing instructions. Another is the many types of **interpreted languages**, such as PERL, Python and even BASH scripting, where the code is not compiled, but fed to an **interpreting program**, typically a binary executable that understands and implements the instructions contained in the source code or scripts.

The development of Linux closely parallels the rise of open source software. Early on there was shareware, freely available programs where users did not necessarily have access to the source code. There were a lot of good things about this, but it was also problematic because malicious programs could be disguised as innocent-looking games, screensavers, and utilities.

Open source takes a source-centric view of software. The open source philosophy is that users have the right to obtain the software source code, and to expand and modify programs for their own use. This also meant the code could be inspected for backdoors, viruses, and spyware. By creating a community of developers and users, accountability for bugs, security vulnerabilities, and compatibility issues became a shared responsibility. This new, global community of computer enthusiasts was empowered by the growing availability of faster internet services and the world wide web.

There are many different variants of open source, but all agree that users should have access to the source code. Where they differ is in how one can, or must, redistribute changes.

Linux has adopted this philosophy to great success. Since Linux was written in the C programming language, and it mirrored the design and functionality of already established UNIX systems, it naturally became a forum where people could develop and share new ideas. Freed from the constraints of proprietary hardware and software platforms, large numbers of very skilled programmers have been able to contribute to the various distributions, making for software that is often more robust, stable, adaptable, and, frankly, better than the proprietary, closed source offerings which dominated the previous decades.

Large organizations were understandably suspicious about using software built in this new way, but over time they realized their best programmers were working on Linux-based open source projects in their spare time. Soon, Linux servers and open source programs began to outperform the expensive, proprietary systems already in place. When it came time to upgrade outdated hardware the same programmers, engineers, and system administrators who had started working on Linux as a hobby were able to convince their bosses to give Linux a try. The rest is, as they say, history.

Before the development of Linux, many corporate and scientific applications ran on proprietary UNIX systems. Companies, universities, and governments that run large server farms liked the stability and relative ease of application development these platforms offered.

**UNIX** was initially created in 1969. By its fourth edition, in 1973, it had been rewritten in the C programming language that is still prominent today. In 1984 the University of California Berkeley released 4.2BSD which introduced TCP/IP, the networking specification that underpins the Internet. By the early 1990’s, when Linux development started, different companies developing UNIX operating systems realized their systems needed to be compatible, and they started working on the X/Open specification that is still used today.

Over the years, computer scientists and the organizations that employ them have realized the benefit of systems that provide familiar tools and consistent ways of accomplishing specific tasks. The standardization of application programming interfaces (APIs) allows programs written for one specific UNIX or Linux operating system to be ported (converted) relatively easy to run on another. So, while proprietary UNIX systems are still in use throughout the world in environments where "certified" solutions are preferred, the interoperability of these systems alongside Linux computers is valued by industry, academia, and governments that use them.

The importance of standards organizations cannot be overstated. Groups like the **IEEE (Institute of Electrical and Electronics Engineers)** and **POSIX (Portable Operating System Interface)**, allow professionals from different companies and institutions to collaborate on specifications that make it possible for different operating systems and programs to work together. It doesn’t matter if a program is closed or open source, simple or complex, if it is written to these standards others will be able to use and modify it in the future. Every innovation in computing is built on the work of others who came before. Open source software is a collaboration of different people with different needs and backgrounds all working together to make something better than any one of them could have made individually. Standards are what makes this possible, and the many organizations that create, maintain and promote them are integral to the industry.



## 4.2 Open Source Licensing

When talking about buying software, there are three distinct components:

- **Ownership** – Who owns the intellectual property behind the software?
- **Money Transfer** – How does money change hands, if at all?
- **Licensing** – What do you get? What can you do with the software? Can you use it on only one computer? Can you give it to someone else?

In most cases, the ownership of the software remains with the person or company that created it. Users are only granted a license to use the software; this is a matter of copyright law. The money transfer depends on the business model of the creator. It’s the **licensing** that differentiates open source software from closed source software.

Two contrasting examples will get things started.

With Microsoft Windows, the Microsoft Corporation owns the intellectual property. The license itself, the **End User License Agreement (EULA)**, is a custom legal document that you must click through, indicating your acceptance, in order to install the software. Microsoft keeps the source code and distributes only binary copies through authorized channels. For most consumer products you are allowed to install the software on one computer and are not allowed to make copies of the disk other than for a backup. You are not allowed to reverse engineer the software. You pay for one copy of the software, which gets you minor updates but not major upgrades.

Linux is owned by Linus Torvalds. He has placed the code under a license called **GNU General Public License version 2 (GPLv2)**. This license, among other things, says that the source code must be made available to anyone who asks and that anyone is allowed to make changes. One caveat to this is that if someone makes changes and distributes them, they must put the changes under the same license so that others can benefit. GPLv2 also says that no one is allowed to charge for distributing the source code other than the actual costs of doing so (such as copying it to removable media).

In general, when someone creates something, they also get the right to decide how it is used and distributed. **Free and Open Source Software (FOSS)** refers to software where this right has been given up; anyone is allowed to view the source code and redistribute it. Linus Torvalds has done that with Linux – even though he created Linux he can’t forbid someone from using it on their computer because he has given up that right through the GPLv2 license.

Software licensing is a political issue, therefore it should come as no surprise that there are many different opinions. Organizations have come up with their own license that embodies their particular views, so it is easier to choose an existing license than come up with your own. For example, universities like the Massachusetts Institute of Technology (MIT) and University of California have come up with licenses, as have projects like the Apache Foundation. Also, groups like the Free Software Foundation have created their own licenses to further their agenda.

## 4.2.1 The Free Software Foundation

Two groups can be considered the most influential forces in the world of open source: the Free Software Foundation and the Open Source Initiative.

Only a few years after the development of the GNU project, Richard Stallman founded the **Free Software Foundation (FSF)** in 1985 with the goal of promoting free software. In this context, the word "free" does not refer to the price, but to the freedom to share, study, and modify the underlying source code. According to their website, the FSF believes that users should have "control over the technology we use in our homes, schools, and businesses".

FSF also advocates that software licenses should enforce the openness of modifications. It is their view that if someone modifies free software that they should be required to share any changes they have made when they share it again. This specific philosophy is called copyleft. According to FSF, "copyleft is a general method for making a program (or other work) free (in the sense of freedom, not "zero price"), and requiring all modified and extended versions of the program to be free as well".

The FSF also advocates against software patents and acts as a watchdog for standards organizations, speaking out when a proposed standard might violate the free software principles by including items like Digital Rights Management (DRM) which restrict what can be done with compliant programs.

The FSF have developed their own set of licenses which are free for anyone to use based on the original **GNU General Public License (GPL)**. FSF currently maintains GNU General Public License version 2 (GPLv2) and version 3 (GPLv3), as well as the GNU Lesser General Public Licenses version 2 (LGPLv2) and version 3 (LGPLv3). These licenses are meant to be included in the actual source code to ensure that all future variants and modifications of the original program continue to have the same freedom of use as the original. The GPL license and its variants are powerful legal tools to advance the cause of free software worldwide. What started off in 1983 as one man’s desire to share and improve software by letting others change it has ended up changing the world.

> **Consider This**
>
> The changes between GPLv2 and GPLv3 largely focused on using free software on a closed hardware device which has been coined Tivoization. TiVo is a company that builds a television digital video recorder on their own hardware and used Linux as the base for their software. While TiVo released the source code to their version of Linux as required under GPLv2, the hardware would not run any modified binaries. In the eyes of the FSF, this went against the spirit of the GPLv2, so they added a specific clause to version 3 of the license. Linus Torvalds agrees with TiVo on this matter and has chosen to stay with GPLv2.

## 4.2.2 The ‌⁠⁠ Open Source Initiative

The **Open Source Initiative (OSI)** was founded in 1998 by Bruce Perens and Eric Raymond. They believed that the Free Software Foundation was too politically charged and that less extreme licenses were necessary, particularly around the copyleft aspects of FSF licenses. OSI believes that not only should the source be freely available, but also that no restrictions should be placed on the use of the software, no matter what the intended use. Unlike the FSF, the OSI does not have its own set of licenses. Instead, the OSI has a set of principles and adds licenses to that list if they meet those principles, called open source licenses. Software that conforms to an Open Source license is, therefore, open source software.

One type of Open Source license is the **BSD (Berkeley Software Distribution)** and its derivatives, which are much simpler than GPL. There are currently two actual "BSD" licenses approved by OSI, a 2-Clause and a 3-Clause. These licenses state that you may redistribute the source and binaries as long as you maintain copyright notices and don’t imply that the original creator endorses your version. In other words "do what you want with this software, just don’t say you wrote it." According to FSF, the original BSD license had a serious flaw in that it required developers to add a clause acknowledging the University of California, Berkeley in every advertisement for software licensed this way. As others copied this simple license, they included acknowledgment for their own institutions which led to over 75 such acknowledgments in some cases.

FSF licenses, such as GPLv2, are also open source licenses. However, many open source licenses such as BSD and MIT do not contain the copyleft provisions and are thus not acceptable to the FSF. These licenses are called permissive free software licenses because they are permissive in how you can redistribute the software. You can take BSD licensed software and include it in a closed software product as long as you give proper attribution.

Rather than dwell over the finer points of Open Source and Free Software, the community has started referring to them collectively as **Free and Open Source Software (FOSS)**. The English word "free" can mean "free as in lunch" (as in no cost) or "free as in speech" (as in no restrictions). This ambiguity led to the inclusion of the word "libre" to refer to the latter definition. Thus, we end up with **Free/Libre/Open Source Software (FLOSS)**https://content.netdevgroup.com/contents/linux-essentials/aGrhXa6xoz/4.2.2)



## 4.2.3 Creative Commons

FOSS licenses are mostly related to software. People have placed works such as drawings and plans under FOSS licenses, but this was not the intent.

When software has been placed in the public domain, the author has relinquished all rights, including the copyright on the work. In some countries, this is the default when the work is done by a government agency. In some countries, copyrighted work becomes public domain after the author has died and a lengthy waiting period has elapsed.

The **Creative Commons (CC)** organization has created the Creative Commons Licenses which try to address the intentions behind FOSS licenses for non-software entities. CC licenses can also be used to restrict commercial use if that is the desire of the copyright holder. The CC licenses are made up of the following set of conditions the creator can apply to their work:

- **Attribution (BY)** – All CC licenses require that the creator must be given credit, without implying that the creator endorses the use.
- **ShareAlike (SA)** – This allows others to copy, distribute, perform, and modify the work, provided they do so under the same terms.
- **NonCommercial (NC)** – This allows others to distribute, display, perform, and modify the work for any purpose other than commercially.
- **NoDerivatives (ND)** – This allows others to distribute, display, and perform only original copies of the work. They must obtain the creator’s permission to modify it.

These conditions are then combined to create the six main licenses offered by Creative Commons:

- **Attribution (CC BY)** – Much like the BSD license, you can use CC BY content for any use but must credit the copyright holder.

- **Attribution ShareAlike (CC BY-SA)** – A copyleft version of the Attribution license. Derived works must be shared under the same license, much like in the Free Software ideals.

- **Attribution NoDerivs (CC BY-ND)** – You may redistribute the content under the same conditions as CC-BY but may not change it.

- **Attribution-NonCommercial (CC BY-NC)** – Just like CC BY, but you may not use it for commercial purposes.

- **Attribution-NonCommercial-ShareAlike (CC BY-NC-SA)** – Builds on the CC BY-NC license but requires that your changes be shared under the same license.

- **Attribution-NonCommercial-NoDerivs (CC BY-NC-ND)** – You are sharing the content to be used for non-commercial purposes, but people may not change the content.

- **No Rights Reserved (CC0)** – This is the Creative Commons version of public domain.

  

## 4.3 Open Source Business Models

If all this software is free, how can anyone make money off of it?

First, you must understand there isn’t anything in the GPL that prohibits selling software. In fact, the right to sell software is part of the GPL license. Again, recall that the word free refers to freedom, not price. Companies that add value to these free programs are encouraged to make as much money as they can, and put those profits back into developing more and better software.

One of the simplest ways to make money is to sell support or warranty around the software. Companies like Canonical, the developer of Ubuntu, and Redhat have grown into huge enterprises by creating Linux distributions and tools that enable commercial users to manage their enterprises and offer products and services to their customers.

Many other open source projects have also expanded into substantial businesses. In the 1990s, Gerald Combs was working at an Internet service provider and started writing his own network analysis tool because similar tools at the time were costly. Over 600 people have now contributed to the project, called Wireshark. It is now often considered better than commercial offerings and led to a company being formed to sell products and support. Like many others, this company was purchased by a larger enterprise that supports its continued development.

Companies like Tivo have packaged hardware or add extra closed source software to sell alongside the free software. Appliances and embedded systems that use Linux are a multi-billion dollar business and encompass everything from home DVRs to security cameras and wearable fitness devices. Many consumer firewalls and entertainment devices follow this model.

Today, both large and small employers have individuals and sometimes whole groups devoted to working on open source projects. Technology companies compete for the opportunity to influence projects that will shape the future of their industries. Other companies dedicate resources towards projects they need for internal use. As more business is done on cloud resources, the opportunity for open source programmers continues to expand.



# Chapter 5 - Command Line Skills



## 5.1 Introduction

Most consumer operating systems are designed to shield the user from the ins and outs of the CLI. The Linux community is different in that it positively celebrates the CLI for its power, speed and ability to accomplish a vast array of tasks with a single command line instruction.

When a user first encounters the CLI, they can find it challenging because it requires memorizing a dizzying amount of commands and their options. However, once a user has learned the structure of how commands are used, where the necessary files and directories are located and how to navigate the hierarchy of a file system, they can be immensely productive. This capability provides more precise control, greater speed and the ability to automate tasks more easily through scripting.

Furthermore, by learning the CLI, a user can easily be productive almost instantly on ANY flavor or distribution of Linux, reducing the amount of time needed to familiarize themselves with a system because of variations in a GUI.



## 5.2 Shell

Once a user has entered a command the terminal then accepts what the user has typed and passes it to a shell. The **shell** is the command line interpreter that translates commands entered by a user into actions to be performed by the operating system. If output is produced by the command, then text is displayed in the terminal. If problems with the command are encountered, an error message is displayed.

The Linux environment allows the use of many different shells, some of which have been around for many years. The most commonly-used shell for Linux distributions is called the **Bash** shell. Bash provides many advanced features, such as command history and inline editing, which allows a user to easily re-execute previously executed commands or a variation of them via simple editing.

The Bash shell also has other popular features, a few of which are listed below:

- **Scripting:** The ability to place commands in a file and then interpret (effectively use Bash to execute the contents of) the file, resulting in all of the commands being executed. This feature also has some programming features, such as conditional statements and the ability to create functions (AKA subroutines).
- **Aliases:** The ability to create short nicknames for longer commands.
- **Variables:** Used to store information for the Bash shell and for the user. These variables can be used to modify how commands and features work as well as provide vital system information.

Bash has an extensive feature list; this is only a sampling of its capabilities.

When a terminal application is run, and a shell appears, displaying an important part of the interface—the prompt. Not only is the prompt there to indicate that commands can be run, but it also conveys useful information to the user. The **prompt** is fully configurable and can be as sparse or as full-featured as is practical and useful.

The structure of the prompt may vary between distributions, but typically contains information about the user and the system. Below is a common prompt structure:

```
sysadmin@localhost:~$
```

The prompt shown contains the following information:

1. **User Name:**

   ```
   sysadmin@localhost:~$
   ```

2. **System Name:**

   ```
   sysadmin@localhost:~$
   ```

3. **Current Directory:**

   ```
   sysadmin@localhost:~$
   ```

The `~` symbol is used as shorthand for the user's home directory. Typically the home directory for the user is under the `/home` directory and named after the user account name; for example, `/home/sysadmin`.

## 5.3 Commands

What is a command? The simplest answer is that a command is a software program that, when executed on the CLI, performs an action on the computer.

To execute a command, the first step is to type the name of the command. Click in the terminal on the right. Type `ls` and hit **Enter**. The result should resemble the example below:

```bash
sysadmin@localhost:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

Many commands can be used by themselves with no further input. Some commands require additional input to run correctly. This additional input comes in two forms: options and arguments.

The typical format for a command is as follows:

```bash
command [options] [arguments]
```

- **Options** are used to modify the core behavior of a command while 

- **arguments** are used to provide additional information (such as a filename or a username). Each option and argument is normally separated by a space, although options can often be combined.

Keep in mind that Linux is case-sensitive. Commands, options, arguments, variables, and file names must be entered exactly as shown.

## 5.3.1 Arguments

```
command [options] [arguments]
```

An argument can be used to specify something for the command to act upon. 

👨‍💻 `ls` command : with a directory name lists the contents of that directory.

```
sysadmin@localhost:~$ ls /etc/ppp                                 
ip-down.d  ip-up.d                                                
```

- `ls` command also accepts multiple arguments. To list the contents of both the `/etc/ppp` and `/etc/ssh` directories, pass them both as arguments:

```
sysadmin@localhost:~$ ls /etc/ppp /etc/ssh         
/etc/ppp:                       
ip-down.d  ip-up.d                                  
/etc/ssh:                                                         
moduli               ssh_host_dsa_key.pub     ssh_host_rsa_key      sshd_configssh_config
ssh_host_ecdsa_key   ssh_host_rsa_key.pub         
ssh_host_dsa_key     ssh_host_ecdsa_key.pub   ssh_import_id            
```

## 5.3.2 Options

```bash
command [options] [arguments]
```

options expand or modify the way a command behaves. 

eg. using the `-l` option for long of the `ls` command results in a long listing, providing additional information about the files that are listed, such as the permissions, the size of the file and other information:

```bash
sysadmin@localhost:~$ ls -l                                       
total 0
drwxr-xr-x 1 sysadmin sysadmin 0 Jan 29  20:13 Desktop             
drwxr-xr-x 1 sysadmin sysadmin 0 Jan 29  20:13 Documents           
drwxr-xr-x 1 sysadmin sysadmin 0 Jan 29  20:13 Downloads           
```

👨‍💻 `-r` option for reverse : prints the results in reverse alphabetical order.

```bash
sysadmin@localhost:~$ ls -r
Videos  Templates  Public  Pictures  Music  Downloads  Documents  Desktop
```

In most cases, options can be used in conjunction with other options. They can be given

- separate options, as in `-l -r`, 
- combined, as in `-lr`. 

```bash
sysadmin@localhost:~$ ls -lr                                                    
total 32                                                                        
drwxr-xr-x 2 sysadmin sysadmin 4096 Oct 31 20:13 Videos                         
drwxr-xr-x 2 sysadmin sysadmin 4096 Oct 31 20:13 Templates                      
drwxr-xr-x 2 sysadmin sysadmin 4096 Oct 31 20:13 Public                         
```

The order of the combined options isn't important. The output of all of these examples would be the same:

```bash
ls -l -r
ls -rl
ls -lr
```

By default the `-l` option of the `ls` command displays files sizes in bytes:

```bash
sysadmin@localhost:~$ ls -l /usr/bin/perl                         
-rwxr-xr-x 2 root root 10376 Feb  4  2018 /usr/bin/perl         
```

👨‍💻 `-h` option : file sizes will be displayed in human-readable format:

```bash
sysadmin@localhost:~$ ls -lh /usr/bin/perl                        
-rwxr-xr-x 2 root root 11K Feb  4  2018 /usr/bin/perl
```

Options are often single letters; however, sometimes they are words or phrases as well. Typically, older commands use single letters while newer commands use complete words for options. 

- Single-letter options are preceded by a single dash `-` character, like the `-h` option. 

- Full-word options are preceded by two dash `--` characters.

eg. The `-h` option also has an equivalent full-word form; the `--human-readable` option.

```bash
sysadmin@localhost:~$ ls -l --human-readable /usr/bin/perl                        
-rwxr-xr-x 2 root root 11K Feb  4  2018 /usr/bin/perl
```

## 5.3.3 History

When a command is executed in the terminal, it is stored in a history list. This is designed to make it easy to execute the same command, later eliminating the need to retype the entire command.

- **Up Arrow ↑** key displays the previous command on the prompt line.
- When the desired command is located, the **Left Arrow ←** and **Right Arrow →** keys can position the cursor for editing. 
- Other useful keys for editing include the **Home**, **End**, **Backspace** and **Delete** keys.

👨‍💻  `history` command: to view history of commands

```bash
sysadmin@localhost:~$ date                                       
Wed Dec 12 04:28:12 UTC 2018                                   
sysadmin@localhost:~$ ls                                           
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos       
sysadmin@localhost:~$ cal 5 2030                                  
     May 2030                                                                  
Su Mo Tu We Th Fr Sa                                                            
          1  2  3  4                                                            
 5  6  7  8  9 10 11                                                            
12 13 14 15 16 17 18                                                            
19 20 21 22 23 24 25                                                            
26 27 28 29 30 31                                                               
sysadmin@localhost:~$ history                                   
    1  date                                                       
    2  ls                                                      
    3  cal 5 2030                                             
    4  history                                                 
```

If the desired command is in the list that the `history` command generates

:man_technologist:  `!` character and then the number next to the command to execute a command listed in history

ef. to execute the `cal` command again:

```bash
sysadmin@localhost:~$ history                                     
    1  date                                                      
    2  ls                                                         
    3  cal 5 2030                                                 
    4  history                                                    
sysadmin@localhost:~$ !3                                        
cal 5 2030                                                        
     May 2030                                                                  
Su Mo Tu We Th Fr Sa                                                            
          1  2  3  4                                                            
 5  6  7  8  9 10 11                                                            
12 13 14 15 16 17 18                                                            
19 20 21 22 23 24 25                                                            
```

:man_technologist: If the `history` command is passed a number as an argument, it outputs that number of previous commands from the history list. 

```bash
sysadmin@localhost:~$ history 3
    6  date                                                                     
    7  ls /home                                                                   
    8  history 3
```

:man_technologist: ‌⁠⁠ To execute the nth command from the bottom of the history list, type `!-n` and hit Enter.

```bash
sysadmin@localhost:~$ !-3                                                       
date                                                                            
Wed Dec 12 04:31:55 UTC 2018 
```

:man_technologist: To execute the most recent command type `!!` and hit **Enter**:

```bash
sysadmin@localhost:~$ date                                                      
Wed Dec 12 04:32:36 UTC 2018                                                    
sysadmin@localhost:~$ !!                                                        
date
Wed Dec 12 04:32:38 UTC 2018
```

:man_technologist: To execute the most recent iteration of a specific command, type `!` followed by the name of the command and hit **Enter**. For example, to execute the most recent `ls` command:

```bash
sysadmin@localhost:~$ !ls                                                       
ls /home                                                                        
sysadmin 
```

## 5.4 Variables

A variable is a feature that allows the user or the shell to store data. This data can be used to provide critical system information or to change the behavior of how the Bash shell (or other commands) work. Variables are given names and stored temporarily in memory. There are two types of variables used in the Bash shell: 

- local
- environment.



## 5.4.1 Local Variables

- exist only in the current shell
- cannot affect other commands or applications. 

* When the user closes a terminal window or shell, all of the variables are lost. 

- They are often associated with user-based tasks 
- lowercase by convention.

:man_technologist: ​To set the value of a variable, use the following assignment expression. If the variable already exists, the value of the variable is modified. If the variable name does not already exist, the shell creates a new local variable and sets the value:

```bash
variable=value
```

The following example creates a local variable named `variable1` and assigns it a value of `Something`:

```bash
sysadmin@localhost:~$ variable1='Something'
```

:man_technologist: `echo` command is used to display output in the terminal. To display the value of the variable, use a dollar sign `$` character followed by the variable name as an argument to the `echo` command:

```bash
sysadmin@localhost:~$ echo $variable1                                   
Something
```

## 5.4.2 Environment Variables

also called **global variables**, are available system-wide, in all shells used by Bash when interpreting commands and performing tasks. The system automatically recreates environment variables when a new shell is opened. Examples include the `PATH`, `HOME`, and `HISTSIZE` variables. 

- The `HISTSIZE` variable defines how many previous commands to store in the history list. The command in the example below displays the value of the `HISTSIZE` variable:

```bash
sysadmin@localhost:~$ echo $HISTSIZE
1000
```

To modify the value of an existing variable, use the assignment expression:

```bash
sysadmin@localhost:~$ HISTSIZE=500                                            
sysadmin@localhost:~$ echo $HISTSIZE                              
500  
```

:man_technologist: the `env` command outputs a list of the environment variables. 

Because the output of the `env` command can be quite long, the following examples use a text search to filter that output. In a previous example `variable1` was created as a local variable, so the following search in the environment variables results in no output:

```bash
sysadmin@localhost:~$ env | grep variable1                              
```

:man_technologist: The pipe `|` character passes the output of the `env` command to the `grep` command, which searches the output.

:man_technologist: The `export` command is used to turn a local variable into an environment variable.

```bash
export variable
```

After exporting `variable1`, it is now an environment variable. It is now found in the search through the environment variables:

```bash
sysadmin@localhost:~$ export variable1                                  
sysadmin@localhost:~$ env | grep variable1
variable1=Something
```

The `export` command can also be used to make a variable an environment variable upon its creation by using the assignment expression as the argument:

```bash
sysadmin@localhost:~$ export variable2='Else'                           
sysadmin@localhost:~$ env | grep variable2                             
variable2=Else
```

To change the value of an environment variable, use the assignment expression:

```bash
sysadmin@localhost:~$ variable1=$variable1' '$variable2                
sysadmin@localhost:~$ echo $variable1                                   
Something Else
```

:man_technologist: Exported variables can be removed using the `unset` command:

```bash
sysadmin@localhost:~$ unset variable2
```

## 5.4.3 Path Variable

One of the most important Bash shell variables to understand is the `PATH` variable. 

- It contains a list that defines which directories the shell looks in to find commands. If a valid command is entered and the shell returns a "command not found" error, it is because the Bash shell was unable to locate a command by that name in any of the directories included in the path. 
- The following command displays the path of the current shell: `echo $PATH`

```bash
sysadmin@localhost:~$ echo $PATH                                        
/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
sysadmin@localhost:~$
```

Each directory in the list is separated by a colon `:` character. Based on the preceding output, the path contains the following directories. The shell will check the directories in the order they are listed:

```bash
/home/sysadmin/bin
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/sbin
/bin
/usr/games
```

Each of these directories is represented by a path. A path is a list of directories separated by the / character. If you think of the filesystem as a map, paths are the directory addresses, which include step-by-step navigation directions; they can be used to indicate the location of any file within the filesystem. For example, `/home/sysadmin` is a path to the home directory:

![img](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/home_directory.png)

Directories and paths will be covered in detail later in the course.

If the command is not found in any directory listed in the `PATH` variable, then the shell returns an error:

```bash
sysadmin@localhost:~$ zed                                              
-bash: zed: command not found                                           
sysadmin@localhost:~$
```

‌⁠⁠ If custom software is installed on the system it may be necessary to modify the `PATH` to make it easier to execute these commands. 



:man_technologist: add to the path ​eg, the following will add and verify the `/usr/bin/custom` directory to the `PATH` variable:

```bash
sysadmin@localhost:~$ PATH=/usr/bin/custom:$PATH                        
sysadmin@localhost:~$ echo $PATH                                       
/usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games                                              
```

When updating the `PATH` variable, always include the current path, so as not to lose access to commands located in those directories. This can be accomplished by appending `$PATH` to the value in the assignment expression. Recall that a variable name preceded by a dollar sign represents the value of the variable.



## 5.5 Command Types

:man_technologist: One way to learn more about a command is to look at where it comes from. The `type` command can be used to determine information about command type.

```
type command
```

There are several different sources of commands within the shell of your CLI including

- internal commands
- external commands
- aliases
- functions.



## 5.5.1 Internal Commands

Also called built-in commands, internal commands are built into the shell itself. A good example is the `cd` (change directory) command as it is part of the Bash shell. When a user types the `cd` command, the Bash shell is already executing and knows how to interpret it, requiring no additional programs to be started.

The `type` command identifies the `cd` command as an internal command:

```bash
sysadmin@localhost:~$ type cd                                     
cd is a shell builtin
```

## 5.5.2 External Commands

External commands are stored in files that are searched by the shell. If a user types the `ls` command, then the shell searches through the directories that are listed in the `PATH` variable to try to find a file named `ls` that it can execute.

If a command does not behave as expected or if a command is not accessible that should be, it can be beneficial to know where the shell is finding the command or which version it is using. It would be tedious to have to manually look in each directory that is listed in the `PATH` variable. 

:man_technologist: use the `which` command to display the full path to the command in question:

```bash
which command
```

The `which` command searches for the location of a command by searching the `PATH` variable.

```bash
sysadmin@localhost:~$ which ls                                       
/bin/ls                                                               
sysadmin@localhost:~$ which cal                                        
/usr/bin/cal
```

External commands can also be executed by typing the complete path to the command. For example, to execute the `ls` command:

```bash
sysadmin@localhost:~$ /bin/ls                                                   
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

For external commands, the `type` command displays the location of the command:

```bash
sysadmin@localhost:~$ type cal                                      
cal is /usr/bin/cal
```

In some cases the output of the `type` command may differ significantly from the output of the `which` command:

```bash
sysadmin@localhost:~$ type echo                                     
echo is a shell builtin
sysadmin@localhost:~$ which echo                                        
/bin/echo
```

Using the `-a` option of the `type` command displays all locations that contain the command named:

```bash
sysadmin@localhost:~$ type -a echo                                      
echo is a shell builtin                                                
echo is /bin/echo
```

## 5.5.3 Aliases

An alias can be used to map longer commands to shorter key sequences. When the shell sees an alias being executed, it substitutes the longer sequence before proceeding to interpret commands.

For example, the command `ls -l` is commonly aliased to `l` or `ll`. Because these smaller commands are easier to type, it becomes faster to run the `ls -l` command line.

:man_technologist: To determine what aliases are set on the current shell use the `alias` command:

```bash
sysadmin@localhost:~$ alias                                             
alias egrep='egrep --color=auto'                                       
alias fgrep='fgrep --color=auto'                                        
alias grep='grep --color=auto'                                          
alias l='ls -CF'                                                       
alias la='ls -A'                                                       
alias ll='ls -alF'                                                     
alias ls='ls --color=auto'
```

The aliases from the previous examples were created by initialization files. These files are designed to make the process of creating aliases automatic.

:man_technologist: New aliases can be created using the following format, where `name` is the name to be given the alias and `command` is the command to be executed when the alias is run.

```bash
alias name=command
```

For example, the `cal 2019` command displays the calendar for the year 2019. Suppose you end up running this command often. Instead of executing the full command each time, you can create an alias called `mycal` and run the alias, as demonstrated in the following graphic:

```bash
sysadmin@localhost:~$ alias mycal="cal 2019"                                    
sysadmin@localhost:~$ mycal                                                     
```

- Once the shell is closed, the new aliases are lost. 
- each shell has its own aliases, so aliases created in one shell won’t be available in a new shell that’s opened.

:man_technologist: The `type` command can identify aliases to other commands:

```bash
sysadmin@localhost:~$ type ll                                          
ll is aliased to `ls -alF'                                              
sysadmin@localhost:~$ type -a ls                                          
ls is aliased to `ls --color=auto'
ls is /bin/ls  
```

The output of these commands indicates that `ll` is an alias for `ls -alF`, and even `ls` is an alias for `ls --color=auto`.

## 5.5.4 Functions

Functions can also be built using existing commands to either create new commands, or to override commands built-in to the shell or commands stored in files. Aliases and functions are normally loaded from the initialization files when the shell first starts.

## 5.6 Quoting

Quotation marks are used throughout Linux administration and most computer programming languages to let the system know that the information contained within the quotation marks should either be ignored or treated in a way that is very different than it would normally be treated. There are three types of quotes that have special significance to the Bash shell: 

- double quotes `"`
-  single quotes `'`
- back quotes ```. 

Each set of quotes alerts the shell not to treat the text within the quotes in the normal way.

## 5.6.1 Double Quotes

- Double quotes stop the shell from interpreting some metacharacters (special characters), including glob characters.

- Glob characters, also called wild cards, are symbols that have special meaning to the shell; they are interpreted by the shell itself before it attempts to run any command. Glob characters include the -
  - asterisk `*` character
  - the question `?` mark character
  - the brackets `[ ]`, among others.

- Within double quotes an asterisk is just an asterisk, a question mark is just a question mark, and so on, which is useful when you want to display something on the screen that is normally a special character to the shell. In the `echo` command below, the Bash shell doesn't convert the glob pattern into filenames that match the pattern:

```bash
sysadmin@localhost:~$ echo "The glob characters are *, ? and [ ]"      
The glob characters are *, ? and [ ]
```

Double quotes still allow for **command substitution**, **variable substitution**, and permit some other shell metacharacters that haven't been discussed yet. The following demonstration shows that the value of the `PATH` variable is still displayed:

```bash
sysadmin@localhost:~$ echo "The path is $PATH"                          
The path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/
```

## 5.6.2 Single Quotes

Single quotes prevent the shell from doing any interpreting of special characters, including globs, variables, command substitution and other metacharacters that have not been discussed yet.

For example, to make the `$` character simply mean a `$`, rather than it acting as an indicator to the shell to look for the value of a variable, execute the second command displayed below:

```bash
sysadmin@localhost:~$ echo The car costs $100                           
The car costs 00                                                        
sysadmin@localhost:~$ echo 'The car costs $100'                        
The car costs $100
```

## 5.6.3 Backslash Character

There is also an alternative technique to essentially single quote a single character. Consider the following message:

```
The service costs $1 and the path is $PATH 
```

If this sentence is placed in double quotes, `$1` and `$PATH` are considered variables.

```
sysadmin@localhost:~$ echo "The service costs $1 and the path is $PATH"

‌⁠⁠The service costs  and the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games 
```

If it is placed in single quotes, `$1` and `$PATH` are not considered variables.

```
sysadmin@localhost:~$ echo 'The service costs $1 and the path is $PATH' 
The service costs $100 and the path is $PATH 
```

But what if you want to have `$PATH` treated as a variable and `$1` not?

use a backslash `\` character in front of the dollar sign `$` character to prevent the shell from interpreting it. The command below demonstrates using the `\` character:

```bash
sysadmin@localhost:~$ echo The service costs \$1 and the path is $PATH
The service costs $1 and the path is /usr/bin/custom:/home/sysadmin/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
```

## 5.6.4 Backquotes

Backquotes, or backticks, are used to specify a command within a command, a process called command substitution. This allows for powerful and sophisticated use of commands.

While it may sound confusing, an example should make things more clear. To begin, note the output of the `date` command:

```
sysadmin@localhost:~$ date                                           
Mon Nov  4 03:35:50 UTC 2018
```

Now, note the output of the `echo` command:

```
sysadmin@localhost:~$ echo Today is date                               
Today is date
```

In the previous command, the word `date` is treated as regular text, and the shell passes `date` to the `echo` command. To execute the `date` command and have the output of that command sent to the `echo` command, put the `date` command in between two backquote characters:

```bash
sysadmin@localhost:~$ echo Today is `date`                         
Today is Mon Nov 4 03:40:04 UTC 2018
```

## 5.7 Control Statements

Control statements allow you to use multiple commands at once or run additional commands, depending on the success of a previous command. Typically these control statements are used within scripts, but they can also be used on the command line as well.

## 5.7.1 Semicolon

```
command1; command2; command3
```

The semicolon `;` character can be used to run multiple commands, one after the other. Each command runs independently and consecutively; regardless of the result of the first command, the second command runs once the first has completed, then the third and so on.

For example, to print the months of January, February and March of 2030, execute the following command:

```bash
sysadmin@localhost:~$ cal 1 2030; cal 2 2030             
    January 2030                                                       
Su Mo Tu We Th Fr Sa                                                            
       1  2  3  4  5                                                            
 6  7  8  9 10 11 12                                                            
13 14 15 16 17 18 19                                                            
20 21 22 23 24 25 26                                                            
27 28 29 30 31                                                                  
                                                                                
   February 2030                                                                
Su Mo Tu We Th Fr Sa                                                            
                1  2                                                            
 3  4  5  6  7  8  9                                                            
10 11 12 13 14 15 16                                                            
17 18 19 20 21 22 23                                                            
24 25 26 27 28                                                                  
                                                                                      
```

## 5.7.2 Double Ampersand

```bash
command1 && command2
```

The double ampersand `&&` acts as a logical "and"; if the first command is successful, then the second command will also run. If the first command fails, then the second command will not run.

To better understand how this works, consider first the concept of failure and success for commands. Commands succeed when they work properly and fail when something goes wrong. For example, consider the `ls` command. The command succeeds if the given directory is accessible and fails if it isn't.

In the following example, the first command succeeds because the `/etc/ppp` directory exists and is accessible while the second command fails because there is no `/junk` directory:

```
sysadmin@localhost:~$ ls /etc/ppp                  
ip-down.d  ip-up.d           
sysadmin@localhost:~$ ls /etc/junk                             
ls: cannot access /etc/junk: No such file or directory
```

To use the success or failure of the `ls` command in conjunction with `&&` execute commands like the following. In the first example, the `echo` command is executed because the `ls` command succeeds:

```bash
sysadmin@localhost:~$ ls /etc/ppp && echo success          
ip-down.d  ip-up.d        
success                                              
```

In the second example, the `echo` command isn't executed because the `ls` command fails:

```bash
sysadmin@localhost:~$ ls /etc/junk && echo success          
ls: cannot access /etc/junk: No such file or directory
```

## 5.7.3 Double Pipe

```bash
command1 || command2
```

The double pipe `||` is a logical "or". Depending on the result of the first command, the second command will either run or be skipped.

With the double pipe, if the first command runs successfully, the second command is skipped; if the first command fails, then the second command is run. In other words, you are essentially telling the shell, "Either run this first command or the second one”.

In the following example, the `echo` command only executes if the `ls` command fails:

```bash
sysadmin@localhost:~$ ls /etc/ppp || echo failed                 
ip-down.d  ip-up.d              
sysadmin@localhost:~$ ls /etc/junk || echo failed                  
ls: cannot access /etc/junk: No such file or directory             
failed
```

## key-terms

Bash

The most commonly used shell for Linux distributions.
[Section 5.2](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.2)

PATH environment variable

Variable containing a list that defines which directories the shell looks in for commands.
[Section 5.4.3](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.4.3)

echo

Command that displays output in the terminal.
[Section 5.4.1](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.4.1)

export

Command that turns a local variable into an environment variable.
[Section 5.4.2](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.4.2)

history

Command that outputs a list of previously executed commands.
[Section 5.3.3](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.3.3)

type

Command that determines information about command type.
[Section 5.5](https://content.netdevgroup.com/contents/linux-essentials/VDSPhwELN6/5.5)



# Chapter 6 - Getting Help

## 6.1 Introduction

There are thousands of commands available with many options, making the command line a powerful tool. However, with this power comes complexity. Complexity, in turn, can create confusion. As a result, knowing how to find help while working in Linux is an essential skill for any user. Referring to help provides a quick reminder of how a command works, as well as being an information resource when learning new commands.

## 6.2 Man Pages

UNIX is the operating system that Linux was modeled after. The developers of UNIX created help documents called man pages (short for manual pages).

Man pages are used to describe the features of commands. They provide a basic description of the purpose of the command, as well as details regarding available options.

## 6.2.1 Viewing Man Pages

To view a man page for a command, use the `man` command:

```
man command
```

For example, the following displays the man page for the `ls` command:

```
sysadmin@localhost:~$ man ls
```

Navigate the document using the arrow keys:

```
LS(1)                            User Commands                           LS(1)  
                                                                                
NAME                                                                            
       ls - list directory contents                                             
                                                                                
SYNOPSIS                                                                        
       ls [OPTION]... [FILE]...                                                 
                                                                                
DESCRIPTION                                                                     
       List  information  about  the FILEs (the current directory by default).  
       Sort entries alphabetically if none of -cftuvSUX nor --sort  is  speci-  
       fied.                                                                    
                                                                                
       Mandatory  arguments  to  long  options are mandatory for short options  
       too.                                                                     
                                                                                
       -a, --all                                                                
              do not ignore entries starting with .                             
```

:man_technologist: To exit viewing a man page, use the **Q** key.

> **Consider This**
>
> The `man` command uses a pager to display documents. Usually, this pager is the `less` command, but on some distributions, it may be the `more` command. Both are very similar in how they perform.
>
> To view the various movement commands that are available, use the **H** key while viewing a man page. This displays a help page.
>
> Pagers will be discussed in more detail later in the course.

## 6.2.2 Sections Within Man Pages

Man pages are broken into sections. Each section is designed to provide specific information about a command. While there are common sections seen in most man pages, some developers also create sections only available on specific man pages.

The following describes some of the more common sections found in man pages:

**NAME**

Provides the name of the command and a very brief description.

```
NAME                                                                            
       ls - list directory contents   
```

**SYNOPSIS**

Provides examples of how the command is executed.

```
SYNOPSIS                                                                        
       ls [OPTION]... [FILE]...   
```

The `SYNOPSIS` section of a man page can be difficult to understand but is very important because it provides a concise example of how to use the command. For example, consider the `SYNOPSIS` of the man page for the `cal` command:

```
SYNOPSIS 
     cal [-31jy] [-A number] [-B number] [-d yyyy-mm] [[month] year] 
```

The square brackets `[ ]` are used to indicate that this feature is not required to run the command. For example, `[-31jy]` means options `-3`, `-1`, `-j`, or `-y` are available, but not required for the `cal` command to function properly.

The last set of square brackets `[[month] year]` demonstrates another feature; it means a year can be specified by itself, but to specify a month the year must also be specified.

Another component of the `SYNOPSIS` that might cause some confusion can be seen in the man page of the `date` command:

```
SYNOPSIS                                                              
       date [OPTION]... [+FORMAT]                                      
       date [-u|--utc|--universal] [MMDDhhmm[[CC]YY][.ss]]
```

‌⁠⁠ 

In this `SYNOPSIS` there are two syntaxes for the `date` command. The first one is used to display the date on the system while the second is used to set the date.

The ellipsis `...` following `[OPTION]` indicates that one or more of the items before it may be used.

Additionally, the `[-u|--utc|--universal]` notation means that either the `-u` option or the `--utc` option or the `--universal` option may be used. Typically this means that all three options really do the same thing, but sometimes the use of the `|` character is used to indicate that the options can't be used in combination, like a logical “or".

**DESCRIPTION**

Provides a more detailed description of the command.

```
DESCRIPTION  
       List  information  about  the FILEs (the current directory by default).  
       Sort entries alphabetically if none of -cftuvSUX nor --sort  is  speci-  
       fied.   
```

**OPTIONS**

Lists the options for the command as well as a description of how they are used. Often this information is found in the `DESCRIPTION` section and not in a separate `OPTIONS` section.

```
       -a, --all                                                                
              do not ignore entries starting with .  
 
       -A, --almost-all                                                         
              do not list implied . and ..                                      
                                                                                
       --author                                                                 
              with -l, print the author of each file                            
                                                                                
       -b, --escape                                                             
              print C-style escapes for nongraphic characters                   
                                                                                
       --block-size=SIZE                                                        
              scale sizes by SIZE before printing them; e.g., '--block-size=M'  
              prints sizes in units of 1,048,576 bytes; see SIZE format below   
```

**FILES**

Lists the files that are associated with the command as well as a description of how they are used. These files may be used to configure the command's more advanced features. Often this information is found in the `DESCRIPTION` section and not in a separate `FILES` section.

**AUTHOR**

Provides the name of the person who created the man page and (sometimes) how to contact the person.

```
AUTHOR                                                                          
       Written by Richard M. Stallman and David MacKenzie.
```

**REPORTING BUGS**

Provides details on how to report problems with the command.

```
REPORTING BUGS                                                                  
       GNU coreutils online help: <http://www.gnu.org/software/coreutils/>      
       Report ls translation bugs to <http://translationproject.org/team/>
```

**COPYRIGHT**

Provides basic copyright information.

```
COPYRIGHT                                                                       
       Copyright (C) 2017 Free Software Foundation, Inc.  License GPLv3+:  GNU  
       GPL version 3 or later <http://gnu.org/licenses/gpl.html>.               
       This  is  free  software:  you  are free to change and redistribute it.  
       There is NO WARRANTY, to the extent permitted by law.   
```

**SEE ALSO**

Provides you with an idea of where you can find additional information. This often includes other commands that are related to this command.

```
SEE ALSO                                                                        
       Full documentation at: <http://www.gnu.org/software/coreutils/ls>        
       or available locally via: info '(coreutils) ls invocation'  
```

## 6.2.3 Searching Man Pages

To search a man page for a term, type the `/` character followed by a search term, then hit the **Enter** key. The program searches from the current location down towards the bottom of the page to try to locate and highlight the term.

If a match is found, it will be highlighted. To move to the next match of the term, press **n**. To return to a previous match of the term, press **Shift**+**N**. If the term is not found, or upon reaching the end of the matches, the program will report `Pattern not found (press Return)`.

‌⁠⁠

![A gif depicting a user searching a man page for a keyword.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_6_1.gif)

## 6.2.4 Man Pages Categorized by Sections

Until now, we have been displaying man pages for commands. However, there are several different types of commands (user commands, system commands, and administration commands), configuration files and other features, such as libraries and kernel components, that require documentation.

As a result, there are thousands of man pages on a typical Linux distribution. To organize all of these man pages, they are categorized by sections.

By default, there are nine sections of man pages:

1. General Commands
2. System Calls
3. Library Calls
4. Special Files
5. File Formats and Conventions
6. Games
7. Miscellaneous
8. System Administration Commands
9. Kernel Routines

The `man` command searches each of these sections in order until it finds the first match. For example, if you execute the command `man cal`, the first section (General Commands) is searched for a man page called `cal`. If not found, then the second section is searched. If no man page is found after searching all sections, an error message is returned:

```
sysadmin@localhost:~$ man zed                                          
No manual entry for zed                                               
```

To determine which section a specific man page belongs to, look at the numeric value on the first line of the output of the man page. For example, the `cal` command belongs to the first section of man pages:

```
CAL(1)                    BSD General Commands Manual             CAL(1)
```

Sometimes there are man pages with the same name in different sections. In these cases, it may be necessary to specify the section of the correct man page.

For example, there is a command called `passwd` that allows you to change your password. There is also a file called `passwd` that stores account information. Both the command and the file have a man page.

The `passwd` command is a user command, so the associated man page is in the first section. The `man` command displays the man page for the `passwd` command by default:

```
sysadmin@localhost:~$ man passwd
PASSWD(1)                        User Commands                 PASSWD(1)
```

So how do you display the man page for the passwd file? First, determine in which section the man page is located. To search for man pages by name, use the `-f` option to the `man` command. It displays man pages that match, or partially match, a specific name and provide the section number and a brief description of each man page:

```
sysadmin@localhost:~$ man -f passwd                                    
passwd (5)           - the password file                              
passwd (1)           - change user password                           
passwd (1ssl)        - compute password hashes                         
```

**Note:** On most Linux distributions, the `whatis` command does the same thing as `man -f`. On those distributions, both will produce the same output.

To specify a different section, provide the number of the section as the first argument of the man command. The following command displays the passwd man page located in section 5, which is associated with the `passwd` file:

```
sysadmin@localhost:~$ man 5 passwd
PASSWD(5)                File Formats and Conversions          PASSWD(5)
```

Unfortunately, you won't always remember the exact name of the man page that you want to view. Fortunately, each man page has a short description associated with it. The `-k` option to the `man` command searches both the names and descriptions of the man pages for a keyword.

For example, to find a man page that displays how to copy directories, search for the keyword `copy`:

```
sysadmin@localhost:~$ man -k copy                                               
cp (1)               - copy files and directories                               
cpgr (8)             - copy with locking the given file to the password or gr...
cpio (1)             - copy files to and from archives                          
cppw (8)             - copy with locking the given file to the password or gr...
dd (1)               - convert and copy a file                                  
debconf-copydb (1)   - copy a debconf database                                  
install (1)          - copy files and set attributes                            
scp (1)              - secure copy (remote file copy program)                   
ssh-copy-id (1)      - use locally available keys to authorize logins on a re...
```

Recall that there are thousands of man pages, so when searching for a keyword, be as specific as possible. Using a generic word, such as "the", could result in hundreds or even thousands of results.

> **Note:** On most Linux distributions, the `apropos` command does the same thing as `man -k`. On those distributions, both produce the same output.

## 6.3 Finding Commands and Documentation

The `whatis` command (or `man -f`) returns what section a man page is stored in. This command occasionally returns unusual output, such as the following:

```
sysadmin@localhost:~$ whatis ls                                              
ls (1)               - list directory contents 
ls (lp)              - list directory contents
```

**Note**

The example above is designed to demonstrate a scenario where two commands list directory contents. The output in the example terminal above may not match the output in the VM.

Based on this output, there are two `ls` commands that list directory contents. The simple reason for this is that UNIX had two main variants, which resulted in some commands being developed "in parallel" and therefore behaving differently on different variants of UNIX. Many modern distributions of Linux include commands from both UNIX variants.

This does, however, pose a bit of a problem: when the `ls` command is typed, which command is executed?

## 6.3.1 Where Are These Commands Located?

To search for the location of a command or the man pages for a command, use the `whereis` command. This command searches for commands, source files and man pages in specific locations where these files are typically stored:

```
sysadmin@localhost:~$ whereis ls 
ls: /bin/ls /usr/share/man/man1p/ls.1.gz /usr/share/man/man1/ls.1.gz
```

Man pages are easily distinguished from commands as they are typically compressed with a program called `gzip`, resulting in a filename that ends in `.gz`. Notice there are two man pages listed above, but only one command: `/bin/ls`. This is because the `ls` command can be used with the options/features that are described by either man page. So, when learning what can be done with the `ls` command, it may be interesting to explore both man pages. Fortunately, this is more of an exception as most commands only have one man page.



## 6.3.2 Find Any File or Directory

The `whereis` command is specifically designed to find commands and man pages. While this is useful, it is often necessary to find a file or directory, not just files that are commands or man pages.

:man_technologist: To find any file or directory, use the `locate` command. This command searches a database of all files and directories that were on the system when the database was created. Typically, the command to generate this database is run nightly.

```
sysadmin@localhost:~$ locate gshadow                                   
/etc/gshadow                                                           
/etc/gshadow-                                                          
/usr/include/gshadow.h                                                
/usr/share/man/cs/man5/gshadow.5.gz                                   
/usr/share/man/da/man5/gshadow.5.gz                                                       
```

Any files created today will not be searchable with the `locate` command. If root access is available, it’s possible to update the `locate` database manually by running the `updatedb` command. Regular users cannot update the database file.

Also note that when using the `locate` command as a regular user, the output may be limited due to file permissions. If the user that is logged in doesn’t have access to a file or directory on the filesystem due to permissions, the `locate` command won't return those names. This security feature is designed to keep users from "exploring" the filesystem by using the `locate` database. The `root` user can search for any file in the `locate` database.

The output of the locate command can be quite large. When searching for a filename, such as `passwd`, the `locate` command produces every file that contains the string `passwd`, not just files named passwd.

In many cases, it is helpful to start by finding out how many files match. Do this by using the `-c` option to the `locate` command:

```
sysadmin@localhost:~$ locate -c passwd                                 
98
```

To limit the output produced by the `locate` command use the `-b` option. This option only includes listings that have the search term in the basename of the filename. The basename is the portion of the filename not including the directory names.

```
sysadmin@localhost:~$ locate -c -b passwd                              
83                                                                     
```

As you can see from the previous output, there will still be many results when the `-b` option is used. To limit the output even further, place a `\` character in front of the search term. This character limits the output to filenames that exactly match the term:

```
sysadmin@localhost:~$ locate -b "\passwd"                              
/etc/passwd                                                                     
/etc/pam.d/passwd                                                               
/usr/bin/passwd                                                                 
/usr/share/doc/passwd                                                           
/usr/share/lintian/overrides/passwd
```

## 6.4 Info Documentation

Man pages are excellent sources of information, but they do tend to have a few disadvantages. One example is that each man page is a separate document, not related to any other man page. While some man pages have a `SEE ALSO` section that may refer to other man pages, they tend to be independent sources of documentation.

The `info` command also provides documentation on operating system commands and features. The goal is slightly different from man pages: to provide a documentation resource that gives a logical organizational structure, making reading documentation easier.

All of the documentation is merged into a single "book" representing all of the documentation available. Within info documents, information is broken down into categories that work much like a table of contents in a book. Hyperlinks are provided to pages with information on individual topics for a specific command or feature.

Another advantage of info over man pages is that the writing style of info documents is typically more conducive to learning a topic. Consider man pages to be more of a reference resource and info documents to be more of a learning guide.

## 6.4.1 Viewing Info Documentation

To display the info documentation for a command, use the `info` command.

```
info command
```

For example, to display the info page of the `ls` command:

```bash
sysadmin@localhost:~$ info ls    
Next: dir invocation,  Up: Directory listing

10.1 `ls': List directory contents                                     
==================================  

    The `ls' program lists information about files (of any type, including directories).  Options and file arguments can be intermixed arbitrarily, as usual. 

    For non-option command-line arguments that are directories, by    
default `ls' lists the contents of directories, not recursively, and   
omitting files with names beginning with `.'.  For other non-option    
arguments, by default `ls' lists just the file name.  If no non-option 
argument is specified, `ls' operates on the current directory, acting  
as if it had been invoked with a single argument of `.'.                        
                                                                       
    By default, the output is sorted alphabetically, according to the  
locale settings in effect.(1) If standard output is a terminal, the    
output is in columns (sorted vertically) and control characters are    
output as question marks; otherwise, the output is listed one per line 
and control characters are output as-is.

-----Info: (coreutils)ls invocation, 57 lines --Top-----------------------------
Welcome to Info version 6.5.  Type H for help, h for tutorial.
```

This documentation is broken up into nodes, and in the example above the line highlighted in white shows it’s currently in the `ls invocation` node. The first line provides index information about the current location within the document. The next node, like the next chapter in a book, would be the `dir invocation` node. Going up one level is the `Directory listing` node.

Scrolling through the document, notice the menu for the `ls` command:

```
* Menu:                                                                         
                           
* Which files are listed::                     
* What information is listed::                 
* Sorting the output::                          
* Details about version sort::                   
* General output formatting::                    
* Formatting file timestamps::                    
* Formatting the file names::                                                   
                                         
   ---------- Footnotes ----------                                              
          
 (1) If you use a non-POSIX locale (e.g., by setting `LC_ALL' to 
`en_US'), then `ls' may produce output that is sorted differently than
you're accustomed to.  In that case, set the `LC_ALL' environment     
variable to `C'.                     
                                           
-----Info: (coreutils)ls invocation, 57 lines --Bot-----------------------------
```

The items under the menu are hyperlinks that link to nodes that describe more about the `ls` command. For example, placing the cursor on the line `* Sorting the output::` and pressing the **Enter** key, leads to a node that describes sorting the output of the `ls` command:

> Note that going into the node about sorting leads into a sub-node of the original. To go back to the previous node, use the **U** key. While **U** leads to the start of the node one level up, the **L** key returns to the same location as before entering the sorting node

## 6.4.2 Navigating Info Documents

Like the `man` command, a listing of movement commands is available by hitting the **Shift**+**H** key while reading the info documentation:

```
Basic Info command keys                                                         
                                                                                
l           Close this help window.                                             
q           Quit Info altogether.                                               
h           Invoke the Info tutorial.                                           
                                                                                
Up          Move up one line.                                                   
Down        Move down one line.                                                 
PgUp        Scroll backward one screenful.                                      
PgDn        Scroll forward one screenful.                                       
Home        Go to the beginning of this node.                                   
End         Go to the end of this node.                                         
                                                                                
TAB         Skip to the next hypertext link.                                    
RET         Follow the hypertext link under the cursor.                         
l           Go back to the last node seen in this window.                       
                                                                                
[           Go to the previous node in the document.                            
]           Go to the next node in the document.                                
p           Go to the previous node on this level.                              
n           Go to the next node on this level.                                  
u           Go up one level.                                                    
-----Info: *Info Help*, 302 lines -- Top--------------------------------------
```

Note that to close the help screen type the **L** key, which brings back the current document. To quit entirely, use the **Q** key.

## 6.4.3 Exploring Info Documentation

Instead of using info documentation to look up information about a specific command or feature, consider exploring the capabilities of Linux by reading through the info documentation. Execute the `info` command without any arguments to be taken to the top level of the documentation. This is a good starting point to explore many of the features offered:

```
File: dir,      Node: Top,      This is the top of the INFO tree.               
                                                                                
This is the Info main menu (aka directory node).                                
A few useful Info commands:                                                     
                                                                                
  'q' quits;                                                                    
  'H' lists all Info commands;                                                  
  'h' starts the Info tutorial;                                                 
  'mTexinfo RET' visits the Texinfo manual, etc.                                
                                                                                
* Menu:                                                                         
                                                                                
Basics                                                                          
* Common options: (coreutils)Common options.                                    
* Coreutils: (coreutils).       Core GNU (file, text, shell) utilities.         
* Date input formats: (coreutils)Date input formats.                            
* File permissions: (coreutils)File permissions.                                
                                Access modes.                                   
* Finding files: (find).        Operating on files matching certain criteria.   
                                                                                
C++ libraries                                                                   
* autosprintf: (autosprintf).   Support for printf format strings in C++.       
-----Info: (dir)Top, 211 lines --Top--------------------------------------------
Welcome to Info version 6.5.  Type H for help, h for tutorial. 
```

## 6.5 Additional Sources of Help

In many cases, the man pages or info documentation provide needed information in an efficient manner. However, there are other sources for help to be aware of.

## 6.5.1 Using the Help Option

Many commands will provide basic information, very similar to the `SYNOPSIS` found in man pages, by simply using the `--help` option to the command. This option is useful to learn the basic usage of a command quickly without leaving the command line:

```
sysadmin@localhost:~$  cat --help                                                
Usage: cat [OPTION]... [FILE]...                                                
Concatenate FILE(s) to standard output.                                         
                                                                                
With no FILE, or when FILE is -, read standard input.                           
                                                                                
  -A, --show-all           equivalent to -vET                                   
  -b, --number-nonblank    number nonempty output lines, overrides -n           
  -e                       equivalent to -vE                                    
  -E, --show-ends          display $ at end of each line                        
  -n, --number             number all output lines                              
  -s, --squeeze-blank      suppress repeated empty output lines                 
  -t                       equivalent to -vT                                    
  -T, --show-tabs          display TAB characters as ^I                         
  -u                       (ignored)                                            
  -v, --show-nonprinting   use ^ and M- notation, except for LFD and TAB        
      --help     display this help and exit                                     
      --version  output version information and exit                            
                                                                                
Examples:                                                                       
  cat f - g  Output f's contents, then standard input, then g's contents.       
  cat        Copy standard input to standard output.                            
                                                                                
GNU coreutils online help: <http://www.gnu.org/software/coreutils/>             
Report cat translation bugs to <http://translationproject.org/team/>            
Full documentation at: <http://www.gnu.org/software/coreutils/cat>              
or available locally via: info '(coreutils) cat invocation'  
```

## 6.5.2 Additional System Documentation

On most systems, there is a directory where additional documentation (such as documentation files stored by third-party software vendors) is found.

‌⁠

These documentation files are often called readme files since the files typically have names such as `README` or `readme.txt`. The location of these files can vary depending on the distribution that you are using. Typical locations include `/usr/share/doc` and `/usr/doc`.

Typically, this directory is where system administrators go to learn how to set up more complex software services. However, sometimes regular users also find this documentation to be useful.



# Chapter 7 - Navigating the Filesystem

## 7.1 Introduction

In Linux, everything is considered a file. Files are used to store data such as text, graphics, and programs. Directories are a type of file used to store other files; Windows and Mac OS X users typically refer to them as folders. In any case, directories are used to provide a hierarchical organization structure. However, this structure may be somewhat different depending on the type of system in use.

When working in a Linux operating system, it is important to know how to manipulate files and directories. Some Linux distributions have GUI-based applications that allow you to manage files, but it is advantageous to know how to perform these operations via the command line.

## 7.2 Directory Structure

On a Windows system, the top level of the directory structure is called My Computer. Physical devices, such as hard drives, USB drives, network drives, show up under My Computer and are each assigned a drive letter, such as C: or D:.

The directory structures shown below are provided as examples only. These directories may not be present within the virtual machine environment of this course.

A visual representation of a Windows directory structure:

![A basic WIndows filesystem has My Computer at the top level, and the contains three folders: DVD Drive D:, Hard Drive C:, and USB Disk E:. DVD Drive D: contains a folder called Data. Hard Drive C: contains three folders called Program Files, Users, and Windows. USB Disk E: contains a folder called Data.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_2.png)

Like Windows, the Linux directory structure, typically called a filesystem, also has a top level. However instead of My Computer, it is called the root directory, and it is symbolized by the slash `/` character. Additionally, there are no drives in Linux; each physical device is accessible under a directory, as opposed to a drive letter.

The following image shows a visual representation of a typical Linux filesystem:

![The Filesystem Hierarchy Standard defines four hierarchies of directories used in organizing the files of the filesystem. The root directory is to the top level of the Linux system, serving as the first hierarchy. It contains the following directories: /bin/ boot/, /dev, /etc, /home, /lib, /lib64, /media, /mnt, /opt, /proc, /root, /sbin, /srv, /sys, /tmp, /usr, and /var. The second and third hierarchies, located under the /usr and /usr/local directories, repeat the pattern of many of the key directories found under the first hierarchy or root filesystem. The fourth hierarchy, the /var directory, also repeats some of the top level directories such as lib, opt and tmp.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_3.png)

To view the contents of the root directory, use the `ls` command with the `/` character as the argument:

```
sysadmin@localhost:~$ ls /                                            
 bin    etc    lib     mnt    root  'sbin'$'\342\200\214'   tmp                 
 boot   home   lib64   opt    run    srv                    usr                 
 dev    init   media   proc   sbin   sys                    var 
```

Notice that there are many directories with descriptive names including `/boot`, which contains files to boot the computer.

## 7.2.1 Home Directory

The term home directory often confuses new Linux users. To begin with, on most Linux distributions there is a directory called `home` under the root `/` directory.

![A directory called home is located in the root directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_4.png)

Under this `/home` directory there is a directory for each user on the system. The directory name is the same as the name of the user, so a user named `sysadmin` would have a home directory called `/home/sysadmin`.

![A user's home directory is located within the /home directory, which in turn is located in the root directory symbolized by the / character. For example, the sysadmin user has a home directory also named sysadmin located in the /home directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_5.png)

The home directory is an important directory. To begin with, when a user opens a shell, they should automatically be placed in their home directory, as typically this is where they do most of their work.

Additionally, the home directory is one of the few directories where the user has full control to create and delete additional files and directories. On most Linux distributions, the only users who can access the files in a home directory are the owner and the administrator on the system. Most other directories in a Linux filesystem are protected with file permissions.

File permissions and ownership will be covered in detail later in the course.

The home directory has a special symbol used to represent it; the tilde `~` character. So if the sysadmin user is logged in, the tilde `~` character can be used in place of the `/home/sysadmin` directory.

It is also possible to refer to another user's home directory by using the tilde `~` character followed by the name of the user account. For example, `~bob` would be the equivalent of `/home/bob`.

## 7.2.2 Current Directory

To determine where the user is currently located within the filesystem, the `pwd` (print working directory) command can be used:

```
pwd [OPTIONS]
sysadmin@localhost:~$ pwd
/home/sysadmin
```

The `pwd` command prints the working directory, which is the current location of the user within the filesystem. The output of the above command indicates that the `sysadmin` user is currently in their home directory, shown in the filesystem below:

![According to the output of the previous example, the user is located in their home directory called sysadmin. It is located in the directory called /home. This map shows that the sysadmin directory contains eight directories: Desktop, Documents, Downloads, Music, Pictures, Public, Templates, and Videos.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_6.png)

## 7.2.3 Changing Directories

When a user opens a shell, they typically begin in their home directory. When you start a fresh virtual machine in our course, either by opening the course or after using the reset button, you are logged in as the `sysadmin` user, and you begin in the home directory for that user, highlighted in the image below.

![When opening a new shell the user is typically in their home directory called sysadmin. It is located in the directory called /home, which in turn is located in the root directory symbolized by the / character.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_6.png)

To navigate the filesystem, use the `cd` (change directory) command.

```
cd [options] [path]
```

There is a directory called `Documents` located in the home directory of the `sysadmin` user. To move from the home directory into the Documents directory use the directory name as an argument to the `cd` command:

```
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$
```

![The previous example moves the users from the sysadmin directory to the Documents directory contained within.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_7.png)

When used with no arguments, the `cd` command will take the user to their home directory.

```
sysadmin@localhost:~/Documents$ cd
sysadmin@localhost:~$
```

Notice our virtual machines employ a prompt that displays the current working directory, emphasized with the color blue. In the first prompt, the tilde `~` character is equivalent to `/home/sysadmin`, representing the user's home directory.

```
sysadmin@localhost:~$
```

After changing directories, the new location `~/Documents` can also be confirmed in the new prompt, again shown in blue.

```
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$
```

**Consider This**

For some commands, no news is good news; there is no output if the `cd` command is successful. If the user tries to change to a directory that does not exist, the command returns an error message:

```
sysadmin@localhost:~$ cd Junk
-bash: cd: Junk: No such file or directory
```

## 7.3 Paths

The argument to the `cd` command is more than just the name of a directory, it is actually a path. A path is a list of directories separated by the `/` character. If you think of the filesystem as a map, paths are the directory addresses, which include step-by-step navigation directions; they can be used to indicate the location of any file within the filesystem.

For example, `/home/sysadmin` is a path to the home directory:

![/home/sysadmin is a path to the home directory of the sysadmin user. This is like step-by-step navigation directions. To get to the sysadmin directory begin at the root directory (symbolized by the / character). Next move to the directory called home. Finally, move to the directory called sysadmin. You have arrived at your destination.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_8.png)

There are two types of paths: absolute and relative.

## 7.3.1 Absolute Paths

Absolute paths allow the user to specify the exact location of a directory. It always starts at the root directory, and therefore it always begins with the `/` character. The path `/home/sysadmin` is an absolute path; it tells the system to begin at the root `/` directory, move into the `home` directory, and then into the `sysadmin` directory.

If the path `/home/sysadmin` is used as an argument to the `cd` command, it moves the user into the home directory for the `sysadmin` user.

```
sysadmin@localhost:~/Documents$ cd /home/sysadmin
```

Again, no output means the command succeeded. This can be confirmed by looking at the prompt, or using the `pwd` command:

```
sysadmin@localhost:~$ pwd
/home/sysadmin
```

## 7.3.2 Relative Paths

Relative paths start from the current directory. A relative path gives directions to a file relative to the current location in the filesystem. They do not start with the / character. Instead, they start with the name of a directory. More specifically, relative paths start with the name of a directory contained within the current directory.

Take another look at the first `cd` command example. The argument is an example of the simplest relative path: the name of a directory within the current working directory.

```
sysadmin@localhost:~$ cd Documents
sysadmin@localhost:~/Documents$ 
```

If the user is located in the `Documents` directory, moving to the `Art` directory can be accomplished in a number of ways.

![This map depicts an abbreviated version of the filesystem beginning at the sysadmin directory. It contains eight directories: Desktop, Documents, Downloads, Music, Pictures, Public, Templates, and Videos. The Documents direcotry contains two directories: School and Work. The School directory contains three directories: Art, Engineering, and Math. The Documents directory is highlighted to represent it is the user's initial location for the subsequent examples. The Art directory is highlighted to represent it will be the destination for the subsequent examples.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_9.png)

The absolute path to the `Art` directory can be used:

```
sysadmin@localhost:~/Documents$ cd /home/sysadmin/Documents/School/Art
sysadmin@localhost:~/Documents/School/Art$ 
```

Multiple relative paths can be used:

```
sysadmin@localhost:~/Documents$ cd School
sysadmin@localhost:~/Documents/School$ cd Art
sysadmin@localhost:~/Documents/School/Art$ 
```

However, the simplest method is to use a single relative path that covers the journey from the origin to the destination directory:

```
sysadmin@localhost:~/Documents$ cd School/Art
sysadmin@localhost:~/Documents/School/Art$ 
```

![If the user is located in the Documents directory, the relative path School/Art moves them to the School directory contained within the Documents directory, then to the Art directory contained within the School directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_10.png)

Use the `pwd` command to confirm the change:

```
sysadmin@localhost:~/Documents/School/Art$ pwd
/home/sysadmin/Documents/School/Art
```

## 7.3.3 Shortcuts

### The `..` Characters

Regardless of which directory the user is in, two period `..` characters always represents one directory higher relative to the current directory, sometimes referred to as the parent directory. To move from the `Art` directory back to the `School` directory:

```
sysadmin@localhost:~/Documents/School/Art$ cd ..
sysadmin@localhost:~/Documents/School$ 
```

The double dot can also be used in longer paths as well. The following relative path could be used to move from the `School` directory to the `Downloads` directory (both highlighted in the image below):

![The starting point for the next example is the School directory located in the Documents directory, which is located in the sysadmin directory. The destination is the Downloads directory located in the sysadmin directory.](https://ndg-content-dev.s3.amazonaws.com/media/images/linux-essentials-v2/LEv2_7_11.png)

```
sysadmin@localhost:~/Documents/School$ cd ../../Downloads
sysadmin@localhost:~/Downloads$
```

### The `.` Character

Regardless of which directory the user is in, the single period `.` character always represents the current directory. For the `cd` this shortcut is not very useful, but it comes in handy for commands covered in subsequent sections.

## 7.4 Listing Files in a Directory

For the previous examples, images were provided to show the layout of the filesystem. In practice, maps like these aren’t provided, and users must rely on what’s available in the command line, making the `ls` (list) command one of the most powerful for navigating the filesystem.

```
ls [OPTION]... [FILE]...
```

This `ls` command is used to display the contents of a directory and can provide detailed information about the files. By default, when it is used with no options or arguments, it lists the files in the current directory:

```
sysadmin@localhost:~$ ls                                               
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

The `ls` command can also be used to list the contents of any directory in the filesystem. Provide the path to the directory as an argument:

```
sysadmin@localhost:~$ ls /var                                                   
backups  cache  lib  local  lock  log  mail  opt  run  spool  tmp 
```

**Consider This**

On many Linux distributions, including the one used in our virtual machines, the `ls` command uses color to distinguish by file type. For example, directories may be displayed in blue, executable files may be displayed in green, and symbolic links may be displayed in cyan.

‌⁠

Colored output is not the default behavior for the `ls` command, but rather the effect of the `--color` option. The `ls` seems to perform this coloring automatically because there is an alias for the `ls` command, so it runs with the `--color` option.

```
sysadmin@localhost:~$ type ls
ls is aliased to `ls --color=auto'
```

To avoid using the alias, place a backslash character `\` in front of your command:

```
sysadmin@localhost:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos 
sysadmin@localhost:~$ \ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
```

## 7.4.1 Listing Hidden Files

When the `ls` command is used to display the contents of a directory, not all files are shown automatically. The `ls` command omits hidden files by default. A hidden file is any file (or directory) that begins with a dot `.` character.

‌⁠⁠

To display all files, including hidden files, use the `-a` option to the `ls` command:

```
sysadmin@localhost:~$ ls -a                                            
.             .bashrc   .selected_editor  Downloads  Public           
..            .cache    Desktop           Music      Templates         
.bash_logout  .profile  Documents         Pictures   Videos
```

Why are files hidden in the first place? Most of the hidden files are customization files, designed to customize how Linux, your shell or programs work. For example, the `.bashrc` file in the home directory customizes features of the shell, such as creating or modifying variables and aliases.

These customization files are not ones that you work with on a regular basis, and having them displayed makes it more difficult to find other files.

## 7.4.2 Long Display Listing

Each file has details associated with it called metadata. This can include information such as the size, ownership, or timestamps. To view this information, use the `-l` option to the `ls` command. Below, a listing of the `/var/log` directory is used as an example, since it provides a variety of output:

```
sysadmin@localhost:~$ ls -l /var/log/
total 900                                                                       
-rw-r--r-- 1 root   root  15322 Dec 10 21:33 alternatives.log
drwxr-xr-x 1 root   root   4096 Jul 19 06:52 apt
-rw-r----- 1 syslog adm     371 Dec 15 16:38 auth.log
-rw-r--r-- 1 root   root  35330 May 26  2018 bootstrap.log
-rw-rw---- 1 root   utmp      0 May 26  2018 btmp
-rw-r----- 1 syslog adm     197 Dec 15 16:38 cron.log
-rw-r--r-- 1 root   adm   85083 Dec 10 21:33 dmesg
-rw-r--r-- 1 root   root 351960 Jul 19 06:52 dpkg.log
-rw-r--r-- 1 root   root  32064 Dec 10 21:33 faillog
drwxr-xr-x 2 root   root   4096 Jul 19 06:51 journal
-rw-rw-r-- 1 root   utmp 292584 Dec 15 16:38 lastlog
-rw-r----- 1 syslog adm   14185 Dec 15 16:38 syslog
-rw------- 1 root   root  64128 Dec 10 21:33 tallylog
-rw-rw-r-- 1 root   utmp    384 Dec 15 16:38 wtmp
```

In the output above, each line displays metadata about a single file. The following describes each of the fields of data in the output of the `ls -l` command:

### File Type

```
-rw-r--r-- 1 root   root  15322 Dec 10 21:33 alternatives.log                   
drwxr-xr-x 1 root   root   4096 Jul 19 06:52 apt 
```

The first character of each line indicates the type of file. The file types are:

| Symbol | File Type      | Description                                                  |
| :----- | :------------- | :----------------------------------------------------------- |
| `d`    | directory      | A file used to store other files.                            |
| `-`    | regular file   | Includes readable files, images files, binary files, and compressed files. |
| `l`    | symbolic link  | Points to another file.                                      |
| `s`    | socket         | Allows for communication between processes.                  |
| `p`    | pipe           | Allows for communication between processes.                  |
| `b`    | block file     | Used to communicate with hardware.                           |
| `c`    | character file | Used to communicate with hardware.                           |

The first file `alternatives.log` is a regular file (`-`), while the second file `apt` is a directory (`d`).

### Permissions

```
drwxr-xr-x 2 root   root   4096 Jul 19 06:51 journal
```

The next nine characters demonstrate the permissions of the file. Permissions indicate how certain users can access a file.

Permissions will be covered in detail later in the course.

### Hard Link Count

```
-rw-r----- 1 syslog adm     371 Dec 15 16:38 auth.log
drwxr-xr-x 2 root   root   4096 Jul 19 06:51 journal
```

This number indicates how many hard links point to this file.

Links will be covered in detail later in the course.

### User Owner

```
-rw-r----- 1 syslog adm     197 Dec 15 16:38 cron.log
```

Every file is owned by a user account. This is important because the owner has the rights to set permissions on a file.

File ownership will be covered in detail later in the course.

### Group Owner

```
-rw-rw-r-- 1 root  utmp  292584 Dec 15 16:38 lastlog
```

Indicates which group owns this file. This is important because any member of this group has a set of permissions on the file.

File ownership will be covered in detail later in the course.

### File Size

```
-rw-r----- 1 syslog adm   14185 Dec 15 16:38 syslog
```

Displays the size of the file in bytes.

For directories, this value does not describe the total size of the directory, but rather how many bytes are reserved to keep track of the filenames in the directory. In other words, ignore this field for directories.

### Timestamp

```
 -rw-rw---- 1 root   utmp      0 May 26  2018 btmp  
```

Indicates the time that the file's contents were last modified. For directories, this timestamp indicates the last time a file was added or deleted from the directory.

### File Name

```
-rw-r--r-- 1 root   root  35330 May 26  2018 bootstrap.log
```

The final field contains the name of the file or directory.

In the case of symbolic links, the link name is displayed along with an arrow and the pathname of the original file.



```
lrwxrwxrwx. 1 root root 22 Nov 6 2018 /etc/grub.conf -> ../boot/grub/grub.conf
```



## 7.4.3 Human-Readable Sizes

The `-l` option to the `ls` command displays file sizes in bytes. For text files, a byte is 1 character. For smaller files, byte sizes are fine. However, for larger files, it is hard to comprehend how large the file is. For example, consider the output of the following command:

```
sysadmin@localhost:~$ ls -l /var/log/lastlog                                    
-rw-rw-r-- 1 root utmp 292584 Dec 15 16:38 /var/log/lastlog
```

The file size is hard to determine in bytes. Is `292584` a large file or small? It seems fairly large, but it is hard to determine using bytes.

Think of it this way: if someone were to give the distance between Boston and New York using inches, that value would be meaningless. Most people think in terms of miles or kilometers.

Sometimes it is preferable to present the file size in a more human-readable size, like megabytes or gigabytes. To accomplish this, add the `-h` option to the `ls` command:

```
sysadmin@localhost:~$ ls -lh /var/log/lastlog                                   
-rw-rw-r-- 1 root utmp 286K Dec 15 16:38 /var/log/lastlog
```

**Important:** The `-h` option must be used with the `-l` option.

## 7.4.4 Listing Directories

When the `-d` option is used, it refers to the current directory, and not the contents within it. Without any other options, it is rather meaningless. Recall that the current directory is always referred to with a single period `.` character:

```
sysadmin@localhost:~$ ls -d                                            
.                                                                      
```

To use the `-d` option in a meaningful way requires the addition of the `-l` option. In this case, note that the following command lists the details of the contents in the `/home/sysadmin` directory:

```
sysadmin@localhost:~$ ls -l                                            
total 32                                                                        
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Desktop
drwxr-xr-x 4 sysadmin sysadmin 4096 Dec 10 21:33 Documents
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Downloads
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Music
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Pictures
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Public
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Templates
drwxr-xr-x 2 sysadmin sysadmin 4096 Dec 10 21:33 Videos
```

In comparison, the next command lists the `/home/sysadmin` directory itself:

```
sysadmin@localhost:~$ ls -ld                                           
drwxr-xr-x 1 sysadmin sysadmin 224 Nov  7 17:07 .
```

Note the single period at the end of the long listing. This indicates that the current directory is being listed, and not the contents.

## 7.4.5 Recursive Listing

There are times when you want to display all of the files in a directory as well as all of the files in all subdirectories under that directory. This is called a recursive listing.

To perform a recursive listing, use the `-R` option to the `ls` command:

```
sysadmin@localhost:~$ ls -R /etc/ppp
/etc/ppp:
ip-down.d  ip-up.d         

/etc/ppp/ip-down.d:
bind9

/etc/ppp/ip-up.d:
bind9
```

Note that in the previous example, the files in the `/etc/ppp` directory were listed first. After that, the contents of its subdirectories `/etc/ppp/ip-down.d` and `/etc/ppp/ip-up.d` were listed.

Be careful with this option; for example, running the command on the root directory would list every file on the file system, including all files on any attached USB device and DVD in the system. Limit the use of recursive listings to smaller directory structures.

## 7.4.6 Sort a Listing

By default, the `ls` command sorts files alphabetically by file name. Sometimes, it may be useful to sort files using different criteria.

To sort files by size, we can use the `-S` option. Note the difference in the output of the following two commands. The same files and directories are listed, but in a different order:

```
sysadmin@localhost:~$ ls /etc/ssh
moduli              ssh_host_ecdsa_key.pub    ssh_host_rsa_key      sshd_config
ssh_config          ssh_host_ed25519_key      ssh_host_rsa_key.pub
ssh_host_ecdsa_key  ssh_host_ed25519_key.pub  ssh_import_id
sysadmin@localhost:~$ ls -S /etc/ssh
moduli            ssh_host_ed25519_key  ssh_host_ecdsa_key.pub
sshd_config       ssh_host_rsa_key.pub  ssh_host_ed25519_key.pub
ssh_host_rsa_key  ssh_import_id
ssh_config        ssh_host_ecdsa_key
```

**Note**

The option above uses a capital letter s.

While the `-S` option works by itself, it is most useful when used with the `-l` option so the file sizes are visible. The following command lists files from largest to smallest and displays the actual size of the file.

```
sysadmin@localhost:~$ ls -lS /etc/ssh
total 580
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
```

It may also be useful to use the `-h` option to display human-readable file sizes:

```
sysadmin@localhost:~$ ls -lSh /etc/ssh                                
total 580K                                                                      
-rw-r--r-- 1 root root 541K Feb 10  2018 moduli
-rw-r--r-- 1 root root 3.2K Feb 10  2018 sshd_config
-rw------- 1 root root 1.7K Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root 1.6K Feb 10  2018 ssh_config
-rw------- 1 root root  411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root  399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root  338 Jul 19 06:52 ssh_import_id
-rw------- 1 root root  227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root  179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw-r--r-- 1 root root   99 Jul 19 06:52 ssh_host_ed25519_key.pub
```

The `-t` option sorts files based on the time they were modified. It will list the most recently modified files first. This option can be used alone, but again, is usually more helpful when paired with the `-l` option:

```
sysadmin@localhost:~$ ls -tl /etc/ssh                                 
total 580
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
```

It is important to remember that the modified date on directories represents the last time a file was added to or removed from the directory.

If the files in a directory were modified many days or months ago, it may be harder to tell exactly when they were modified, as only the date is provided for older files. For more detailed modification time information you can use the `--full-time` option to display the complete timestamp (including hours, minutes, seconds). It will assume the `-l` option automatically:

```
sysadmin@localhost:~$ ls -t --full-time /etc/ssh
total 580
-rw------- 1 root root    227 2018-07-19 06:52:16.000000000 +0000 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    179 2018-07-19 06:52:16.000000000 +0000 ssh_host_ecdsa_key.pub
-rw------- 1 root root    411 2018-07-19 06:52:16.000000000 +0000 ssh_host_ed25519_key
-rw-r--r-- 1 root root     99 2018-07-19 06:52:16.000000000 +0000 ssh_host_ed25519_key.pub
-rw------- 1 root root   1679 2018-07-19 06:52:16.000000000 +0000 ssh_host_rsa_key
-rw-r--r-- 1 root root    399 2018-07-19 06:52:16.000000000 +0000 ssh_host_rsa_key.pub
-rw-r--r-- 1 root root    338 2018-07-19 06:52:16.000000000 +0000 ssh_import_id
-rw-r--r-- 1 root root 553122 2018-02-10 02:31:46.000000000 +0000 moduli
-rw-r--r-- 1 root root   1580 2018-02-10 02:31:46.000000000 +0000 ssh_config
-rw-r--r-- 1 root root   3264 2018-02-10 02:31:46.000000000 +0000 sshd_config
```

It is possible to perform a reverse sort by using the `-r` option. It can be used alone, or combined with either the `-S` or `-t` options. The following command will sort files by size, smallest to largest:

```
sysadmin@localhost:~$ ls -lrS /etc/ssh
total 580
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli 
```

The following command will list files by modification date, oldest to newest:

```
sysadmin@localhost:~$ ls -lrt /etc/ssh                                 
total 580
-rw-r--r-- 1 root root   3264 Feb 10  2018 sshd_config
-rw-r--r-- 1 root root   1580 Feb 10  2018 ssh_config
-rw-r--r-- 1 root root 553122 Feb 10  2018 moduli
-rw-r--r-- 1 root root    338 Jul 19 06:52 ssh_import_id
-rw-r--r-- 1 root root    399 Jul 19 06:52 ssh_host_rsa_key.pub
-rw------- 1 root root   1679 Jul 19 06:52 ssh_host_rsa_key
-rw-r--r-- 1 root root     99 Jul 19 06:52 ssh_host_ed25519_key.pub
-rw------- 1 root root    411 Jul 19 06:52 ssh_host_ed25519_key
-rw-r--r-- 1 root root    179 Jul 19 06:52 ssh_host_ecdsa_key.pub
-rw------- 1 root root    227 Jul 19 06:52 ssh_host_ecdsa_key
```

# Chapter 8 - Managing Files and Directories

## 8.1 Introduction

When working in a Linux Operating System, it is important to know how to manipulate files and directories. Some Linux distributions have GUI-based applications that allow you to manage files, but it is advantageous to know how to perform these operations via the command line.

It is important to note that everything in Linux is case-sensitive, a feature carried over from Unix. This means that the shell recognizes a lowercase `a` character as completely different from an uppercase `A` character. When manipulating files, pay attention to your capitalization: the `hello.txt` file is different from the `HELLO.txt` and `Hello.txt` files.

## 8.2 Globbing

Glob characters are often referred to as wild cards. These are symbol characters that have special meaning to the shell.

Globs are powerful because they allow you to specify patterns that match filenames in a directory. So instead of manipulating a single file at a time, you can easily execute commands that affect many files. For instance, by using glob characters, it is possible to manipulate all files with a specific extension or with a particular filename length.

Unlike commands that the shell runs, or options and arguments that the shell passes to commands, glob characters are interpreted by the shell itself before it attempts to run any command. As a result, glob characters can be used with any command.

The examples provided in this chapter use the `echo` command for demonstration.

## 8.2.1 Asterisk * Character

The asterisk `*` character is used to represent zero or more of any character in a filename. For example, to display all of the files in the `/etc` directory that begin with the letter `t`:

```
sysadmin@localhost:~$ echo /etc/t*                              
/etc/terminfo /etc/timezone /etc/tmpfiles.d
```

The pattern `t*` matches any file in the `/etc` directory that begins with the character `t` followed by zero or more of any character. In other words, any files that begin with the letter `t`.

You can use the asterisk character at any place within the filename pattern. For example, the following matches any filename in the `/etc` directory that ends with `.d`:

```
sysadmin@localhost:~$ echo /etc/*.d                                 
/etc/apparmor.d /etc/binfmt.d /etc/cron.d /etc/depmod.d /etc/init.d /etc/insserv
.conf.d /etc/ld.so.conf.d /etc/logrotate.d /etc/modprobe.d /etc/modules-load.d /
etc/pam.d /etc/profile.d /etc/rc0.d /etc/rc1.d /etc/rc2.d /etc/rc3.d /etc/rc4.d 
/etc/rc5.d /etc/rc6.d /etc/rcS.d /etc/rsyslog.d /etc/sudoers.d /etc/sysctl.d /et
c/tmpfiles.d /etc/update-motd.d
```

In the next example, all of the files in the `/etc` directory that begin with the letter `r` and end with `.conf` are displayed:

```
sysadmin@localhost:~$ echo /etc/r*.conf                             
/etc/resolv.conf /etc/rsyslog.conf
```

## 8.2.2 Question Mark ? Character

The question mark `?` character represents any single character. Each question mark character matches exactly one character, no more and no less.

Suppose you want to display all of the files in the `/etc` directory that begin with the letter `t` and have exactly 7 characters after the `t` character:

```
sysadmin@localhost:~$ echo /etc/t???????      
/etc/terminfo /etc/timezone
```

Glob characters can be used together to find even more complex patterns. The pattern `/etc/*????????????????????` command only matches files in the `/etc` directory with twenty or more characters in the filename:

```
sysadmin@localhost:~$ echo /etc/*????????????????????            
/etc/bindresvport.blacklist /etc/ca-certificates.conf
```

The asterisk and question mark could also be used together to look for files with three-letter extensions by using the `/etc/*.???` pattern:

```
sysadmin@localhost:~$ echo /etc/*.???                
/etc/issue.net /etc/locale.gen
```

## 8.2.3 Bracket [ ] Characters

The bracket `[``]` characters are used to match a single character by representing a range of characters that are possible match characters. For example, the `/etc/[gu]*` pattern matches any file that begins with either a `g` or `u` character and contains zero or more additional characters:

```
sysadmin@localhost:~$ echo /etc/[gu]*                              
/etc/gai.conf /etc/groff /etc/group /etc/group- /etc/gshadow /etc/gshadow- /etc/
gss /etc/ucf.conf /etc/udev /etc/ufw /etc/update-motd.d /etc/updatedb.conf           
```

Brackets can also be used to a represent a range of characters. For example, the `/etc/[a-d]*` pattern matches all files that begin with any letter between and including a and d:

```
sysadmin@localhost:~$ echo /etc/[a-d]*
/etc/adduser.conf /etc/alternatives /etc/apparmor /etc/apparmor.d /etc/apt /etc/
bash.bashrc /etc/bind /etc/bindresvport.blacklist /etc/binfmt.d /etc/ca-certific
ates /etc/ca-certificates.conf /etc/calendar /etc/console-setup /etc/cron.d /etc
/cron.daily /etc/cron.hourly /etc/cron.monthly /etc/cron.weekly /etc/crontab /et
c/dbus-1 /etc/debconf.conf /etc/debian_version /etc/default /etc/deluser.conf /e
tc/depmod.d /etc/dhcp /etc/dpkg 
```

The `/etc/*[0-9]*` pattern displays any file that contains at least one number:

```
sysadmin@localhost:~$ echo /etc/*[0-9]*                            
/etc/X11 /etc/dbus-1 /etc/iproute2 /etc/mke2fs.conf /etc/python3 /etc/python3.6 
/etc/rc0.d /etc/rc1.d /etc/rc2.d /etc/rc3.d /etc/rc4.d /etc/rc5.d /etc/rc6.d  
```

The range is based on the **ASCII** text table. This table defines a list of characters, arranging them in a specific standard order. If an invalid order is provided, no matches will be made:

```
sysadmin@localhost:~$ echo /etc/*[9-0]*                           
/etc/*[9-0]*                                                       
```

**Note:** The ASCII text table can be viewed in our virtual machines by executing the `ascii` command.

## 8.2.4 Exclamation Point ! Character

The exclamation point `!` character is used in conjunction with the square brackets to negate a range. For example, the pattern `/etc/[!DP]*` matches any file that does not begin with a `D` or P.

```
sysadmin@localhost:~$ echo /etc/[!a-t]*
/etc/X11 /etc/ucf.conf /etc/udev /etc/ufw /etc/update-motd.d /etc/updatedb.conf 
/etc/vim /etc/vtrgb /etc/wgetrc /etc/xdg
```

## 8.2.5 Listing With Globs

The `ls` command is normally used to list files in a directory; as a result, using the `echo` command may seem to have been a strange choice. However, there is something about the `ls` command that causes problems when listing files using glob patterns.

Keep in mind that it is the shell, not the `echo` or `ls` command, that expands the glob pattern into corresponding file names. In other words, if the `echo /etc/a*` command is executed, what the shell did before executing the echo command was replace `a*` with all of the files and directories within the `/etc` directory that match the pattern.

So, if the `ls /etc/a*` command is run, what the shell would really run would be this:

```
ls /etc/adduser.conf  /etc/alternatives  /etc/apparmor  /etc/apparmor.d  /etc/apt
```

When the `ls` command sees multiple arguments, it performs a list operation on each item separately. In other words, `ls /etc/a*` is the same as running the following commands consecutively:

```
ls /etc/adduser.conf  
ls /etc/alternatives  
ls /etc/apparmor  
ls /etc/apparmor.d  
ls /etc/apt
```

Now consider what happens the `ls` command is passed a file, such as `/etc/adduser.conf`:

```
sysadmin@localhost:~$ ls /etc/adduser.conf
/etc/adduser.conf
```

Running the `ls` command on a single file results in the name of the file being printed; typically this is useful if the `-l` option is used to see details about a specific file:

```
sysadmin@localhost:~$ ls -l /etc/adduser.conf                                   
-rw-r--r-- 1 root root 3028 May 26  2018 /etc/adduser.conf
```

However, what if the `ls` command is given a directory name as an argument? In this case, the output of the command is different than if the argument was a regular file:

```
sysadmin@localhost:~$ ls /etc/apparmor                                          
init  parser.conf  subdomain.conf 
```

If the `ls` command is given a directory name, the command displays the contents of the directory (the names of the files in the directory), not just the directory name. The filenames in the previous example are the names of the files in the `/etc/apparmor` directory.

Why is this a problem when using globs? Consider the following output:

```
sysadmin@localhost:~$ ls /etc/ap*                                               
/etc/apparmor:                                                                  
init  parser.conf  subdomain.conf                                               
                                                                                
/etc/apparmor.d:                                                                
abstractions  disable         local          tunables     usr.sbin.named        
cache         force-complain  sbin.dhclient  usr.bin.man  usr.sbin.rsyslogd     
                                                                                
/etc/apt:                                                                       
apt.conf.d  preferences.d  sources.list  sources.list.d  trusted.gpg.d   
```

When the `ls` command sees a filename as an argument, it just displays the filename. However, for any directory, it displays the contents of the directory, not just the directory name.

This becomes even more confusing in a situation like the following:

```
sysadmin@localhost:~$ ls /etc/x*                                                
autostart  systemd  user-dirs.conf  user-dirs.defaults 
```

In the previous example, it seems like the `ls` command is just plain wrong. However, what really happened is that the only thing that matches the glob `/etc/x*` is the `/etc/xdg` directory.

So, the `ls` command only displayed the files in that directory!

There is a simple solution to this problem: always use the `-d` option with globs, which tells the `ls` command to display the name of directories, instead of their contents:

```
sysadmin@localhost:~$ls -d /etc/x*                                             
/etc/xdg
```

## 8.3 Copying Files

The `cp` command is used to copy files. It requires a source and a destination. The structure of the command is as follows:

```
cp [source] [destination]
```

The source is the file to be copied. The destination is where the copy is to be located. When successful, the `cp` command does not have any output (no news is good news). The following command copies the `/etc/hosts` file to your home directory:

```
sysadmin@localhost:~$ cp /etc/hosts ~                                     
sysadmin@localhost:~$ ls
Desktop    Downloads  Pictures  Templates  hosts                          
Documents  Music      Public    Videos                                    
```

**Reminder:** The `~` character represents your home directory.

## 8.3.1 Verbose Mode

The `-v` option causes the `cp` command to produce output if successful. The `-v` option stands for verbose:

```
sysadmin@localhost:~$ cp -v /etc/hosts ~                              
`/etc/hosts' -> `/home/sysadmin/hosts'
```

When the destination is a directory, the resulting new file keeps the same name as the original file. To give the new file a different name, provide the new name as part of the destination:

```
sysadmin@localhost:~$ cp /etc/hosts ~/hosts.copy                      
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  hosts                       
Documents  Music      Public    Videos     hosts.copy  
```

## 8.3.2 Avoid Overwriting Data

The `cp` command can be destructive to existing data if the destination file already exists. In the case where the destination file exists, the `cp` command overwrites the existing file's contents with the contents of the source file.

To illustrate this potential problem, first a new file is created in the home directory by copying an existing file:

```
sysadmin@localhost:~$ cp /etc/hostname example.txt
```

View the information about the file with `ls` command:

```
sysadmin@localhost:~$ ls -l example.txt                                         
-rw-r--r-- 1 sysadmin sysadmin 10 Dec 15 22:55 example.txt
```

View the contents of the file using the `cat` command:

```
sysadmin@localhost:~$ cat example.txt                                           
localhost     
```

In the next example, the `cp` command destroys the original contents of the `example.txt` file:

```
sysadmin@localhost:~$ cp /etc/timezone example.txt
```

Notice that after the `cp` command is complete, the size of the file has changed and the contents are different:

```
sysadmin@localhost:~$ ls -l example.txt                                         
-rw-r--r-- 1 sysadmin sysadmin 8 Dec 15 22:58 example.txt
sysadmin@localhost:~$ cat example.txt
Etc/UTC
```

Two options can be used to safeguard against accidental overwrites. With the `-i` interactive option, the `cp` command prompts the user before overwriting a file. The following example demonstrates this option, first restoring the content of the original file:

```
sysadmin@localhost:~$ cp -i /etc/hosts example.txt                   
cp: overwrite `/home/sysadmin/example.txt'? n                          
```

If a value of `y` (yes) were given, then the copy process would have taken place. However, the value of `n` (no) was given when prompted to overwrite the file, so no changes were made to the file.

The `-i` option requires you to answer `y` or `n` for every copy that could end up overwriting an existing file's contents. This can be tedious when a bunch of overwrites occur, such as the example demonstrated below:

```
sysadmin@localhost:~$ cp -i /etc/skel/.* ~                             
cp: -r not specified; omitting directory '/etc/skel/.'                          
cp: -r not specified; omitting directory '/etc/skel/..'                                   
cp: overwrite `/home/sysadmin/.bash_logout'? n                         
cp: overwrite `/home/sysadmin/.bashrc'? n                              
cp: overwrite `/home/sysadmin/.profile'? n                            
cp: overwrite `/home/sysadmin/.selected_editor'? n
```

As you can see from the example above, the `cp` command tried to overwrite four existing files, forcing the user to answer four prompts. If this situation happened for 100 files, it could become very annoying, very quickly.

To answer `n` to each prompt automatically, use the `-n` option. It stands for no clobber, or no overwrite.

```
sysadmin@localhost:~$ cp -n /etc/skel/.* ~                                      
cp: -r not specified; omitting directory '/etc/skel/.'                          
cp: -r not specified; omitting directory '/etc/skel/..'
```

## 8.3.3 Copying Directories

By default, the `cp` command will not copy directories; any attempt to do so results in an error message:

```
sysadmin@localhost:~$ cp -n /etc/skel/.* ~                                      
cp: -r not specified; omitting directory '/etc/skel/.'                          
cp: -r not specified; omitting directory '/etc/skel/..'                               
```

However, the `-r` option has the `cp` command copy both files and directories.

Be careful with this option. The entire directory structure will be copied which could result in copying a lot of files and directories!

## 8.4 Moving Files

To move a file, use the `mv` command. The syntax for the `mv` command is much like the `cp` command:

```
mv [source] [destination]
```

In the following example, the `hosts` file that was generated previously is moved from the current directory to the `Videos` directory:

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt  hosts.copy     
Documents  Music      Public    Videos     hosts                       
sysadmin@localhost:~$ mv hosts Videos                                  
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt                 
Documents  Music      Public    Videos     hosts.copy                 
sysadmin@localhost:~$ ls Videos                                        
hosts                                                                 
```

When a file is moved, the file is removed from the original location and placed in a new location. Moving files can be somewhat tricky in Linux because users need specific permissions to remove files from a directory. Without the right permissions, a `Permission denied` error message is returned:

```
sysadmin@localhost:~$ mv /etc/hosts .
mv: cannot move `/etc/hosts' to `./hosts': Permission denied
```

Permissions will be covered in detail later in the course.

## 8.4.1 Renaming Files

The `mv` command is not just used to move a file, but also to rename a file. If the destination for the `mv` command is a directory, the file is moved to the directory specified. The name of the file only changes if a destination file name is also specified.

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt                          
Documents  Music      Public    Videos     hosts.copy                 
sysadmin@localhost:~$ mv example.txt Videos/newexample.txt             
sysadmin@localhost:~$ ls
Desktop    Downloads  Pictures  Templates  hosts.copy                           
Documents  Music      Public    Videos                               
sysadmin@localhost:~$ ls Videos                                       
hosts  newexample.txt                                                  
```

If a destination directory is not specified, the file is renamed using the destination file name and remains in the source directory. For example, the following commands renames the `newexample.txt` file to `myfile.txt`:

```
sysadmin@localhost:~$ cd Videos                                        
sysadmin@localhost:~/Videos$ ls                                        
hosts  newexample.txt                                                  
sysadmin@localhost:~/Videos$ mv newexample.txt myfile.txt           
sysadmin@localhost:~/Videos$ ls
hosts  myfile.txt
```

Think of the previous `mv` example to mean move the `newexample.txt` file from the current directory to the current directory and give the new file the name `myfile.txt`.

## 8.4.2 Additional Move Options

Like the `cp` command, the `mv` command provides the following options:

‌⁠⁠

| Option | Meaning                                                     |
| :----- | :---------------------------------------------------------- |
| `-i`   | Interactive: Ask if a file is to be overwritten.            |
| `-n`   | No Clobber: Do not overwrite a destination file's contents. |
| `-v`   | Verbose: Show the resulting move.                           |

**Important:** There is no `-r` option as the `mv` command moves directories by default.

## 8.5 Creating Files

There are several ways of creating a new file, including using a program designed to edit a file (a text editor).

There is also a way to create an empty file that can be populated with data at a later time. This feature is useful for some operating systems as the very existence of a file could alter how a command or service works. It is also useful to create a file as a "placeholder" to remind you to create the file contents at a later time.

To create an empty file, use the `touch` command as demonstrated below:

```
sysadmin@localhost:~$ touch sample                                     
sysadmin@localhost:~$ ls -l sample                                     
-rw-rw-r-- 1 sysadmin sysadmin 0 Nov  9 16:48 sample
```

Notice the size of the new file is `0` bytes. As previously mentioned, the `touch` command doesn't place any data within the new file.

Text editors will be covered in detail later in the course.

## 8.6 Removing Files

To delete a file, use the `rm` command:

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  hosts.copy                           
Documents  Music      Public    Videos     sample                         
sysadmin@localhost:~$ rm sample    
sysadmin@localhost:~$ rm hosts.copy                                    
sysadmin@localhost:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos 
```

Note that the files were deleted with no questions asked. This could cause problems when deleting multiple files by using glob characters. Because these files are deleted without question, a user could end up deleting files that were not intended to be deleted.

**Warning:** The files are permanently deleted. There is no command to undelete a file and no trash can from which to recover deleted files.

As a precaution, users should use the `-i` option when deleting multiple files:

```
sysadmin@localhost:~$ touch sample.txt example.txt test.txt            
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  example.txt  test.txt       
Documents  Music      Public    Videos     sample.txt                 
sysadmin@localhost:~$ rm -i *.txt                                     
rm: remove regular empty file `example.txt'? y                         
rm: remove regular empty file `sample.txt'? n                          
rm: remove regular empty file `test.txt'? y                            
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  sample.txt                  
Documents  Music      Public    Videos                                 
```

## 8.6.1 Removing Directories

You can delete directories using the `rm` command. However, the default behavior (no options) of the `rm` command is to not delete directories:

```
sysadmin@localhost:~$ rm Videos                                        
rm: cannot remove `Videos': Is a directory                            
```

To delete a directory with the `rm` command, use the `-r` recursive option:

```
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates  sample.txt                  
Documents  Music      Public    Videos                                 
sysadmin@localhost:~$ rm -r Videos                                     
sysadmin@localhost:~$ ls                                               
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  sample.txt 
```

When a user deletes a directory, all of the files and subdirectories are deleted without any interactive question. It is best to use the `-i` option with the `rm` command.

You can also delete a directory with the `rmdir` command, but only if the directory is empty.

```
sysadmin@localhost:~$ rmdir Documents                                           
rmdir: failed to remove 'Documents': Directory not empty
```

## 8.7 Creating Directories

To create a directory, use the `mkdir` command:

```
sysadmin@localhost:~$ ls                                               
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  sample.txt
sysadmin@localhost:~$ mkdir test                                       
sysadmin@localhost:~$ ls                                               
Desktop    Downloads  Pictures  Templates   test                       
Documents  Music      Public    sample.txt
```