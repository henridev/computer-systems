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

📘📘 The **kernel** of the operating system is like an air traffic controller at an airport, and the applications are the airplanes under its control. 

- The kernel decides which program gets which blocks of memory
- it starts and kills applications
- it handles displaying text or graphics on a monitor.

Applications make requests to the kernel and in return receive resources, such as memory, CPU, and disk space. If two applications request the same resource, the kernel decides which one gets it, and in some cases, kills off another application to save the rest of the system and prevent a crash.

The kernel also abstracts some complicated details away from the application. (eg. the application doesn’t know if a block of disk storage is on a solid-state drive, a spinning metal hard disk, or even a network file share. Applications need only follow the kernel’s Application Programming Interface (API) and therefore don’t have to worry about the implementation details) Each application behaves as if it has a large block of memory on the system; the kernel maintains this illusion by remapping smaller blocks of memory, sharing blocks of memory with other applications, or even swapping out untouched blocks to disk.

The kernel also **multitasking** which means the switching of applications. A computer system has a small number of central processing units (CPUs) and a finite amount of memory. The kernel takes care of unloading one task and loading a new one if there is more demand than resources available. When one task has run for a specified amount of time, the CPU pauses it so that another may run. If the computer is doing several tasks at once, the kernel is deciding when to switch focus between tasks. With the tasks rapidly switching, it appears that the computer is doing many things at once.

When we, as users, think of applications, we tend to think of word processors, web browsers, and email clients, however, there are a large variety of application types. The kernel doesn’t differentiate between a user-facing application, a network service that talks to a remote computer, or an internal task. From this, we get an abstraction called a process. A **process** is just one task that is loaded and tracked by the kernel. An application may even need multiple processes to function,  

the kernel takes care of running the processes, starting and stopping them as requested, and handing out system resources.

📘📘 **GNU / linux** = combination of software defining the OS 
- gnu is not unix
- gnu is free open source software offering many commandos similar to unix commandos
- linux programmers integrated GNU tools to offer a complete OS

UNIX was the foundation for linux
- invented in bell labs 
- writte in C and low level assembler language 

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
