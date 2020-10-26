# Chapter 14 - Network Configuration

## 14.1 Introduction

Having access to the network is a key feature of most Linux systems. Users want to surf the net, send and receive email and transfer files with other users.

Typically the programs that perform these functions, such as web browsers and email clients, are reasonably easy to use. However, they all rely on an important feature: the ability of your computer to communicate with another computer. To have this communication, you need to know how to configure your system's network.

Linux provides you with several tools to both configure your network as well as monitor how it is performing.‌⁠​​⁠​ 

## 14.2 Basic Network Terminology

Before setting up a network or accessing an existing network, it is beneficial to know some key terms that are related to networking. This section explores the terms with which you should be familiar. Some of the terms are basic, and you may already be familiar with them. However, others are more advanced.

- **Host** = A host is a computer. Many people automatically think of a desktop computer or laptop when they hear the term computer. In reality, many other devices, such as cell phones, digital music players and many modern televisions, are also computers. In networking terms, a host is *any device that communicates via a network with another device*.
- **Network** = A network is a *collection of two or more hosts (computers) that are able to communicate with each other*. This communication can be via a wired connection or wireless.
- **Internet** = The Internet is an example of a network. It consists of a publicly accessible network that connects millions of hosts throughout the world. Many people use the Internet to surf web pages and exchange emails, but the Internet has many additional capabilities besides these activities.
- **Wi-Fi**	= The term Wi-Fi refers to wireless networks.
- **Server** = A *host that provides a service to another host or client* is called a server. For example, a web server stores, processes and delivers web pages. An email server receives incoming mail and delivers outgoing mail.
- **Service** = A *feature provided by a host* is a service. An example of a service would be when a host provides web pages to another host.
- **Client** = A client is a *host that is accessing a server*. When you are working on a computer surfing the Internet, you are considered to be on a client host.
- **Router** = Also called a gateway, a router is a *machine that connects hosts from one network to another network*. For example, if you work in an office environment, the computers within the company can all communicate via the local network created by the administrators. To access the Internet, the computers would have to communicate with a router that would be used to forward network communications to the Internet. Typically when you communicate on a large network (like the Internet), several routers are used before your communication reaches its final destination.

## 14.3 Networking Features Terminology

In addition to the networking terms discussed in the last section, there are some additional terms with which you should be familiar. These terms focus more on the different types of networking services that are commonly used, as well as some of the techniques that are used to communicate between machines.

- **Packet** = A network packet is used to send network communication between hosts. By breaking down communication into smaller chunks (packets), the data delivery method is much more efficient.
- **IP Address** = An Internet Protocol (IP) address is a *unique number assigned to a host on a network*. Hosts use these numbers to address network communication.
- **Mask** = Also called a netmask, subnet mask or mask, a network mask is *a number system that can be used to define which IP addresses are considered to be within a single network*. Because of how routers perform their functions, networks have to be clearly defined.
- **Hostname** = Each host on a network could have its own hostname because names are more natural for humans to remember than numbers, making it easier for us to address network packets to another host. Hostnames are translated into IP addresses before the network packet is sent on the network.
- **URL** = A Uniform Resource Locator (URL), also commonly called a web address, is used to locate a resource, like a web page, on the internet. It’s what you type into your web browser to access a web page. For example, http://www.netdevgroup.com. It includes the protocol http:// and the hostname www.netdevgroup.com.
- **DHCP** = Hosts can be assigned hostnames, IP addresses and other network-related information by a DHCP (Dynamic Host Configuration Protocol) server. In the world of computers, a **protocol** is a well-defined set of rules. DHCP defines *how network information is assigned to client hosts*, and the **DHCP server** is the machine that provides this information.
- **DNS** = As mentioned previously, hostnames are translated into IP addresses, prior to the network packet being sent on the network. So your host needs to know the IP address of all of the other hosts with which you are communicating. When working on a large network (like the Internet), this can pose a challenge as there are so many hosts. A Domain Name System (DNS) *provides the service of translating domain names into IP addresses*.
- **Ethernet** = In a wired network environment, Ethernet is the most common way to physically connect the hosts into a network. Ethernet cables are connected to network cards that support Ethernet connections. Ethernet cables and devices (such as routers) are specifically designed to support different communication speeds, the lowest being 10 Mbps (10 Megabits per second) and the highest being 100 Gbps (100 gigabits per second). The most common speeds are 100 Mbps and 1 Gbps.
- **TCP/IP** = The Transmission Control Protocol/Internet Protocol (TCP/IP) is a fancy name for a *collection of protocols (remember, protocol = set of rules) that are used to define how network communication should take place between hosts*. While it isn't the only collection of protocols used to define network communication, it is the most often utilized one. As an example, TCP/IP includes the definition of how IP addresses and network masks work.

