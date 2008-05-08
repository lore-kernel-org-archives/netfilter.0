From: "Andrea Ranieri" <andreran@uno.it>
Subject: DNAT routing problem
Date: Thu, 8 May 2008 20:17:32 +0200
Message-ID: <3598a5460805081117i7f519321y9ad85f084ba0f484@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=djio47gJ/HXz3uiOZmYivUC7YafKcB3eQ5wrLkjNw/I=;
        b=HFA+ryahesbAuJJLnyry+U0glThVDk075wse5n5YaTTdA0FIiNy1GAeBIO9io9d5VcrcWuR3jO2oWNuzwg6rllHK/Lj8oozyOIEN6Uhlv7rdbnuyexiKMVY0EcJ/dbcABIKA+GEdeLS4udMMaZGVddLrsqYsfNta9QNE1/b7cHo=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Greetings,

I'm trying to use DNAT in order to NAT from 10.0.5.x/24 to 192.168.1.y/24.
It seems an easy job... Well it isn't. At least for me :)

This is the command I issue.

iptables -v -t nat -I PREROUTING -i eth5 -j DNAT --to 192.168.1.0-192.168.1.254

Playing a bit with iptables, I observed a strange behavior. For
example, if my router is forwarding
even a few packets per second (ipv4 only payload), the rule is
accepted, but not applied.

------------------------------
magnolia:~> iptables -v -t nat --list
Chain PREROUTING (policy ACCEPT 18 packets, 3261 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 DNAT       0    --  eth5   any     anywhere
anywhere            to:192.168.1.0-192.168.1.254

Chain POSTROUTING (policy ACCEPT 2 packets, 290 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 1 packets, 244 bytes)
 pkts bytes target     prot opt in     out     source
destination
------------------------------
magnolia:~> ifconfig eth5 ; ifconfig eth6
eth5      Link encap:Ethernet  HWaddr 00:30:48:32:6B:68
          inet addr:10.0.5.1  Bcast:10.0.5.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:71 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:4544 (4.4 KiB)  TX bytes:0 (0.0 b)
          Base address:0x3000 Memory:c8300000-c8320000

eth6      Link encap:Ethernet  HWaddr 00:30:48:32:6B:69
          inet addr:10.0.6.1  Bcast:10.0.6.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4 errors:0 dropped:0 overruns:0 frame:0
          TX packets:75 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:256 (256.0 b)  TX bytes:4800 (4.6 KiB)
          Base address:0x3020 Memory:c8320000-c8340000
------------------------------
magnolia:~> route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.5.0        *               255.255.255.0   U     0      0        0 eth5
10.0.6.0        *               255.255.255.0   U     0      0        0 eth6
130.251.17.0    *               255.255.255.0   U     0      0        0 eth0
default         router.reti.dis 0.0.0.0         UG    0      0        0 eth0
------------------------------

As you can see, packets get routed correctly to the proper (eth6)
interfaces, so no natting
is in progress (also verified capturing packets).

Conversely, if no traffic is being forwarded, the rule is accepted and
correctly applied.

------------------------------
magnolia:~> iptables -v -t nat --list
Chain PREROUTING (policy ACCEPT 6 packets, 643 bytes)
 pkts bytes target     prot opt in     out     source
destination
    1    46 DNAT       0    --  eth5   any     anywhere
anywhere            to:192.168.1.0-192.168.1.254

Chain POSTROUTING (policy ACCEPT 2 packets, 226 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 1 packets, 180 bytes)
 pkts bytes target     prot opt in     out     source
destination
------------------------------
magnolia:~> route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.5.0        *               255.255.255.0   U     0      0        0 eth5
10.0.6.0        *               255.255.255.0   U     0      0        0 eth6
192.168.1.0     10.0.6.2        255.255.255.0   UG    0      0        0 eth6
130.251.17.0    *               255.255.255.0   U     0      0        0 eth0
default         router.reti.dis 0.0.0.0         UG    0      0        0 eth0
------------------------------
magnolia:~> ifconfig eth5 ; ifconfig eth6
eth5      Link encap:Ethernet  HWaddr 00:30:48:32:6B:68
          inet addr:10.0.5.1  Bcast:10.0.5.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:68 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:4352 (4.2 KiB)  TX bytes:0 (0.0 b)
          Base address:0x3000 Memory:c8300000-c8320000

eth6      Link encap:Ethernet  HWaddr 00:30:48:32:6B:69
          inet addr:10.0.6.1  Bcast:10.0.6.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
          TX packets:45 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:128 (128.0 b)  TX bytes:2880 (2.8 KiB)
          Base address:0x3020 Memory:c8320000-c8340000
------------------------------

But when I try to flush the NAT table, the rule is apparently removed
from the table, but the kernel
continues to apply it. So, if I remove the 192.168 route, packets get dropped.

------------------------------
magnolia:~> iptables -v -t nat --list
Chain PREROUTING (policy ACCEPT 52 packets, 8291 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain POSTROUTING (policy ACCEPT 6 packets, 487 bytes)
 pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 5 packets, 441 bytes)
 pkts bytes target     prot opt in     out     source
destination
------------------------------
magnolia:~> route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
10.0.5.0        *               255.255.255.0   U     0      0        0 eth5
10.0.6.0        *               255.255.255.0   U     0      0        0 eth6
130.251.17.0    *               255.255.255.0   U     0      0        0 eth0
default         router.reti.dis 0.0.0.0         UG    0      0        0 eth0
------------------------------
magnolia:~> ifconfig eth5 ; ifconfig eth6
eth5      Link encap:Ethernet  HWaddr 00:30:48:32:6B:68
          inet addr:10.0.5.1  Bcast:10.0.5.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:228 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:14592 (14.2 KiB)  TX bytes:0 (0.0 b)
          Base address:0x3000 Memory:c8300000-c8320000

eth6      Link encap:Ethernet  HWaddr 00:30:48:32:6B:69
          inet addr:10.0.6.1  Bcast:10.0.6.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:4 errors:0 dropped:0 overruns:0 frame:0
          TX packets:68 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:256 (256.0 b)  TX bytes:4352 (4.2 KiB)
          Base address:0x3020 Memory:c8320000-c8340000
------------------------------

I really don't understand this behavior, I hope I'm missing something obivious.
I'd like to point out that I'm running a standard (debian
2.6.22-14-server) kernel,
and each of this two tests, comes from a fresh boot.

Thanks in advance, and sorry for the jumbo mail :)
Andrea
