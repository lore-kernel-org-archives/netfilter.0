From: Nathan Watson <nfwatson@gmail.com>
Subject: Help with using 'iptables' to forward different physical machine IP
 address/port-combos to a NAT'ed multihomed internal virtual machine
Date: Thu, 17 Mar 2011 08:19:28 -0700
Message-ID: <AANLkTi=eVkAQTVTzyVtgHF6w4az8ZVskc2mdtfjFY9Rk@mail.gmail.com>
References: <AANLkTik1ZNtLjXFHDxWwO2ecCyKNLySNwDSaSBfoDKSk@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:content-type;
        bh=il4fhRzzM8LaDMrIN879BfZJXVkGCwOw7drUEiTIWaI=;
        b=S4IrTf+euX4RRkj6TPeVTENJa+5oNFmLJE42BBA87Q/ME8kXeGROT+BTsKtPLeJrCh
         3frmnfMNjhkK7KKYTEYwhPl020Ot4p0SEWQjfzejnBRwlZOkDH/MpqugExktYgshvr3D
         n7XnoqtqSZtasQMIfEFBpTO84b9Gujbtk10eM=
In-Reply-To: <AANLkTik1ZNtLjXFHDxWwO2ecCyKNLySNwDSaSBfoDKSk@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

All,

*** Using 'iptables' to forward different physical machine
IP address/port-combos to a NAT'ed multihomed internal virtual machine ... ***

I have problems with this network scenario.  Setup is a bit intricate
but might be interesting to diagnose as well.  I can provide more info
if you like.  Thanks for looking at it.

 * I have a physical host at IP address (eth0) xx.yy.zzz.231 that also
   listens on the same (eth0) interface to xx.yy.zzz.232 and xx.yy.zzz.233
   (Fedora 13 Linux)

 * The physical host houses various virtual machines running various
   versions of Linux and Windows ... only Linux machines are involved
   in this scenario ... and for purposes here I've limited the scenario
   to just one virtual machine and two virtual subnets

 * Virtualization courtesy of libvirtd/qemu/kvm and brctl from Fedora 13, stock
   and up to date as of 2011/03/15

 * The virtual machine in question runs Scientific Linux 6

 * The virtual machine is multihomed with one interface on one subnet
   and two interfaces on the other (why?  because I want one VM to
   house Apache and provide http://... and https://... services to
   different subnets ... there are three https://... virtual hosts
   in play, each listening on a different interface on a single
   Apache installation -- I use this infrastructure to simulate
   multi-host/multi-network environments and also to house
   source code, etc. on a more permanent basis)

 * I'm using 'iptables' on the physical host to send external port 443
   connections on xx.yy.zzz.{231,232,233} to a single virtual machine
   that provides https://... services on internal IP addresses
   192.168.6.45, 192.168.9.32, and 192.168.6.33 respectively ...
   the virtual machine interfaces attach to internal virtual networks
   virbr6 (192.168.6.*) and virbr9 (192.168.9.*)

 * MANIFESTATION OF THE PROBLEM:  from the physical host itself I am able
   to successfully 'telnet 192.168.6.45 443',
   'telnet 192.168.6.33 443', and 'telnet 192.168.9.32 443'
   to access the proper https://... "Apache virtual hosts",
   and the Apache logs (segregated per "Apache virtual host")
   show that I am indeed reaching each of them, also corroborated
   by 'iptables' "-j LOG" entries in the virtual machine's
   'iptables ... BUT ... from outside the physical host
   I am able successfully to 'telnet xx.yy.zzz.231 443'
   and 'telnet xx.yy.zzz.233 443' to reach the 192.168.6.*
   https://... services, **** but I'm never successful
   with 'telnet xx.yy.zzz.232 443' which would reach
   the 192.168.9.32 internal https://... service ****

 * 'iptables' "-j LOG" table entries do, however, I believe,
   indicate that both internal and external traffic to the
   virtual machine's 192.168.9.32 interface reach that interface
   on the virtual machine, but for some reason those starting from
   the general internet are never processed fully, but those
   initiated internally (from the physical host) are

 * my initial guess is that the virtual machine's routing tables
   might have something to do with the problem, but I'm not sure

NOTE:  I'm not an 'iptables' or networking guru, I'd just like this
configuration to work, and a similar configuration seemingly worked
well in the past but I've upgraded base software and modified my env
recently and it's not working quite so well.

