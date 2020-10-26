# Chapter 12 - Understanding Computer Hardware

## 12.1 Introduction

Computers begin as a hardware device but can grow to encompass virtual machines that are entirely constructed out of software and appear to all purposes to be a remote machine that users can access via remote protocols and methods.

Keeping virtual machines in mind, it’s imperative to understand what makes up the physical hardware that makes up a computer. Without an understanding of what components make up a computer, how they are integrated and communicate between each other, and how a computer should function, you cannot properly install, configure, administer, secure or troubleshoot a system.

There are hundreds of specific types of computers in service, from set-top boxes to dedicated firewalls to laptops, servers and many special-purpose devices, but they all feature at least a few of the same basic components that actually make them a computer. This chapter introduces and explains the basics of what makes up a computer and expands to a few optional items that are fairly commonplace.

## 12.2 Motherboards

The motherboard, or system board, is the main hardware board in the computer through which the central processing unit (CPU), random-access memory (RAM) and other components are all connected. Depending on the computer type (laptop, desktop, server) some devices, such as processors and RAM, are attached directly to the motherboard, while other devices, such as add-on cards, are connected via a bus.

## 12.3 Processors

A central processing unit (CPU or processor) is one of the most critical hardware components of a computer. The processor is the brain of the computer, where the execution of code takes place and where most calculations are done. It is directly connected (soldered) to the motherboard, as motherboards are typically configured to work with specific types of processors.

If a hardware system has more than one processor, the system is referred to as a multiprocessor. If more than one processor is combined into a single overall processor chip, then it is called **multi-core**.

Although support is available for more types of processors in Linux than any other operating system, there are primarily just two types of processors used on desktop and server computers: x86 and x86_64.

- x86 system, the system processes data 32 bits at a time
- x86_64 the system processes data 64 bits at a time.the system is also capable of processing data 32 bits at a time in a backward compatible mode. One of the main advantages of a 64-bit system is the ability to work with more memory, while other advantages include increased efficiency of processing and increased security.

Intel originated the x86 family of processors in 1978 with the release of the 8086 processor. Since that time, Intel has produced many other processors that are improvements to the original 8086; they are known generically as x86 processors. These processors include the 80386 (i386), 80486 (i486), the Pentium series (i586) and the Pentium Pro series (i686). In addition to Intel, other companies such as AMD and Cyrix have also produced x86 compatible processors. While Linux is capable of supporting processors back to the i386 generation, many distributions (especially the ones that feature corporate support, such as SUSE, Red Hat and Canonical) limit their support to i686 or later.

The x86_64 family of processors, including the 64-bit processors from Intel and AMD, have been in production since around the year 2000. As a result, almost all of the modern processors shipped today are of the x86_64 type. While the hardware has been available for over a decade now --> the software to support this family of processors has been much slower to develop. Although it’s 2018 at the time of this update, there remain a number of packages that are still available for the x86 architecture.

To see which family the CPU of the current system belongs to, use the arch command:

For more information concerning the CPU, use the lscpu command:

```bash
sysadmin@localhost:~$ arch
x86_64
sysadmin@localhost:~$ lscpu
Architecture:          x86_64
CPU op-mode(s):        32-bit, 64-bit
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
```

## 12.4 Random Access Memory

The motherboard typically has slots where random-access memory (RAM) can be connected to the system.

- The 32-bit architecture systems can use up to 4 gigabytes (GB) of RAM,
- 64-bit architectures are capable of addressing and using far more RAM.

In some cases, the RAM a system has might not be enough to handle all of the operating system requirements. Once invoked, programs are loaded in RAM along with any data they need to store, while instructions are sent to the processor when they execute.

When the system is running low on RAM, virtualized memory called **swap space** is used to temporarily store data to disk. Data stored in RAM that has not been used recently is moved over to the section of the hard drive designated as swap, freeing up more RAM for use by currently active programs. --> If needed, this swapped data can be moved back into RAM at a later time. The system does all of this automatically as long as swap is configured.