## 14.4 IP Addresses

As previously mentioned
- hosts address network packets by using the IP address of the destination machine. 
- The network packet also includes a return address (the IP address of the sending machine).


For many years, the IP addressing technique that was used by all computers was IPv4. In an IPv4 address, a total of four 8-bit numbers are used to define the address. This is considered a 32-bit address (4 x 8 = 32). For example: `192.168.10.120`. 

- 8-bit refers to numbers from 0 to 255.
- In an IPv4 environment, there is a technical limit of about 4.3 billion IP addresses. However, many of these IP addresses are not usable for various reasons. Also, many organizations haven't made use of all of the IP addresses they have available.
- While it seems like there should be plenty of IP addresses to go around, various factors have led to a problem: the Internet started running out of IP addresses.

This issue encouraged the development of IPv6. IPv6 was officially created in 1998. In an IPv6 network the addresses are much larger, 128-bit addresses that look like this: `2001:0db8:85a3:0042:1000:8a2e:0370:7334`


- Essentially, this provides for a much larger address pool, so large that running out of addresses any time in the near future is very unlikely.
- It is important to note that the difference between IPv4 and IPv6 isn't just a larger address pool. IPv6 has many other advanced features that address some of the limitations of IPv4, including better speed, more advanced package management and more efficient data transportation.

Considering all the advantages, you would think that by now all hosts would be using IPv6. However, the majority of network-attached devices in the world still use IPv4 (something like 98-99% of all devices).

So, why hasn't the world embraced the superior technology of IPv6?

There are primarily two reasons:

- **NAT**: Invented to overcome the possibility of running out of IP addresses in an IPv4 environment, **Net Address Translation** (NAT) used *a technique to provide more hosts access to the Internet*. In a nutshell, a group of hosts is placed into a private network with no direct access to the Internet; a special router provides Internet access, and only this one router needs an IP address to communicate on the Internet. In other words, a group of hosts shares a single IP address, meaning a lot more computers can attach to the Internet. This feature means the need to move to IPv6 is less critical than before the invention of NAT.
- **Porting**: Porting is switching over from one technology to another. IPv6 has a lot of great new features, but all of the hosts need to be able to utilize these features. Getting everyone on the Internet (or even just some) to make these changes poses a challenge. ‌⁠​​⁠​ 

Nonetheless, most experts agree that IPv6 will eventually replace IPv4, so understanding the basics of both is recommended for those who work in the IT industry.

## 14.5 Configuring Network Devices

When you are configuring network devices, there are two initial questions that you need to ask:

- Wired vs wireless : Configuring a wireless device is slightly different to configuring a wired device because of some of the additional features typically found on wireless devices (such as security).
- DHCP vs static address? Recall that a DHCP server provides network information, such as your IP address and subnet mask. If you don't make use of a DHCP server, then you will need to manually provide this information to your host, which is called using a **static IP address**. ‌⁠​​⁠​ 
  
- Generally speaking, desktop machines use wired networks, while laptops use wireless networks. Normally a wired machine uses a static IP address, but these can also often be assigned via a DHCP server. 
- In almost all cases, wireless machines use DHCP since they are almost always mobile and attached to different networks.

### 14.5.1 Configuring the Network Using Configuration Files

There will be times when no GUI-based tool is available. In those cases, it is helpful to know the configuration files that are used to store and modify network data.
​​⁠​
> These files may vary depending on the Linux distribution that you are working on.

#### 14.5.1.1 Primary IPv4 Configuration File

The primary configuration file for an IPv4 network interface is the `/etc/sysconfig/network-scripts/ifcfg-eth0` file. The following demonstrates what this file looks like when configured for a static IP address:

```console
root@localhost:~# cat /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE="eth0"
BOOTPROTO=none
NM_CONTROLLED="yes"
ONBOOT=yes
TYPE="Ethernet"
UUID="98cf38bf-d91c-49b3-bb1b-f48ae7f2d3b5"
DEFROUTE=yes
IPV4 _FAILURE_FATAL=yes
IPV6INOT=no
NAME="System eth0"
IPADDR=192.168.1.1
PREFIX=24
GATEWAY=192.168.1.1
DNS1=192.168.1.2
HWADDR=00:50:56:90:18:18
LAST_CONNECT=1376319928
```

If the device were configured to be a DHCP client, the **BOOTPROTO** value *would be set to* **dhcp**, and the **IPADDR**, **GATEWAY** and **DNS1** values *would not be set*.