So, on to configuration, which I've hopefully simplified to only
the essence here.

=== physical host 'iptables' (in iptables-save form) ===

        # physical host 'iptables'
        #
        # Fedora 13 libvirtd et. al. automatically add the
*nat-'MASQUERADE' stuff in POSTROUTING,
        # and I removed all the default libvirtd *filter-FORWARD
restrictions from the *filter-FORWARD
        # tables as I want to allow all forwarding between networks.

    *nat

    -A PREROUTING -d xx.yy.zzz.245/32 -p tcp -m tcp --dport 22 -j DNAT
--to-destination 192.168.6.45:22
    -A PREROUTING -d xx.yy.zzz.231/32 -p tcp -m tcp --dport 80 -j DNAT
--to-destination 192.168.6.45:80

      # route xx.yy.zzz.231:443 -> 192.168.6.45:443 ... with logging
    -A PREROUTING -d xx.yy.zzz.231/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "P_incoming_www.NWRKA.com____ "
    -A PREROUTING -d xx.yy.zzz.231/32 -p tcp -m tcp --dport 443 -j
DNAT --to-destination 192.168.6.45:443

      # route xx.yy.zzz.232:443 -> 192.168.9.32:443 ... with logging
    -A PREROUTING -d xx.yy.zzz.232/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "P_incoming_www.NETWORKB.com_ "
    -A PREROUTING -d xx.yy.zzz.232/32 -p tcp -m tcp --dport 443 -j
DNAT --to-destination 192.168.9.32:443

      # route xx.yy.zzz.233:443 -> 192.168.6.45:443 ... with logging
    -A PREROUTING -d xx.yy.zzz.233/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "P_incoming_svn.NWRKA.com____ "
    -A PREROUTING -d xx.yy.zzz.233/32 -p tcp -m tcp --dport 443 -j
DNAT --to-destination 192.168.6.33:443

      # stuff libvirtd likes to put in, masquerading internal networks
    -A POSTROUTING -s 192.168.9.0/24 ! -d 192.168.9.0/24 -p tcp -j
MASQUERADE --to-ports 1024-65535
    -A POSTROUTING -s 192.168.9.0/24 ! -d 192.168.9.0/24 -p udp -j
MASQUERADE --to-ports 1024-65535
    -A POSTROUTING -s 192.168.9.0/24 ! -d 192.168.9.0/24 -j MASQUERADE
    -A POSTROUTING -s 192.168.6.0/24 ! -d 192.168.6.0/24 -p tcp -j
MASQUERADE --to-ports 1024-65535
    -A POSTROUTING -s 192.168.6.0/24 ! -d 192.168.6.0/24 -p udp -j
MASQUERADE --to-ports 1024-65535
    -A POSTROUTING -s 192.168.6.0/24 ! -d 192.168.6.0/24 -j MASQUERADE

    COMMIT

    *filter

      # libvirtd stuff
    -A INPUT -i virbr9 -p udp -m udp --dport 53 -j ACCEPT
    -A INPUT -i virbr9 -p tcp -m tcp --dport 53 -j ACCEPT
    -A INPUT -i virbr9 -p udp -m udp --dport 67 -j ACCEPT
    -A INPUT -i virbr9 -p tcp -m tcp --dport 67 -j ACCEPT
    -A INPUT -i virbr6 -p udp -m udp --dport 53 -j ACCEPT
    -A INPUT -i virbr6 -p tcp -m tcp --dport 53 -j ACCEPT
    -A INPUT -i virbr6 -p udp -m udp --dport 67 -j ACCEPT
    -A INPUT -i virbr6 -p tcp -m tcp --dport 67 -j ACCEPT

      # usual default stuff, apparently
    -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    -A INPUT -p icmp -j ACCEPT
    -A INPUT -i lo -j ACCEPT
    -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
    -A INPUT -j REJECT --reject-with icmp-host-prohibited

      # I eliminated libvirtd restrictions on internal FORWARDing ...
I want the virtual
      # subnets to accept FORWARDed traffic from the outside world and
want them to
      # talk to each other too ... at least for now, might
partition/firewall them off in future

      # log packets of interest going to/from virtual network port-443
https://...
    -A FORWARD -d 192.168.6.45/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "P_INCOMING_www.NWRKA.com____ "
    -A FORWARD -d 192.168.9.32/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "P_INCOMING_www.NETWORKB.com_ "
    -A FORWARD -d 192.168.6.33/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "P_INCOMING_svn.NWRKA.com____ "
    -A FORWARD -s 192.168.6.45/32 -p tcp -m tcp --sport 443 -j LOG
