From: "ISC Jorge Ceron Galvan" <jorgec@acerlandslp.com.mx>
Subject: Re: Odd issue with two SNATed Firewalls and Wireless router
Date: Wed, 24 Aug 2005 13:43:07 -0500
Message-ID: <WorldClient-F200508241343.AA43070008@acerlandslp.com.mx>
References: <1124886644.9968.186.camel@andrew.iface.lan>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1124886644.9968.186.camel@andrew.iface.lan>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



I've been dealing with the same problem for a while and I thougth it was not a routing 
problem, but after I read your mail I don't know.

I'll tell you what I've done just to see if we can find out a solution.

I'm not doing nat because I want a real IP at my wireless client.

cisco eth0  200.0.0.1/24

linux eth0  200.0.0.10/24  gw 200.0.0.1/24

linux eth1  200.0.0.129/27

remote fortinet router eth0 200.0.0.130/27   gw 200.0.0.129

I thougth it could be a routing problem because I'm using subnet 0 at eth0, and at eth1 I 
set up a subnet from eth0. It's not an iptables issue because I'm not using it at all. The 
configuration is quite simple, but I don't know whether you can subnet a class C net this 
way. The mail server we are trying to reach is somewhere in the internet. 

I'm using a wireless AP at my side and a wireless bridge at the other side; the bridge is 
connected directly to the fortinet router. Could it be a protocol bridge problem?

Any Idea?  ( I apologise for my english )

-----Original Message-----
From: Andrew Gargan <andrew@iface.co.za>
To: netfilter@lists.netfilter.org
Date: Wed, 24 Aug 2005 14:30:44 +0200
Subject: Odd issue with two SNATed Firewalls and Wireless router

> Hi All
> 
> have an issue with a network setup. 
> 
> the issue is this some client machines on my network (10 of +- 150)
> keep
> losing their connection to our mail server or any other mail server
> we
> set up their accounts on.
> 
> This is an issue with my network because as soon as they are on
> dialup
> or iburst or ADSL elsewhere they don't have this issue.
> 
> I have a 10.0.0.0/8 network which is my internal net.
> this net routes traffic through 10.0.2.1 (SNAT) which is connected to
> my
> DMZ 172.16.0.0/16.
> the traffic is then sent out to the world via 172.16.0.1(SNAT) over
> sentech mywireless.
> 
> I have isolated the issue to being on the 172.16.0.1 machine since a
> ISDN leased line in the DMZ works 100%.
> 
> Has anyone experienced similar issues using a shared NATed mywireless
> .... 
> 
> most of the mail comes down .... it seems to break when transmissions
> are over +-600 KB)
> 
> I was told that changing the MTU for the ppp0 device to 1300 would
> help
> but no luck there.
> 
> Also one strange thing I noticed (though I don't know TCP/IP that
> well)
> 
> was the txqueuelength value of 3 for the ppp0 interface
> 
> here is my kernel: 2.6.9-1.667 (FC3)
> 
> here is ifconfig:
> eth0      Link encap:Ethernet  HWaddr 00:03:47:71:7B:36
>           inet addr:172.16.0.1  Bcast:172.16.0.255 
> Mask:255.255.255.0
>           inet6 addr: fe80::203:47ff:fe71:7b36/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:27879849 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:26767743 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:1000
>           RX bytes:669378689 (638.3 MiB)  TX bytes:3461641354 (3.2
> GiB)
> 
> eth1      Link encap:Ethernet  HWaddr 00:03:47:71:7B:37
>           inet addr:10.0.7.2  Bcast:10.255.255.255  Mask:255.0.0.0
>           inet6 addr: fe80::203:47ff:fe71:7b37/64 Scope:Link
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:27333550 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:28013971 errors:1 dropped:0 overruns:0 carrier:1
>           collisions:614337 txqueuelen:1000
>           RX bytes:3798771770 (3.5 GiB)  TX bytes:845067479 (805.9
> MiB)
> 
> lo        Link encap:Local Loopback
>           inet addr:127.0.0.1  Mask:255.0.0.0
>           inet6 addr: ::1/128 Scope:Host
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
>           RX packets:13651 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:13651 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:556916 (543.8 KiB)  TX bytes:556916 (543.8 KiB)
> 
> ppp0      Link encap:Point-to-Point Protocol
>           inet addr:196.35.170.61  P-t-P:66.18.87.50 
> Mask:255.255.255.255
>           UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1400  Metric:1
>           RX packets:7595399 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:7622079 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:3
>           RX bytes:1453866192 (1.3 GiB)  TX bytes:2513716398 (2.3
> GiB)
> 
> 
> and iptables -L:
> 
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere
> ACCEPT     all  --  anywhere             anywhere
> DROP       tcp  --  anywhere             anywhere            tcp
> flags:SYN,RST,ACK/SYN
> DROP       tcp  --  anywhere             anywhere            tcp
> flags:SYN,RST,ACK/SYN
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> TCPMSS     tcp  --  anywhere             anywhere            tcp
> flags:SYN,RST/SYN TCPMSS clamp to PMTU
> ACCEPT     all  --  anywhere             anywhere            state
> RELATED,ESTABLISHED
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> 
> and mii-tool:
> eth0: negotiated 100baseTx-FD, link ok
> eth1: no autonegotiation, 10baseT-HD, link ok
> 
> eth1 is the ether used to connect to the mywireless ... for routing
> purposes the ip it has assigned isn't really used ... 
> 
> I am using rp-pppoe I think ... 
> 
> Andrew Gargan
> Developer
> Interface Media (PTY) Ltd.
> Tel: 011 507 3003