#### 14.5.1.2 Primary IPv6 Configuration File

On a CentOS system, the primary IPv6 configuration file is the same file where IPv4 configuration is stored; the `/etc/sysconfig/network-scripts/ifcfg-eth0` file. If you want to have your system have a static IPv6 address, add the following to the configuration file:

```bash
IPV6INIT=yes
IPV6ADDR=<IPv6 IP Address>
IPV6_DEFAULTGW=<IPv6 IP Gateway Address>
```

- If you want your system to be a DHCP IPv6 client, then add the following setting:
- You also need to add the following setting to the /etc/sysconfig/network file:
  
```bash
DHCPV6C=yes
```
```bash
NETWORKING_IPV6=yes
```


> The widely accepted method of making changes to a network interface is to take the interface down using a command such as `ifdown eth0`, make the desired changes to the configuration file, and then bring the interface back up and into service with a command such as `ifup eth0`.

> Another less specific method is to restart the system’s networking entirely, with a command such as `service network restart`, which takes down ALL interfaces, re-reads all related configuration files, and then restarts the networking for the system.

> Restarting the network service can disrupt much more than just the single interface a user wanted to change, so use the most limited and specific commands to restart the interface if possible.

The following example demonstrates how the service command would need to be executed on a CentOS system:

```bash
[root@localhost ~]# service network restart
Shutting down interface eth0:  Device state: 3 (disconnected)
                                                           [  OK  ]
Shutting down loopback interface:                          [  OK  ]
Bringing up loopback interface:                            [  OK  ]
Bringing up interface eth0:  Active connection state: activated
Active connection path: /org/freedesktop/NetworkManager/ActiveConnection/1
                                                           [  OK  ]
```

#### 14.5.1.3 Domain Name System (DNS)

When a computer is asked to access a website, such as www.example.com, it does not necessarily know what IP address to use. For the computer to associate an IP address with the URL or hostname request, the computer relies upon the DNS service of another computer. Often, the IP address of the DNS server is discovered during the **DHCP request**, while a computer is receiving important addressing information to communicate on the network.

The address of the DNS server is stored in the `/etc/resolv.conf` file. A typical /etc/resolv.conf file is automatically generated and looks like the following:

```bash
sysadmin@localhost:~$ cat /etc/resolv.conf                     
nameserver 127.0.0.1   
```                           

The nameserver setting is often set to the IP address of the DNS server. The following example uses the host command, which works with DNS to associate a hostname with an IP address. Note that the example server is associated with the IP address 192.168.1.2 by the DNS server:

```bash
sysadmin@localhost:~$ host example.com                         
example.com has address 192.168.1.2 
```

It is also common to have multiple nameserver settings, in the event that one DNS server isn't responding.

#### 14.5.1.4 Network Configuration Files

Name resolution on a Linux host is accomplished by 3 critical files: 

- /etc/hosts = location of name service information
- /etc/resolv.conf = order in which to check resources,
- /etc/nsswitch.conf = where to go for that information

| Files              | Explanation                                                                                                                                                                                                                                |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| /etc/hosts         | This file contains a table of hostnames to IP addresses. It can be used to supplement a DNS server.                                                                                                                                        |
| /etc/resolv.conf   | contains the IP addresses of the name servers the system uses attempting to resolve names to IP addresses. These servers are often DNS servers. It also can contain additional keywords and values that can affect the resolution process. |
| /etc/nsswitch.conf | the file can be used to modify where hostname lookups occur. It contains a particular entry that describes in what order name resolution sources are consulted.                                                                            |
|                    |


‌⁠​​⁠​ 
```bash
sysadmin@localhost:~$ cat /etc/hosts  
127.0.0.1       localhost
sysadmin@localhost:~$ cat /etc/resolv.conf  
nameserver 127.0.0.11
sysadmin@localhost:~$ cat /etc/nsswitch.conf 
# /etc/nsswitch.conf
# 

Output Omitted...

hosts:          files dns

Output Omitted...
```
	

- The /etc/hosts file is searched first, the DNS server second: `hosts: files dns` 
- The DNS server would be searched first, local files second: `hosts: dns files`

Commands or programs on the system, such as the browser, request a connection with a remote computer by DNS name. Then the system consults various files in a particular order to attempt to resolve that name into a usable IP address.