--log-prefix "P_OUTGOING_www.NWRKA.com____ "
    -A FORWARD -s 192.168.9.32/32 -p tcp -m tcp --sport 443 -j LOG
--log-prefix "P_OUTGOING_www.NETWORKB.com_ "
    -A FORWARD -s 192.168.6.33/32 -p tcp -m tcp --sport 443 -j LOG
--log-prefix "P_OUTGOING_svn.NWRKA.com____ "

    COMMIT


=== relevant 'ifconfig' on physical host ===

        # single network interface on physical box listening to three
IP addresses

    eth0      Link encap:Ethernet  HWaddr PHYS_HOST_MAC_ADDR
              inet addr:xx.yy.zzz.231  Bcast:64.255.255.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:262586 errors:0 dropped:0 overruns:0 frame:0
              TX packets:208909 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:27232517 (25.9 MiB)  TX bytes:46497552 (44.3 MiB)
              Memory:d8000000-d8020000

    eth0:NWRKAsvn Link encap:Ethernet  HWaddr PHYS_HOST_MAC_ADDR
              inet addr:xx.yy.zzz.233  Bcast:xx.yy.zzz.224  Mask:255.255.255.224
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              Memory:d8000000-d8020000

    eth0:NETWORKB Link encap:Ethernet  HWaddr PHYS_HOST_MAC_ADDR
              inet addr:xx.yy.zzz.232  Bcast:xx.yy.zzz.224  Mask:255.255.255.224
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              Memory:d8000000-d8020000

       # 192.168.6.* virbr

    virbr6    Link encap:Ethernet  HWaddr BA:E0:8F:F0:E1:2C
              inet addr:192.168.6.1  Bcast:192.168.6.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:5455 errors:0 dropped:0 overruns:0 frame:0
              TX packets:9244 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0
              RX bytes:857122 (837.0 KiB)  TX bytes:832458 (812.9 KiB)

        # 192.168.9.* virbr

    virbr9    Link encap:Ethernet  HWaddr E6:02:14:9C:B0:0C
              inet addr:192.168.9.1  Bcast:192.168.9.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:234 errors:0 dropped:0 overruns:0 frame:0
              TX packets:274 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0
              RX bytes:23536 (22.9 KiB)  TX bytes:21258 (20.7 KiB)

        # virtual interfaces attached to the virbr's (all belong to
the single virtual machine)
        # ... and these are all 'virtio' interfaces

    vnet0     Link encap:Ethernet  HWaddr D6:07:B9:FB:63:EC
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:5386 errors:0 dropped:0 overruns:0 frame:0
              TX packets:15741 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:500
              RX bytes:929350 (907.5 KiB)  TX bytes:1170244 (1.1 MiB)

    vnet1     Link encap:Ethernet  HWaddr E6:02:14:9C:B0:0C
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:234 errors:0 dropped:0 overruns:0 frame:0
              TX packets:6702 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:500
              RX bytes:26812 (26.1 KiB)  TX bytes:354902 (346.5 KiB)

    vnet2     Link encap:Ethernet  HWaddr BA:E0:8F:F0:E1:2C
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:69 errors:0 dropped:0 overruns:0 frame:0
              TX packets:6575 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:500
              RX bytes:4142 (4.0 KiB)  TX bytes:341390 (333.3 KiB)


=== association between virbr's and vnet's on physical machine ===

    [_MASTER_ root@porta01 log]# brctl show macs
    bridge name     bridge id               STP enabled     interfaces
    virbr6          8000.bae08ff0e12c       yes             vnet0
                                                            vnet2
    virbr9          8000.e602149cb00c       yes             vnet1
    [_MASTER_ root@porta01 log]#


=== virtual host 'iptables' (in iptables-save form) ===

        # virtual host 'iptables'
        #
        # Scientific Linux 6

    *nat

        # log incoming port-443 at this level
    -A PREROUTING -d 192.168.6.33/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "incoming_svn.NWRKA.com____ "
    -A PREROUTING -d 192.168.6.45/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "incoming_www.NWRKA.com____ "
    -A PREROUTING -d 192.168.9.32/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "incoming_www.NETWORKB.com_ "

    COMMIT


    *filter

        # other
    -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    -A INPUT -p icmp -j ACCEPT
    -A INPUT -i lo -j ACCEPT

        # log incoming port-443 traffic
    -A INPUT -d 192.168.6.33/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "INCOMING_svn.NWRKA.com____ "
    -A INPUT -d 192.168.6.45/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "INCOMING_www.NWRKA.com____ "
    -A INPUT -d 192.168.9.32/32 -p tcp -m tcp --dport 443 -j LOG
