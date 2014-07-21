From: Thomas Martin <tmartincpp@gmail.com>
Subject: Re: ipset and hash:net,iface type
Date: Mon, 21 Jul 2014 12:07:39 +0000 (UTC)
Message-ID: <loom.20140721T133934-700@post.gmane.org>
References: <CAO1iXZ+-i+vQt64ZSwUEiwqGOeNs9=DkMg-Vptz5x3i=1k7_KA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

This is it.
When I try without renaming my vlans interfaces this is working...

Here is a simple test:

1) initial test
a) no iptables configuration (accep all)
# iptables -L -vn
Chain INPUT (policy ACCEPT 1090 packets, 216K bytes)
 pkts bytes target     prot opt in     out     source              
destination         
Chain FORWARD (policy ACCEPT 13 packets, 708 bytes)
 pkts bytes target     prot opt in     out     source              
destination         
Chain OUTPUT (policy ACCEPT 1044 packets, 223K bytes)
 pkts bytes target     prot opt in     out     source               destination

b) telnet from 172.20.128.41 (work as expected):
$ telnet 172.20.130.200 631
Trying 172.20.130.200...
Connected to 172.20.130.200.
Escape character is '^]'.
^]quit
telnet> quit
Connection closed.


2) ipset's configuration:
ipset list all_users_if
Name: all_users_if
Type: hash:net,iface
Revision: 0
Header: family inet hashsize 4096 maxelem 65536
Size in memory: 33168
References: 1
Members:
172.20.130.0/24,vlan130
172.20.130.0/24,internal.130


3) I will try to block the telnet without renaming the interface
a)
# ifconfig internal.130
internal.130 Link encap:Ethernet  HWaddr blablabla  
          inet addr:172.20.130.252  Bcast:172.20.130.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:440 errors:0 dropped:0 overruns:0 frame:0
          TX packets:22 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:18840 (18.3 KiB)  TX bytes:1572 (1.5 KiB)

b)
# iptables -L -vn
Chain INPUT (policy ACCEPT 26 packets, 2770 bytes)
 pkts bytes target     prot opt in     out     source              
destination         
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source              
destination         
    0     0 REJECT     all  --  *      *       0.0.0.0/0           
0.0.0.0/0            state NEW match-set all_users_if dst,dst reject-with
icmp-port-unreachable
Chain OUTPUT (policy ACCEPT 22 packets, 3441 bytes)
 pkts bytes target     prot opt in     out     source               destination

c) As expected the telnet was blocked
$ telnet 172.20.130.200 631
Trying 172.20.130.200...
telnet: Unable to connect to remote host: Connection refused

Ipset works as expected!


4) I will do the exact same test with internal.130 renamed to vlan130:
a) ifrename -i internal.130 -n vlan130
# ifconfig vlan130
vlan130   Link encap:Ethernet  HWaddr blablabla
          inet addr:172.20.130.252  Bcast:172.20.130.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:84 (84.0 B)  TX bytes:238 (238.0 B)

b)
# iptables -L -vn
Chain INPUT (policy ACCEPT 14 packets, 1371 bytes)
 pkts bytes target     prot opt in     out     source              
destination         
Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source              
destination         
    0     0 REJECT     all  --  *      *       0.0.0.0/0           
0.0.0.0/0            state NEW match-set all_users_if dst,dst reject-with
icmp-port-unreachable
Chain OUTPUT (policy ACCEPT 11 packets, 1606 bytes)
 pkts bytes target     prot opt in     out     source               destination

c) This time the telnet is still working:
$ telnet 172.20.130.200 631
Trying 172.20.130.200...
Connected to 172.20.130.200.
Escape character is '^]'.
^]quit
telnet> quit
Connection closed.


So it seems that ipset is having some issue working with ifrename.