1.  the `/etc/nsswitch.conf` file is consulted: `hosts:	files dns` --> This line indicates that the system should consult local files first in an attempt to resolve hostnames, which means that the /etc/hosts file will be parsed for a match to the requested name.
2. the system will consult the `/etc/hosts` file to attempt to resolve the name. If the name matches an entry in /etc/hosts, it is resolved. --> It will not failover (or continue) to the DNS option, even if the resolution is inaccurate. This can occur if the entry in /etc/hosts points to a non-assigned IP address.
3. if the local /etc/hosts file doesn’t result in a match, the system will use the configured DNS server entries contained in the `/etc/resolv.conf `file to attempt to resolve the name.

The `/etc/resolv.conf` file should contain at least two entries for name servers, such as the example file below:

```bash
nameserver 10.0.2.3
nameserver 10.0.2.4
```

The DNS resolution system will use the first name server for an attempted lookup of the name. If that is unavailable, or a timeout period is reached, the second server will then be queried for the name resolution. If a match is found, it is returned to the system and used for initiating a connection and is also placed in the DNS cache for a configurable time period.


> Two other keywords may appear in the system’s /etc/resolv.conf file. Although these are beyond the scope of this course, they are routinely included in default /etc/resolv.conf files and so we include explanations of these terms below:

- domain : Followed by a qualified domain, such as snowblower.example.com, allows the query for the host polaris to be tried both just as the host polaris, or failing that, appending the rest of the domain name to it and hopefully having it resolved by the server as that name (e.g. polaris.snowblower.example.com.).
- search : Followed by a set of separate domains which can be queried one after the other hopefully to resolve the name.

## 14.6 Network Tools

There are several commands that you can use to view network information. These tools can also be useful when you are troubleshooting network issues.

### 14.6.1 The ifconfig Command

The `ifconfig` command stands for interface configuration and is used to display network configuration information. Not all network settings are covered in this course, but it is important to note from the output below that the IP address of the primary network device eth0 is 192.168.1.2 and that the device is currently active UP:

```bash
root@localhost:~# ifconfig                                     
eth0      Link encap:Ethernet  HWaddr b6:84:ab:e9:8f:0a    
          inet addr:192.168.1.2  Bcast:0.0.0.0  Mask:255.255.255.0  
          inet6 addr: fe80::b484:abff:fee9:8f0a/64 Scope:Link       
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1        
          RX packets:95 errors:0 dropped:4 overruns:0 frame:0       
          TX packets:9 errors:0 dropped:0 overruns:0 carrier:0      
          collisions:0 txqueuelen:1000                              
          RX bytes:25306 (25.3 KB)  TX bytes:690 (690.0 B)          
lo        Link encap:Local Loopback                               
          inet addr:127.0.0.1  Mask:255.0.0.0                       
          inet6 addr: ::1/128 Scope:Host                           
          UP LOOPBACK RUNNING  MTU:65536  Metric:1                  
          RX packets:6 errors:0 dropped:0 overruns:0 frame:0        
          TX packets:6 errors:0 dropped:0 overruns:0 carrier:0      
          collisions:0 txqueuelen:0                                 
          RX bytes:460 (460.0 B)  TX bytes:460 (460.0 B)
```

The **lo device** is referred to as the loopback device. It is a special network device used by the system when sending network-based data to itself.
The ifconfig command can also be used to modify network settings temporarily. Typically these changes should be permanent, so using the ifconfig command to make such changes is relatively rare.

### 14.6.2 The ip Command

The ifconfig command is becoming obsolete in some Linux distributions (deprecated) and is being replaced with a form of the ip command, specifically `ip addr show`.

The ip command differs from ifconfig in several important manners, chiefly that through its increased functionality and set of options, it can almost be a one-stop shop for configuration and control of a system’s networking. The format for the ip command is as follows:

`ip [OPTIONS] OBJECT COMMAND`

While ifconfig is limited primarily to modification of networking parameters, and displaying the configuration details of networking components, the ip command branches out to do some of the work of several other legacy commands such as route and arp.

> Linux and Unix commands don’t usually just disappear when they become obsolete; they stick around as a legacy command, sometimes for many years, as the number of scripts that depend on those commands, and the amount of muscle memory amongst system administrators, makes it a good idea to keep them around for compatibility sake.

The ip command can initially appear to be a little more verbose than the ifconfig command, but it’s a matter of phrasing and a result of the philosophy behind the operation of the ip command.

In the example below, both the ifconfig command and ip command are used to show all interfaces on the system.

