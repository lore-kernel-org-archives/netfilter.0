From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: eth - NAT - Bridge - veth
Date: Thu, 26 Jun 2014 21:51:07 -0700
Message-ID: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=jUVr1bPGgs7zPS0wOhMWeTEw2PjEOZzE9LKVTHuQ1Hw=;
        b=qwwIgVZF0pyOSmZZ4tNi3Q4h3OtjhQlk8wzGRGOymjuNise1Nlsy1aRnNW37rU6e6j
         Y7vBu+yu6FgYwWu/FF3aRKFcwGjF3gnYQYyTnEaQ/1OmH2Nod0KT1dp9ioWo2sx1bhmM
         leTOVNsAXa+/CG+iyIwu97XfyQNPIIq0EOEjy6YA/oHGAKwl5+2nC+lxD6pljNTw/Jrn
         1V0YYvDdL9uVuTpC/ykDnCKJy/+FBYwOZquu7ID31yKXJNydSvjiJhYxTdrqbO5IkhNu
         PHL5qpaCYOBuGO6VH7O+xiDof8be4ELNd4+NrptZBGZLConQckoDguWTQhm/TWp1Lc/k
         5/+g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi
I have a setup where
lxc ( container/light weight sandbox ) brings up veth and setsup IP as
192.168.10.2. and runs telnet server ( on port 2300 )

I created a bridge with IP 192.168.10.2 attaching the veth.

After the route setup, the host ( with eth1: 10.4.38.222 ) is able to
ping the veth ( 192.168.10.2 ) and vice versa.

Now how do I connect to the telnet server on 192.168.10.2: 2300 from
10.4.3x.xxx network ?

I guess I need some kind of NAT rules
I tried : http://www.pdxsys.com/articles/lxc/lxc2/ but in vain.



------- setup ----------------


# ifconfig from host:
br0       Link encap:Ethernet  HWaddr FE:26:4E:1E:96:58
          inet addr:192.168.10.1  Bcast:192.168.10.255  Mask:255.255.255.0
          inet6 addr: fe80::6c17:ebff:fe0b:4960/64 Scope:Link
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:935 errors:0 dropped:0 overruns:0 frame:0
          TX packets:463 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:66496 (64.9 KiB)  TX bytes:39538 (38.6 KiB)

eth0      Link encap:Ethernet  HWaddr 00:00:DE:AD:BE:EF
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

eth1      Link encap:Ethernet  HWaddr 00:00:DE:AD:BE:EE
          inet addr:10.4.38.182  Bcast:10.4.39.255  Mask:255.255.254.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:134332 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1961 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:19183426 (18.2 MiB)  TX bytes:169630 (165.6 KiB)

eth1:0    Link encap:Ethernet  HWaddr 00:00:DE:AD:BE:EE
          inet addr:192.168.17.10  Bcast:192.168.17.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:12 errors:0 dropped:0 overruns:0 frame:0
          TX packets:12 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:756 (756.0 B)  TX bytes:756 (756.0 B)

veth2     Link encap:Ethernet  HWaddr FE:E5:84:6E:5F:58
          inet6 addr: fe80::fce5:84ff:fe6e:5f58/64 Scope:Link
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:475 errors:0 dropped:0 overruns:0 frame:0
          TX packets:896 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:40254 (39.3 KiB)  TX bytes:59336 (57.9 KiB)

veth3     Link encap:Ethernet  HWaddr FE:26:4E:1E:96:58
          inet6 addr: fe80::fc26:4eff:fe1e:9658/64 Scope:Link
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:441 errors:0 dropped:0 overruns:0 frame:0
          TX packets:893 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:37874 (36.9 KiB)  TX bytes:58770 (57.3 KiB)

# route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         10.4.39.254     0.0.0.0         UG    0      0        0 eth1
10.4.38.0       *               255.255.254.0   U     0      0        0 eth1
192.168.10.0    *               255.255.255.0   U     0      0        0 br0
192.168.17.0    *               255.255.255.0   U     0      0        0 eth1
# iptables --list
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
#

tried :

# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.fe264e1e9658       no              veth2
                                                        veth3

also tried adding :

# brctl addif br0 eth1
# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.0000deadbeee       no              eth1
                                                        veth2
                                                        veth3


Thanks.