To view the amount of RAM in your system, including the swap space, execute the `free` command. The free command has a `-m` option to force the output to be rounded to the nearest megabyte (MB) and a `-g` option to force the output to be rounded to the nearest gigabyte (GB):

```bash
sysadmin@localhost:~$ free -m
             total       used       free     shared    buffers     cached
Mem:          1894        356       1537          0          25       177
-/+ buffers/cache:        153       1741
Swap:         4063          0       4063
```

The output shows that this system has a total of 1,894 MB and is currently using 356 MB.

The amount of swap appears to be approximately 4 GB, although none of it appears to be in use. This makes sense because so much of the physical RAM is free, so there is no need at this time for virtual RAM (swap space) to be used.

## 12.5 Buses

- A bus is a high-speed connection that allows communication between computers or the components inside a computer.
- The motherboard has buses that allow for multiple devices to connect to the system, including
  - the Peripheral Component Interconnect (PCI) - Universal Serial Bus (USB).
  - monitors, keyboards and mice.

Different system types will use a bus differently to connect components. In a desktop or server computer, there is a motherboard with the processor, RAM, and other components directly attached, and then a high-speed bus that allows additional components to be attached via card slots, such as video, network and other peripheral devices.

> Increasingly for laptop and light/thin/small form factor computers, the majority of the computer’s components may be directly connected to the motherboard, including the usual processor, RAM, as well as additional components like the network card. In this configuration, the bus still exists, but effectively one of the main convenience factors of being able to swap out or upgrade devices is no longer a possibility.

**Peripheral Devices**

- are components connected to a computer that allow input, output or data storage. Keyboards, mice, monitors, printers and hard disks are all considered peripherals and are accessed by the system in order to perform functions outside of central processing.
- To view all of the devices connected by the PCI bus, the user can execute the `lspci` command. The following is a sample output of this command. The highlighted sections show this system has a VGA controller (a monitor connector), an SCSI storage controller (a type of hard drive) and an Ethernet controller (a network connector):

Note: The example below uses the lspci command. This command is not available within the virtual machine environment of this course.

```bash
sysadmin@localhost:~$ lspci
00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host bridge (rev 01)
00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP bridge (rev 01)
00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 08)
00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
00:07.7 System peripheral: VMware Virtual Machine Communication Interface (rev 10)
00:0f.0 VGA compatible controller: VMware SVGA II Adapter
03:00.0 Serial Attached SCSI controller: VMware PVSCSI SCSI Controller (rev 02
0b:00.0 Ethernet controller: VMware VMXNET3 Ethernet Controller (rev 01)
Universal Serial Bus Devices
```

While the PCI bus is used for many internal devices such as sound and network cards, an ever-increasing number of external devices (or peripherals) are connected to the computer via USB.

Devices connected internally are usually cold-plug, meaning the system must be shut down in order to connect or disconnect a device. USB devices are **hot-plug**, meaning they can be connected or disconnected while the system is running.

> Though USB devices are hot-plug by design, it's important to ensure that any mounted filesystems are correctly unmounted, or data loss and corruption of the filesystem may occur.

To display the devices connected to the system via USB, execute the lsusb command:

Note

The example uses the `lsusb` command. This command is not available within the virtual machine environment of this course.

```bash
sysadmin@localhost:~\$ lsusb
Bus 001 Device 002: ID 0e0f:000b VMware, Inc.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 004: ID 0e0f:0008 VMware, Inc.
Bus 002 Device 003: ID 0e0f:0002 VMware, Inc. Virtual USB Hub
Bus 002 Device 002: ID 0e0f:0003 VMware, Inc. Virtual Mouse
Bus 002 Device 001: ID 1d6b:0001
```

## 12.6 Hard Drives

Hard drives, also called hard disks, disk devices, or storage devices, may be attached to the system in a number of ways; the controller may be

- integrated into the motherboard
- on a PCI card
- a USB device.

For the purposes of most Linux systems, a hard drive can generally be defined as any electromechanical or electronic storage device that holds data to be accessed by the system.

Hard drives are divided into one or more partitions. A **partition** is a logical division of a hard drive, designed to take a large amount of available storage space and break it up into smaller areas. While it is common on Microsoft Windows to have a single partition for each hard drive, on Linux distributions, multiple partitions per hard drive is common.