```bash
root@localhost:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 00:0c:29:71:f0:bb  
          inet addr:172.16.241.140  Bcast:172.16.241.255  Mask:255.255.255.0
          inet6 addr: fe80::20c:29ff:fe71:f0bb/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:8506 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1201 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:8933700 (8.9 MB)  TX bytes:117237 (117.2 KB)
 
lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:285 errors:0 dropped:0 overruns:0 frame:0
          TX packets:285 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1 
          RX bytes:21413 (21.4 KB)  TX bytes:21413 (21.4 KB)
root@localhost:~# ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 00:0c:29:71:f0:bb brd ff:ff:ff:ff:ff:ff
    inet 172.16.241.140/24 brd 172.16.241.255 scope global eth0
       valid_lft forever preferred_lft forever
    inet6 fe80::20c:29ff:fe71:f0bb/64 scope link 
       valid_lft forever preferred_lft forever
```

Both show the type of interface, protocols, hardware and IP addresses, network masks and various other information about each of the active interfaces on the system.

### 14.6.3 The route Command

Recall that a router (or gateway) is a machine that allows hosts from one network to communicate with another network. To view a table that describes where network packages are sent, use the route command:

The first highlighted line in the preceding example indicates that any network package sent to a machine in the 192.168.1 network is not sent to a gateway machine (the * indicates no gateway). The second highlighted line indicates that all other network packets are sent to the host with the IP address of 192.168.1.1 (the router).

Some users prefer to display this information with numeric data only, by using the -n option to the route command. For example, look at the following and focus on where the output used to display default:

The 0.0.0.0 refers to all other machines, and is the same as default.

```bash
root@localhost:~# route                                             
Kernel IP routing table                                             
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface   
192.168.1.0     *               255.255.255.0   U     0      0        0 eth0  
default         192.168.1.1     0.0.0.0        UG     0      0        0 eth0 
root@localhost:~# route -n                                                      
Kernel IP routing table                                                         
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface   
192.168.1.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0  
0.0.0.0        192.168.1.1     0.0.0.0         UG    0      0        0 eth0  
```

The route command is becoming obsolete in some Linux distributions (deprecated) and is being replaced with a form of the ip command, specifically ip route show. Note that the same information highlighted above can also be found using this command:

```bash
root@localhost:~# ip route show
default via 192.168.1.254 dev eth0 proto static                                
192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.2         
```

### 14.6.4 The ping Command

The ping command can be used to determine if another machine is reachable. If the ping command can send a network package to another machine and receive a response, then you should be able to connect to that machine.

By default, the ping command continues sending packages endlessly. To limit how many pings to send, use the `-c` option followed by a number indicating how many iterations you desire. The following examples show ping being limited to 4 iterations.

If the ping command is successful, it looks like the following example:
`
```bash
root@localhost:~# ping -c 4 192.168.1.2                                       
PING 192.168.1.2 (192.168.1.2) 56(84) bytes of data.                          
64 bytes from 192.168.1.2: icmp_req=1 ttl=64 time=0.051 ms                    
64 bytes from 192.168.1.2: icmp_req=2 ttl=64 time=0.064 ms                    
64 bytes from 192.168.1.2: icmp_req=3 ttl=64 time=0.050 ms                    
64 bytes from 192.168.1.2: icmp_req=4 ttl=64 time=0.043 ms                    
                                                                              
--- 192.168.1.2 ping statistics ---                                           
4 packets transmitted, 4 received, 0% packet loss, time 2999ms                
rtt min/avg/max/mdev = 0.043/0.052/0.064/0.007 ms

# If the ping command fails, a message stating, Destination Host Unreachable displays:

root@localhost:~# ping -c 4 192.168.1.1                                       
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.                          
From 192.168.1.2 icmp_seq=1 Destination Host Unreachable                      
From 192.168.1.2 icmp_seq=2 Destination Host Unreachable                      
From 192.168.1.2 icmp_seq=3 Destination Host Unreachable                      
From 192.168.1.2 icmp_seq=4 Destination Host Unreachable                      
                                                                                