--log-prefix "INCOMING_www.NETWORKB.com_ "

        # accept port-443 connections
    -A INPUT -d 192.168.6.45/32 -p tcp -m state --state NEW -m tcp
--dport 443 -j ACCEPT
    -A INPUT -d 192.168.6.33/32 -p tcp -m state --state NEW -m tcp
--dport 443 -j ACCEPT
    -A INPUT -d 192.168.9.32/32 -p tcp -m state --state NEW -m tcp
--dport 443 -j ACCEPT

        # other ... note:  removing port 80 to verify that iptables is
filtering out some traffic
    -A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
    #-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT

        # reject
    -A INPUT -j REJECT --reject-with icmp-host-prohibited

        # other
    -A FORWARD -j REJECT --reject-with icmp-host-prohibited

        # log outgoing packets related to port-443 interactions (I
guess this works)
    -A OUTPUT -s 192.168.6.33/32 -p tcp -m tcp --sport 443 -j LOG
--log-prefix "OUTGOING_svn.NWRKA.com____ "
    -A OUTPUT -s 192.168.6.45/32 -p tcp -m tcp --sport 443 -j LOG
--log-prefix "OUTGOING_www.NWRKA.com____ "
    -A OUTPUT -s 192.168.9.32/32 -p tcp -m tcp --sport 443 -j LOG
--log-prefix "OUTGOING_www.NETWORKB.com_ "

    COMMIT


=== 'ifconfig' on virtual machine ===

    # three virtual interfaces on two different subnets ... reflected
in brctl output on physical host

eth0      Link encap:Ethernet  HWaddr 52:54:00:58:25:73
          inet addr:192.168.6.45  Bcast:192.168.6.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:3669 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2038 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:314076 (306.7 KiB)  TX bytes:377399 (368.5 KiB)

eth3      Link encap:Ethernet  HWaddr 52:54:00:81:0D:CE
          inet addr:192.168.9.32  Bcast:192.168.9.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:287 errors:0 dropped:0 overruns:0 frame:0
          TX packets:19 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:14380 (14.0 KiB)  TX bytes:958 (958.0 b)

eth4      Link encap:Ethernet  HWaddr 52:54:00:10:91:CF
          inet addr:192.168.6.33  Bcast:192.168.6.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:311 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:14128 (13.7 KiB)  TX bytes:210 (210.0 b)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:21 errors:0 dropped:0 overruns:0 frame:0
          TX packets:21 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:1848 (1.8 KiB)  TX bytes:1848 (1.8 KiB)


=== routing tables on virtual machine <-- this may be source of the
problem!?? ===

    [root@brasilia httpd]# route -n
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags Metric Ref
 Use Iface
    192.168.6.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
    192.168.6.0     0.0.0.0         255.255.255.0   U     0      0        0 eth4
    192.168.9.0     0.0.0.0         255.255.255.0   U     0      0        0 eth3
    169.254.0.0     0.0.0.0         255.255.0.0     U     1002   0        0 eth0
    169.254.0.0     0.0.0.0         255.255.0.0     U     1003   0        0 eth3
    169.254.0.0     0.0.0.0         255.255.0.0     U     1004   0        0 eth4
    0.0.0.0         192.168.6.1     0.0.0.0         UG    0      0        0 eth0
    [root@brasilia httpd]#

============ NOTE:  for following 'telnet HOST 443' DEMOS ... ============

For the following demos I initiate the 'telnet' and then do ^] and
exit the session.
The /var/log/messages output at each stage may not be full/complete, but the
point is that for 5 of these 6 interactions all goes well, and there's
good evidence
in from the iptables "-j LOG".  In the 6th interaction, the interaction from
general internet to www.NETWORKB.com, the interaction goes wrong.

Here's a sample client-side 'telnet' session showing interaction, from
a Linux box,
and it's enough to show full round-trip TCP/IP traffic to/from the
service of interest.

    [_MASTER_ root@porta01 log]# telnet www.NWRKA.com 443
    Trying 192.168.6.45...
    Connected to www.NWRKA.com.
    Escape character is '^]'.
    ^]
    telnet> quit
    Connection closed.
    [_MASTER_ root@porta01 log]#