Some hard drives make use of a partitioning technology called **Master Boot Record (MBR)** while others make use of a partitioning type called **GUID Partitioning Table (GPT)**. The MBR type of partitioning has been used since the early days of the Personal Computer (PC), and the GPT type has been available since the year 2000.

An old term used to describe an internal hard disk is fixed disk, as the disk is fixed (not removable). This term gave rise to several command names: the `fdisk, cfdisk, sfdisk` commands, which are tools for working with the MBR partitioned disks.

The GPT disks use a newer type of partitioning, which allows the user to divide the disk into more partitions than what MBR supports. GPT also allows having partitions which can be larger than two terabytes (MBR does not). --> The tools for managing GPT disks are named similarly to their fdisk counterparts: `gdisk, cgdisk, sgdisk`.

There is also a family of tools that attempt to support both MBR and GPT type disks. This set of tools includes the `parted` command and the graphical gparted tool.

> Note: Many Linux distributions use the gparted tool in the installation routine, as it provides a graphical interface to the powerful options available for creating new partitions, resizing existing ones (such as Windows partitions) and many other advanced tasks.

Hard drives are associated with file names (called device files) that are stored in the /dev directory. Each device file name is made up of multiple parts.

- File Type : The file name is prefixed based on the different types of hard drives. IDE (Intelligent Drive Electronics) hard drives begin with hd, while USB, SATA (Serial Advanced Technology Attachment) and SCSI (Small Computer System Interface) hard drives begin with sd.
- Device Order : Each hard drive is then assigned a letter which follows the prefix. For example, the first IDE hard drive would be named /dev/hda and the second would be /dev/hdb, and so on.
- Partition : Finally, each partition on a disk is given a unique numeric indicator. For example, if a USB hard drive has two partitions, they could be associated with the /dev/sda1 and /dev/sda2 device files.

The following example shows a system that has three sd devices:

- /dev/sda
- /dev/sdb
- /dev/sdc.

Also, there are two partitions on the first device, as evidenced by the /dev/sda1 and /dev/sda2 files, and one partition on the second device, as evidenced by the /dev/sdb1 file:

The fdisk command can be used to display further information about the partitions:

> Note: The following command requires root access.

⁠⁠​ ⁠

```bash
root@localhost:~$ ls /dev/sd*
/dev/sda /dev/sda1  /dev/sda2  /dev/sdb  /dev/sdb1  /dev/sdc
root@localhost:~$ fdisk -l /dev/sda
Disk /dev/sda: 21.5 GB, 21474836480 bytes
255 heads, 63 sectors/track, 2610 cylinders, total 41943040 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000571a2
   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048    39845887    19921920   83  Linux
/dev/sda2        39847934    41940991     1046529    5  Extended
/dev/sda5        39847936    41940991     1046528   82  Linux swap / Solaris
```

> Note: Creating and modifying partitions is beyond the scope of this course. For more information, check out NDG Linux I.

# 12.7 Solid State Disks

While the phrase hard disk is typically considered to encompass traditional spinning disk devices, it can also refer to the newer and very different solid state drives or disks.

Consider the difference between a traditional spinning platter hard disk and a USB thumb drive. The former literally has spinning disk platters in it that are read by drive heads, and the spinning disks are laid out to take advantage of the spinning nature of the device. Data is written (and read) in long strings of sequential blocks that a drive head encounters as the platter spins around.

Solid state disks are essentially larger capacity USB thumb drives in construction and function. As there are no moving parts, and no spinning disks, just memory locations to be read by the controller, a solid state disk is measurably and visibly faster in accessing the information stored in its memory chips.

A solid state disk is controlled by an **embedded or onboard processor** that makes the decisions as to where and how data is written and read back from the memory chips when requested.

Advantages of a solid state disk include lower power usage, time savings in system booting, faster program loads, and less heat and vibration from no moving parts. Disadvantages include higher costs in comparison to spinning hard disks, lower capacity due to the higher cost, and if soldered directly on the motherboard/mainboard, no ability to upgrade by swapping out the drive.