--- 192.168.1.1 ping statistics ---                                           
4 packets transmitted, 0 received, +4 errors, 100% packet loss, time 2999ms   
pipe 4    
```
                                                                    
> It is important to note that just because the ping command fails does not mean that the remote system is unreachable. Some administrators configure their machines (and even entire networks!) to not respond to ping requests because a server can be attacked by something called a denial of service attack. In this sort of attack, a server is overwhelmed by a massive number of network packets. By ignoring ping requests, the server is less vulnerable.

As a result, the ping command may be useful for checking the availability of local machines, but not always for machines outside of your own network.

Consider This

> Many administrators use the ping command with a hostname, and if that fails then use the IP address to see if the fault is in resolving the device’s hostname. Using the hostname first saves time; if that ping command is successful, there is proper name resolution, and the IP address is functioning correctly as well.

### 14.6.5 The netstat Command

The netstat command is a powerful tool that provides a large amount of network information. It can be used to display information about network connections as well as display the routing table similar to the route command.

For example, to display statistics regarding network traffic, use the `-i` option to the netstat command:

The most important statistics from the output above are 

- TX-OK
- TX-ERR --> A high percentage of TX-ERR may indicate a problem on the network, such as too much network traffic
  
```bash
root@localhost:~# netstat -i                                                  
Kernel Interface table                                                        
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500 0       137      0      4 0        12      0      0      0 BMRU
lo        65536 0        18      0      0 0        18      0      0      0 LRU
```

To use the netstat command to display routing information, use the `-r` option:

```bash
root@localhost:~# netstat -r                                                  
Kernel IP routing table                                                       
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
192.168.1.0     *               255.255.255.0   U         0 0          0 eth0 
default         192.168.1.1     0.0.0.0        UG         0 0          0 eth0 
```

The netstat command is also commonly used to display open ports. **A port** is *a unique number that is associated with a service provided by a host*. If the port is open, then the service is available for other hosts.

For example, you can log into a host from another host using a service called *SSH*. The SSH service is assigned port **#22**. So, if port #22 is open, then the service is available to other hosts.

It is important to note that the host also needs to have the services running itself; this means that the service (in this case the ssh daemon) that allows remote users to log in needs to be started (which it typically is, for most Linux distributions).

To see a list of all currently open ports, use the following command:

```bash
root@localhost:~# netstat -tln                                                
Active Internet connections (only servers)                                    
Proto Recv-Q Send-Q Local Address           Foreign Address         State     
tcp        0      0 192.168.1.2:53          0.0.0.0:*               LISTEN    
tcp        0      0 127.0.0.1:53            0.0.0.0:*               LISTEN    
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN    
tcp        0      0 127.0.0.1:953           0.0.0.0:*               LISTEN    
tcp6       0      0 :::53                   :::*                    LISTEN    
tcp6       0      0 :::22                  :::*                    LISTEN   
tcp6       0      0 ::1:953                 :::*                    LISTEN  
```  

As you can see from the output above, port #22 is listening, which means it is open.

In the previous example, 
- `-t` stands for TCP (recall this protocol from earlier in this chapter)
- `-l` stands for listening (which ports are listening)
- `-n` stands for show numbers, not names.

Sometimes showing the names can be more useful. This can be achieved by dropping the -n option:

```bash
root@localhost:~# netstat -tl                                                   
Active Internet connections (only servers)                                      
Proto Recv-Q Send-Q Local Address           Foreign Address          State     
tcp        0      0 cserver.example.:domain *:*                     LISTEN    
tcp        0      0 localhost:domain        *:*                     LISTEN    
tcp        0      0 *:ssh                   *:*                     LISTEN    
tcp        0      0 localhost:953           *:*                     LISTEN    
tcp6       0      0 [::]:domain             [::]:*                  LISTEN    
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN    
tcp6       0      0 localhost:953           [::]:*                  LISTEN    
```

On some distributions you may see the following message in the man page of the netstat command:

```
NOTE
     This program is obsolete. Replacement for netstat is ss. Replacement for 
     netstat -r is ip route. Replacement for netstat -i is ip -s link. 
     Replacement for netstat -g is ip maddr.
```

While no further development is being done on the netstat command, it is still an excellent tool for displaying network information. The goal is to eventually replace the netstat command with commands such as the ss and ip commands. However, it is important to realize that this may take some time.

### 14.6.6 The ss Command

The **ss command** is *designed to show socket statistics and supports all the major packet and socket types*. Meant to be a replacement for and to be similar in function to the netstat command, it also shows a lot more information and has more features.

The main reason a user would use the ss command is to view what connections are currently established between their local machine and remote machines, statistics about those connections, etc.

Similar to the netstat command, you can get a great deal of useful information from the ss command just by itself as shown in the example below.

The format of the output of the ss command can change dramatically, given the options specified, such as the use of the -s option, which displays mostly the types of sockets, statistics about their existence and numbers of actual packets sent and received via each socket type, as shown below:

```bash
root@localhost:~# ss
Netid  State      Recv-Q Send-Q   	Local Address:Port       	   Peer Address:Port
u_str  ESTAB      0      0                    * 104741                     * 104740 
u_str  ESTAB      0      0      /var/run/dbus/system_bus_socket 14623      * 14606  
u_str  ESTAB      0      0      /var/run/dbus/system_bus_socket 13582      * 13581  
u_str  ESTAB      0      0      /var/run/dbus/system_bus_socket 16243      * 16242  
u_str  ESTAB      0      0                    * 16009                      * 16010  
u_str  ESTAB      0      0      /var/run/dbus/system_bus_socket 10910      * 10909  
u_str  ESTAB      0      0      @/tmp/dbus-LoJW0hGFkV 15706                * 15705  
u_str  ESTAB      0      0                    * 24997                 	   * 24998  
u_str  ESTAB      0      0                    * 16242                      * 16243  
u_str  ESTAB      0      0      	@/tmp/dbus-opsTQoGE 15471          * 15470  