=== demo of interaction 'telnet www.NWRKA.com 443' ===

    === telnet www.NWRKA.com 443, initiated from physical host, evidence seen
        in /var/log/messages on virtual host ... all OK ===

            Mar 16 10:12:05 brasilia kernel:
incoming_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.45 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=43612 DF
PROTO=TCP SPT=45172 DPT=443 WINDOW=5840 RES=0x00 SYN URGP=0
            Mar 16 10:12:05 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.45 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=43612 DF
PROTO=TCP SPT=45172 DPT=443 WINDOW=5840 RES=0x00 SYN URGP=0
            Mar 16 10:12:05 brasilia kernel:
OUTGOING_www.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.45
DST=192.168.6.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=443 DPT=45172 WINDOW=5792 RES=0x00 ACK SYN URGP=0
            Mar 16 10:12:05 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.45 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=43613 DF
PROTO=TCP SPT=45172 DPT=443 WINDOW=46 RES=0x00 ACK URGP=0
            Mar 16 10:12:06 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.45 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=43614 DF
PROTO=TCP SPT=45172 DPT=443 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:12:06 brasilia kernel:
OUTGOING_www.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.45
DST=192.168.6.1 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=63494 DF PROTO=TCP
SPT=443 DPT=45172 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:12:06 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.45 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=43615 DF
PROTO=TCP SPT=45172 DPT=443 WINDOW=46 RES=0x00 ACK URGP=0

    === telnet www.NWRKA.com 443, initiated from general internet, evidence seen
        in /var/log/messages on physical and virtual hosts ... all OK ===

        === physical host iptables "-j LOG" stuff ===

            Mar 16 10:23:48 porta01 kernel:
P_incoming_www.NWRKA.com____ IN=eth0 OUT=
MAC=PHYS_HOST_MAC_ADDR:00:0c:db:fc:71:00:08:00 SRC=67.188.154.219
DST=xx.yy.zzz.231 LEN=64 TOS=0x00 PREC=0x20 TTL=52 ID=4317 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:23:48 porta01 kernel:
P_INCOMING_www.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.45 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=4317 DF PROTO=TCP
SPT=60002 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:23:48 porta01 kernel:
P_OUTGOING_www.NWRKA.com____ IN=virbr6 OUT=eth0 PHYSIN=vnet0
SRC=192.168.6.45 DST=67.188.154.219 LEN=60 TOS=0x00 PREC=0x00 TTL=63
ID=0 DF PROTO=TCP SPT=443 DPT=60002 WINDOW=5792 RES=0x00 ACK SYN
URGP=0
            Mar 16 10:23:48 porta01 kernel:
P_INCOMING_www.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=28035 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33304 RES=0x00 ACK URGP=0
            Mar 16 10:23:50 porta01 kernel:
P_INCOMING_www.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=18893 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33304 RES=0x00 ACK FIN URGP=0
            Mar 16 10:23:50 porta01 kernel:
P_OUTGOING_www.NWRKA.com____ IN=virbr6 OUT=eth0 PHYSIN=vnet0
SRC=192.168.6.45 DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=63
ID=28018 DF PROTO=TCP SPT=443 DPT=60002 WINDOW=46 RES=0x00 ACK URGP=0
            Mar 16 10:23:50 porta01 kernel:
P_OUTGOING_www.NWRKA.com____ IN=virbr6 OUT=eth0 PHYSIN=vnet0
SRC=192.168.6.45 DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=63
ID=28019 DF PROTO=TCP SPT=443 DPT=60002 WINDOW=46 RES=0x00 ACK FIN
URGP=0
            Mar 16 10:23:50 porta01 kernel:
P_INCOMING_www.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=23035 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33304 RES=0x00 ACK URGP=0
            Mar 16 10:23:50 porta01 kernel:
P_INCOMING_www.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=31446 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33303 RES=0x00 ACK URGP=0

        === virtual host iptables "-j LOG" stuff ===

            Mar 16 10:23:47 brasilia kernel:
incoming_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.45 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=4317 DF PROTO=TCP
SPT=60002 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:23:47 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.45 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=4317 DF PROTO=TCP
SPT=60002 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:23:47 brasilia kernel:
OUTGOING_www.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.45
DST=67.188.154.219 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=443 DPT=60002 WINDOW=5792 RES=0x00 ACK SYN URGP=0
            Mar 16 10:23:47 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=28035 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33304 RES=0x00 ACK URGP=0
            Mar 16 10:23:49 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=18893 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33304 RES=0x00 ACK FIN URGP=0
            Mar 16 10:23:49 brasilia kernel:
OUTGOING_www.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.45
DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=28018 DF
PROTO=TCP SPT=443 DPT=60002 WINDOW=46 RES=0x00 ACK URGP=0
            Mar 16 10:23:49 brasilia kernel:
OUTGOING_www.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.45
DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=28019 DF
PROTO=TCP SPT=443 DPT=60002 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:23:49 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=23035 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33304 RES=0x00 ACK URGP=0
            Mar 16 10:23:49 brasilia kernel:
INCOMING_www.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.45 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=31446 DF
PROTO=TCP SPT=60002 DPT=443 WINDOW=33303 RES=0x00 ACK URGP=0
            Mar 16 10:23:59 brasilia kernel:
OUTGOING_www.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.45
DST=174.102.135.26 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=443 DPT=1718 WINDOW=5840 RES=0x00 ACK SYN URGP=0
            Mar 16 10:24:00 brasilia kernel:
OUTGOING_www.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.45
DST=174.102.135.26 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=443 DPT=45747 WINDOW=5840 RES=0x00 ACK SYN URGP=0

=== demo of interaction 'telnet svn.NWRKA.com 443' ===

    === telnet svn.NWRKA.com 443, initiated from physical host, evidence seen
        in /var/log/messages on virtual host ... all OK ===

            Mar 16 10:25:31 brasilia kernel:
incoming_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.33 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=10196 DF
PROTO=TCP SPT=42878 DPT=443 WINDOW=5840 RES=0x00 SYN URGP=0
            Mar 16 10:25:31 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.33 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=10196 DF
PROTO=TCP SPT=42878 DPT=443 WINDOW=5840 RES=0x00 SYN URGP=0
            Mar 16 10:25:31 brasilia kernel:
OUTGOING_svn.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.33
DST=192.168.6.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=443 DPT=42878 WINDOW=5792 RES=0x00 ACK SYN URGP=0
            Mar 16 10:25:31 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.33 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=10197 DF
PROTO=TCP SPT=42878 DPT=443 WINDOW=46 RES=0x00 ACK URGP=0
            Mar 16 10:25:33 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.33 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=10198 DF
PROTO=TCP SPT=42878 DPT=443 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:25:33 brasilia kernel:
OUTGOING_svn.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.33
DST=192.168.6.1 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=23769 DF PROTO=TCP
SPT=443 DPT=42878 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:25:33 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=192.168.6.1
DST=192.168.6.33 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=10199 DF
PROTO=TCP SPT=42878 DPT=443 WINDOW=46 RES=0x00 ACK URGP=0

    === telnet svn.NWRKA.com 443, initiated from general internet, evidence seen
        in /var/log/messages on physical and virtual hosts ... all OK ===

        === physical host iptables "-j LOG" stuff ===

            Mar 16 10:26:41 porta01 kernel:
P_incoming_svn.NWRKA.com____ IN=eth0 OUT=
MAC=PHYS_HOST_MAC_ADDR:00:0c:db:fc:71:00:08:00 SRC=67.188.154.219
DST=xx.yy.zzz.233 LEN=64 TOS=0x00 PREC=0x20 TTL=52 ID=4145 DF
PROTO=TCP SPT=60012 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:26:41 porta01 kernel:
P_INCOMING_svn.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.33 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=4145 DF PROTO=TCP
SPT=60012 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:26:41 porta01 kernel:
P_OUTGOING_svn.NWRKA.com____ IN=virbr6 OUT=eth0 PHYSIN=vnet0
SRC=192.168.6.33 DST=67.188.154.219 LEN=60 TOS=0x00 PREC=0x00 TTL=63
ID=0 DF PROTO=TCP SPT=443 DPT=60012 WINDOW=5792 RES=0x00 ACK SYN
URGP=0
            Mar 16 10:26:41 porta01 kernel:
P_INCOMING_svn.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=46882 DF
PROTO=TCP SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK URGP=0
            Mar 16 10:26:43 porta01 kernel:
P_INCOMING_svn.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=37377 DF
PROTO=TCP SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK FIN URGP=0
            Mar 16 10:26:43 porta01 kernel:
P_OUTGOING_svn.NWRKA.com____ IN=virbr6 OUT=eth0 PHYSIN=vnet0
SRC=192.168.6.33 DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=63
ID=21898 DF PROTO=TCP SPT=443 DPT=60012 WINDOW=46 RES=0x00 ACK URGP=0
            Mar 16 10:26:43 porta01 kernel:
P_OUTGOING_svn.NWRKA.com____ IN=virbr6 OUT=eth0 PHYSIN=vnet0
SRC=192.168.6.33 DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=63
ID=21899 DF PROTO=TCP SPT=443 DPT=60012 WINDOW=46 RES=0x00 ACK FIN
URGP=0
            Mar 16 10:26:43 porta01 kernel:
P_INCOMING_svn.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=8259 DF PROTO=TCP
SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK URGP=0
            Mar 16 10:26:43 porta01 kernel:
P_INCOMING_svn.NWRKA.com____ IN=eth0 OUT=virbr6 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=51473 DF
PROTO=TCP SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK URGP=0

        === virtual host iptables "-j LOG" stuff ===

            Mar 16 10:26:40 brasilia kernel:
incoming_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.33 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=4145 DF PROTO=TCP
SPT=60012 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:26:40 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.33 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=4145 DF PROTO=TCP
SPT=60012 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:26:40 brasilia kernel:
OUTGOING_svn.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.33
DST=67.188.154.219 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=443 DPT=60012 WINDOW=5792 RES=0x00 ACK SYN URGP=0
            Mar 16 10:26:40 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=46882 DF
PROTO=TCP SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK URGP=0
            Mar 16 10:26:42 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=37377 DF
PROTO=TCP SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK FIN URGP=0
            Mar 16 10:26:42 brasilia kernel:
OUTGOING_svn.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.33
DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=21898 DF
PROTO=TCP SPT=443 DPT=60012 WINDOW=46 RES=0x00 ACK URGP=0
            Mar 16 10:26:42 brasilia kernel:
OUTGOING_svn.NWRKA.com____ IN= OUT=eth0 SRC=192.168.6.33
DST=67.188.154.219 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=21899 DF
PROTO=TCP SPT=443 DPT=60012 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:26:42 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=8259 DF PROTO=TCP
SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK URGP=0
            Mar 16 10:26:42 brasilia kernel:
INCOMING_svn.NWRKA.com____ IN=eth0 OUT=
MAC=52:54:00:58:25:73:ba:e0:8f:f0:e1:2c:08:00 SRC=67.188.154.219
DST=192.168.6.33 LEN=52 TOS=0x00 PREC=0x20 TTL=51 ID=51473 DF
PROTO=TCP SPT=60012 DPT=443 WINDOW=65535 RES=0x00 ACK URGP=0

=== demo of interaction 'telnet www.NETWORKB.com 443' ===

    === telnet www.NETWORKB.com 443, initiated from physical host, evidence seen
        in /var/log/messages on virtual host ... all OK ===

            Mar 16 10:28:46 brasilia kernel:
incoming_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=192.168.9.1
DST=192.168.9.32 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=36167 DF
PROTO=TCP SPT=37428 DPT=443 WINDOW=5840 RES=0x00 SYN URGP=0
            Mar 16 10:28:46 brasilia kernel:
INCOMING_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=192.168.9.1
DST=192.168.9.32 LEN=60 TOS=0x10 PREC=0x00 TTL=64 ID=36167 DF
PROTO=TCP SPT=37428 DPT=443 WINDOW=5840 RES=0x00 SYN URGP=0
            Mar 16 10:28:46 brasilia kernel:
OUTGOING_www.NETWORKB.com_ IN= OUT=eth3 SRC=192.168.9.32
DST=192.168.9.1 LEN=60 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=TCP
SPT=443 DPT=37428 WINDOW=5792 RES=0x00 ACK SYN URGP=0
            Mar 16 10:28:46 brasilia kernel:
INCOMING_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=192.168.9.1
DST=192.168.9.32 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=36168 DF
PROTO=TCP SPT=37428 DPT=443 WINDOW=46 RES=0x00 ACK URGP=0
            Mar 16 10:28:48 brasilia kernel:
INCOMING_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=192.168.9.1
DST=192.168.9.32 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=36169 DF
PROTO=TCP SPT=37428 DPT=443 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:28:48 brasilia kernel:
OUTGOING_www.NETWORKB.com_ IN= OUT=eth3 SRC=192.168.9.32
DST=192.168.9.1 LEN=52 TOS=0x00 PREC=0x00 TTL=64 ID=22407 DF PROTO=TCP
SPT=443 DPT=37428 WINDOW=46 RES=0x00 ACK FIN URGP=0
            Mar 16 10:28:48 brasilia kernel:
INCOMING_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=192.168.9.1
DST=192.168.9.32 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=36170 DF
PROTO=TCP SPT=37428 DPT=443 WINDOW=46 RES=0x00 ACK URGP=0

    === telnet www.NETWORKB.com 443, initiated from general internet,
evidence seen
        in /var/log/messages on physical and virtual hosts ...
PROBLEMS!!! ... VIRTUAL HOST
        SEES INITIATING PACKETS BUT NEVER ACCEPTS OR RESPONDS TO THEM.
 I DO CTRL-C ON
        TELNET SESSION TO TERMINATE ON CLIENT SIDE. ===

        === physical host iptables "-j LOG" stuff ===

            Mar 16 10:30:55 porta01 kernel:
P_incoming_www.NETWORKB.com_ IN=eth0 OUT=
MAC=PHYS_HOST_MAC_ADDR:00:0c:db:fc:71:00:08:00 SRC=67.188.154.219
DST=xx.yy.zzz.232 LEN=64 TOS=0x00 PREC=0x20 TTL=52 ID=60550 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:55 porta01 kernel:
P_INCOMING_www.NETWORKB.com_ IN=eth0 OUT=virbr9 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=60550 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:56 porta01 kernel:
P_INCOMING_www.NETWORKB.com_ IN=eth0 OUT=virbr9 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=26873 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:57 porta01 kernel:
P_INCOMING_www.NETWORKB.com_ IN=eth0 OUT=virbr9 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=41172 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:58 porta01 kernel:
P_INCOMING_www.NETWORKB.com_ IN=eth0 OUT=virbr9 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=33439 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:59 porta01 kernel:
P_INCOMING_www.NETWORKB.com_ IN=eth0 OUT=virbr9 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=23214 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0

         NOTE:  ^^^ up here, repeated incoming packets destined to
port 443 on specific physical host interface and being mapped to
virtual host ...
         seemingly just like for other interfaces

        === virtual host iptables "-j LOG" stuff ===

            Mar 16 10:30:53 brasilia kernel:
incoming_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=60550 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:54 brasilia kernel:
incoming_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=26873 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:55 brasilia kernel:
incoming_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=41172 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:56 brasilia kernel:
incoming_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=33439 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0
            Mar 16 10:30:57 brasilia kernel:
incoming_www.NETWORKB.com_ IN=eth3 OUT=
MAC=52:54:00:81:0d:ce:e6:02:14:9c:b0:0c:08:00 SRC=67.188.154.219
DST=192.168.9.32 LEN=64 TOS=0x00 PREC=0x20 TTL=51 ID=23214 DF
PROTO=TCP SPT=60023 DPT=443 WINDOW=65535 RES=0x00 SYN URGP=0

         NOTE:  ^^^ up here, repeated incoming packets successfully
mapped to port 443 on virtual host,
         but virtual host doesn't send anything back!!  And at the
virtual host level this is ALMOST like
         the internally-initiated successful telnet session, EXCEPT:
           * for internally-initiated version there's a SRC=192.168.9.1
           * for general internet version there's a SRC=67.188.154.219
... from outside the physical host,
             but that works just fine for the interfaces on the
192.168.6.* ... could the default-route
             to 192.168.6.1 in the virtual host's routing tables be the culprit?

=== END OF DATA DUMP ===

In the very last demo of the 6 demos we see GENERAL_INTERNET (67.188.154.219) ->
PHYS_HOST_interface/port (xx.yy.zzz.232) -> routing ->
out-through-subnet-gateway-write-to (192.168.9.1) ->
VIRTUAL_HOST_interface/port (192.168.9.32) -> BLACK-HOLE.

The analogous interactions with the other virtual interfaces from the
general internet show no problem.
Also, the 192.168.9.32 works just fine when the telnet session is
initiated "internally" from the
physical host.  So what's the deal?  As far as I can see everything
should just work in all 6 cases,
not just 5 of the 6.

Please help!  Thanks.

Nathan Watson
nfwatson@gmail.com