Note: For the purposes of this course, and for understanding, we will refer to all disks, spinning or solid state, as hard disks unless there is an important distinction that requires us to differentiate between the two.

## 12.8 Optical Drives

Optical drives, often referred to as CD-ROMs, DVDs, or Blu-Ray, are removable storage media. While some devices used with optical disks are read-only, others are capable of burning (writing to) disks, when using a writable type of disk. There are various standards for writable and rewritable disks, such as CD-R, CD+R, DVD+RW, and DVD-RW.

Where these removable disks are mounted in the file system is an important consideration for a Linux administrator. Modern distributions often mount the disks under the /media folder, while older distributions typically mount them under the /mnt folder. For example, a USB thumb drive might be mounted on the /media/usbthumb path.

Upon mounting, most GUI interfaces prompt the user to take some action, such as open the contents of the disk in a file browser or start a media program. When the user is finished using the disk, it is necessary to unmount it using a menu or the umount command.

## 12.9 Managing Devices

Linux by nature has a number of distributions or versions, a large portion of which are focused on mainstream hardware, while others run on relatively obscure types or models of hardware. It's safe to say that there is a Linux distribution specifically designed for just about all modern hardware platforms, and for many historical platforms as well.

Each of these hardware platforms has a great deal of variety in the components that are available. In addition to several different types of hard drives, there are many different graphics cards, monitors and printers. With the popularity of USB devices, such as USB storage devices, cameras, and mobile phones, the number of available devices you would want to connect to a Linux system can number in the thousands.

The sheer number of different devices poses problems as these hardware devices typically need drivers, software that allows them to communicate with the installed operating system.

The driver could be compiled as part of the Linux kernel, loaded into the kernel as a module, or loaded by a user command or application. External devices, like scanners and printers, typically have their drivers loaded by an application and these drivers, in turn, communicate through the device via the kernel through an interface such as USB.

Hardware manufacturers often provide this software, but typically for Microsoft Windows, not for Linux. This has been changing with the increasing popularity of Linux overall, but the desktop market share of Linux remains a very distant third to Microsoft and Apple systems.

Partly because there is relatively sparse vendor support, there is a great deal of community support from developers who strive to provide drivers for Linux systems. Although not all hardware has the necessary drivers, there is a decent amount that does, making the challenge for Linux users and administrators to either find the correct drivers or choose hardware that has some level of support in Linux.

In order to be successful in enabling devices in Linux, it is best to check the Linux distribution to see if the device is certified to work with that distribution. Commercial distributions like Red Hat and SUSE have web pages dedicated to listing hardware that is certified or approved to work with their software.

Additional tips on being successful with connecting your devices: avoid brand new or highly-specialized devices and check with the vendor of the device to see if they support Linux before making a purchase.

## 12.10 Video Display Devices

In order to display output to the monitor, the computer system must have a video display device (video card) and a monitor. Video display devices are often directly built into or attached to the motherboard, although they can also be connected through the PCI bus slots on the motherboard.

With the large array of video device vendors, each video display device usually requires a proprietary driver provided by the vendor. All drivers, but most especially video device drivers, must be written for the specific operating system, something that is commonly done for Microsoft Windows, but not always for Linux. Fortunately, most of the larger video display vendors now provide at least some level of Linux support. The Linux community has done an incredible amount of work developing standard drivers for video cards.

> Note: The video support issues that Linux has experienced are mostly focused on the desktop market for Linux. Server market share is mostly unaffected by the GUI, as the vast majority of Linux server implementations are text mode.

There are three types of video cables commonly used: the older but still used analog 15-pin Video Graphics Array (VGA) cable, the more recent 29-pin Digital Visual Interface (DVI) interface and the very widely used High-Definition Multimedia Interface (HDMI) which supports resolutions up to the 4K or Ultra HD range.

For monitors to work correctly with video display devices, they must be able to support the same resolution as the video display device. Normally, the software driving the video display device can automatically detect the maximum resolution that the video display and monitor can both support and set the screen resolution to that value.