root@localhost:~# ss -s
Total: 1000 (kernel 0)
TCP:   7 (estab 0, closed 0, orphaned 0, synrecv 0, timewait 0/0), ports 0
 
Transport Total     IP        IPv6
*	  	0         -         -        
RAW	  	0         0         0        
UDP	  	9         6         3        
TCP	  	7         3         4        
INET	  	16        9         7        
FRAG	  	0         0         0   
```

The output is very similar to the output of the netstat command with no options. The columns above are:

- **Netid**	The socket type and transport protocol
- **State**	Connected or Unconnected, depending on protocol
- **Recv-Q** Amount of data queued up for being processed having been received
- **Send-Q** Amount of data queued up for being sent to another host
- **Local Address**	The address and port of the local host’s portion of the connection
- **Peer Address** The address and port of the remote host’s portion of the connection

> The ss command typically shows many rows of data, and it can be somewhat daunting to try to find what you want in all that output. Consider sending the output to the less command to make the output more manageable. Pagers allow the user to scroll up and down, do searches and many other useful functions inside the parameters of the less command.

While the ss command offers many different options for gathering and displaying information, the examples above are the most common ones, and anything else would be outside of the scope of the exam’s objectives at this level.

### 14.6.7 The dig Command

There may be times when you need to test the functionality of the DNS server that your host is using. One way of doing this is to use the dig command, which *performs queries on the DNS server to determine if the information needed is available on the server*.

In the following example, the dig command is used to determine the IP address of the example.com host:

```bash
root@localhost:~# dig example.com                                              
; <<>> DiG 9.8.1-P1 <<>> example.com                                          
;; global options: +cmd                                                       
;; Got answer:                                                                
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 45155                     
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 0       
                                                                              
;; QUESTION SECTION:                                                          
;example.com.                   IN      A                                     
                                                                              
;; ANSWER SECTION:                                                            
example.com.            86400   IN      A       192.168.1.2                  
;; AUTHORITY SECTION:                                                         
example.com.            86400   IN      NS      example.com.                  
                                                                              
;; Query time: 0 msec                                                         
;; SERVER: 127.0.0.1#53(127.0.0.1)                                            
;; WHEN: Tue Dec  8 17:54:41 2015                                             
;; MSG SIZE  rcvd: 59      
```                             

Note that the response included the IP address of 192.168.1.2, meaning that the DNS server has the IP address to hostname translation information in its database.

If the DNS server doesn't have the requested information, it is configured to ask other DNS servers. If none of them have the requested information, an error message displays:

```bash
root@localhost:~# dig sample.com                                            
; <<>> DiG 9.8.1-P1 <<>> sample.com                                           
;; global options: +cmd 
;; connection timed out; no servers could be reached
```

### 14.6.8 The host Command

In its simplest form, the host command *works with DNS to associate a hostname with an IP address*. As used in a previous example, example.com is associated with the IP address of 192.168.1.2:\

- The host command can also be used in reverse if an IP address is known, but the domain name is not.
- Other options exist to query the various aspects of a DNS such as a CNAME canonical name -alias:
- Since many DNS servers store a copy of example.com, **SOA Start of Authority** records *indicate the primary server for the domain*
- A comprehensive list of DNS information regarding example.com can be found using the -a all option:

```bash
root@localhost:~# host example.com                                            
example.com has address 192.168.1.2                                           
root@localhost:~# host 192.168.1.2                                            
2.1.168.192.in-addr.arpa domain name pointer example.com.                     
2.1.168.192.in-addr.arpa domain name pointer cserver.example.com.             
root@localhost:~# host -t CNAME example.com                                   
example.com has no CNAME record                                               
root@localhost:~# host -t SOA example.com                                     
example.com has SOA record example.com. cserver.example.com. 2 604800 86400 2419200 604800
root@localhost:~# host -a example.com                                         
Trying "example.com"                                                          
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 3549                      
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 3, AUTHORITY: 0, ADDITIONAL: 1       
                                                                              
;; QUESTION SECTION:                                                          
;example.com.                   IN      ANY                                   
                                                                              
;; ANSWER SECTION:                                                            
example.com.            86400   IN      SOA     example.com. cserver.example.com. 2 604800 86400 2419200 604800                                              
example.com.            86400   IN      NS      example.com.                  
example.com.            86400   IN      A       192.168.1.2                   
                                                                              
;; ADDITIONAL SECTION:                                                        
example.com.            86400   IN      A       192.168.1.2                   
                                                                              
Received 119 bytes from 127.0.0.1#53 in 0 ms
```

### 14.6.9 The ssh Command

The ssh command allows you to connect to another machine across the network, log in and then perform tasks on the remote machine.

If you only provide a machine name or IP address to log into, the ssh command assumes you want to log in using the same username that you are currently logged in as. To use a different username, use the syntax: `username@hostname`

To return back to the local machine, use the exit command

```bash
root@localhost:~# ssh bob@test
The authenticity of host ‘test (127.0.0.1)’ can’t be established.
RSA key fingerprint is c2:0d:ff:27:4c:f8:69:a9:c6:3e:13:da:2f:47:e4:c9.
Are you sure you want to continue connection (yes/no)? yes
Warning: Permanently added ‘test’ (RSA) to the list of known hosts.
bob@test’s password:
bob@test:~$ date
Fri Oct   4 16:14:43 CDT 2013  
bob@test:~$ exit
logout
Connection to test closed.
root@localhost:~#      
```

#### 14.6.9.1 RSA Key Fingerprint

When using the ssh command, the first prompt asks you to verify the identity of the machine you are logging into. In most cases, you are going to want to answer yes. While you can check with the administrator of the remote machine to make sure that the RSA key fingerprint is correct, this isn't the purpose of this query. It is designed for future login attempts.

After you answer yes, the RSA key fingerprint of the remote machine is stored on your local system. When you attempt to ssh to this same machine in the future, the RSA key fingerprint provided by the remote machine is compared to the copy stored on the local machine. If they match, then the username prompt appears. If they don't match, an error like the following displays:

```bash 
sysadmin@localhost:~$ ssh bob@test
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@   WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!   @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
Someone could be eavesdropping on you right now (man-in-the-middle attack)!
It is also possible that the RSA host key has just been changed.
The fingerprint for the RSA key sent by the remote host is
c2:0d:ff:27:4c:f8:69:a9:c6:3e:13:da:2f:47:e4:c9.
Please contact your system administrator.
Add correct host key in /home/sysadmin/.ssh/known_hosts to get rid of this message.
Offending key in /home/sysadmin/.ssh/known_hosts:1
RSA host key for test has changed and you have requested strict checking.
Host key verification failed.
```

This error could indicate that a rogue host has replaced the correct host. Check with the administrator of the remote system. If the system were recently reinstalled, it would have a new RSA key, and that would be causing this error.

In the event that this error message is due to a remote machine reinstall, you can remove the `~/.ssh/known_hosts` file from your local system (or just remove the entry for that one machine) and try to connect again:

```bash
sysadmin@localhost:~$ cat ~/.ssh/known_hosts
test ssh-rsa AAAAB3NzaC1yc2EAAAAmIwAAAQEAklOUpkDHrfHY17SbrmTIp/RZ0V4DTxgq9wzd+ohy006SWDSGPA+nafzlHDPOW7vdI4mZ5ew18KL4JW9jbhUFrviQzM7xlELEVf4h9lFX5QVkbPppSrg0cda3Pbv7kOdJ/MTyBlWXFCRH+Cv3FXRitBqxiX1nKhXpHAZsMciLq8V6RjsNAQwdsdMFvSlVK/7BA
t5FaiKoAfncM1Q8x3+2V0Ww71/eIFmb1zuUFljHYTprrX88XypNDvjYNby6vw/Pb0rwprz/Tn
mZAW3UX+PnTPI89ZPmNBLuxyrD2cE86Z/il8b+gw3r3+1nJotmIkjn2so1d01QraTlMqVSsbx
NrRFi9wrf+ghw==
sysadmin@localhost:~$ rm ~/.ssh/known_hosts
sysadmin@localhost:~$ ssh bob@test
The authenticity of host ‘test (127.0.0.1)’ can’t be established.
RSA key fingerprint is c2:0d:ff:27:4c:f8:69:a9:c6:3e:13:da:2f:47:e4:c9.
Are you sure you want to continue connection (yes/no)? yes
Warning: Permanently added ‘test’ (RSA) to the list of known hosts.
bob@test’s password:
Last login: Fri Oct   4 16:14:39 CDT 2013  from localhost
```
