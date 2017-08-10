From: Correo Pruebas <correo.administracion.pruebas@gmail.com>
Subject: ebtables snat/dnat configuration for a bridge interface
Date: Thu, 10 Aug 2017 08:54:13 +0200
Message-ID: <CA+zWw63=TH6thPo4ayciVYavcQ+CjHOSd+wcWDj+Q_wr8Uupww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=18jeLxfib3sltn6vU43GBYJyxYg1mh8zE3sNTw12Nrg=;
        b=MN4/eVIZJ9F3Ap5pwICl13vRUe39EQw/ibbGwxQoBha6s8weCe9qcnMDJQhSRlrCw9
         fhlyLj0JnFyiv701jpwo9f8btvC+/QYaCYMmUYDpXKsyRU9FCZkMfeewRb1te8Pfax0d
         HPmdVgAG5ygCoorNXYUKgCbg7lwlIDkgbt/BmwajcU2Em/M7+E4xietpbzZWyz3aozcR
         WdPCZKdkdt2YmR3numltOV3/OXI5Wj03o6PEVOE/bZnlVn33+LnQvORKA2rasS/P1396
         foMCwqxJeNRIZU9PjKG+dEHu6bZ35tRr8RMOhl1VWiwO8ji1SeBtXtEeD1CksivrI0ju
         U0cQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have a typical configuration where an hypervisor has a bridge
interface which is used by virtual machines to access directly to the
network.

The problem is that the corporate switch limits the number of MAC
addresses in access ports (only two MAC addresses are permited by
access port), so I have to use snat/dnat of MAC addresses to present
this virtual machines with the MAC address of the hypervisor bridge
interface.

my network configuration looks like this:

gateway -> 10.8.1.254/23 [00:10:db:ff:20:90]
hypervisor -> 10.8.1.150/23 [f2:ab:75:e1:32:56]
vm1 -> 10.8.1.156/23 [fe:26:5a:76:37:77]

vm1  <-------------->  hypervisor <--------> gateway
eth0                         bridge-01(vnet0,lan-01)
10.8.1.156               10.8.1.150               10.8.1.254
fe:26:5a:76:37:77    f2:ab:75:e1:32:56    00:10:db:ff:20:90


hypervisor # ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN
group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: lan-02: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group
default qlen 1000
    link/ether 00:26:5a:76:37:76 brd ff:ff:ff:ff:ff:ff
3: lan-01: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel
master bridge-01 state UP group default qlen 1000
    link/ether 00:0f:fe:8a:63:86 brd ff:ff:ff:ff:ff:ff
4: bridge-01: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue
state UP group default qlen 1000
    link/ether f2:ab:75:e1:32:56 brd ff:ff:ff:ff:ff:ff
    inet 10.8.1.150/23 brd 10.8.1.255 scope global dynamic bridge-01
       valid_lft 613152sec preferred_lft 613152sec
    inet6 fe80::f0ab:75ff:fee1:3256/64 scope link
       valid_lft forever preferred_lft forever

hypervisor # ip r
default via 10.8.1.254 dev bridge-01 proto dhcp src 10.8.1.150 metric 1024
10.8.0.0/23 dev bridge-01 proto kernel scope link src 10.8.1.150
10.8.1.254 dev bridge-01 proto dhcp scope link src 10.8.1.150 metric 1024

hypervisor # brctl show
bridge name bridge id STP enabled interfaces
bridge-01 8000.f2ab75e13256 no lan-01
                                                     vnet0


my ebtables configuracion simply does _snat_ for all outgoint packets
with the MAC of the hypervisor bridge interface and does _dnat_ for
all incoming packets with the destination ip address of vm1 to the MAC
of vm1:

hypervisor # ebtables -t nat -L
Bridge table: nat

Bridge chain: PREROUTING, entries: 2, policy: ACCEPT
-p ARP --logical-in bridge-01 --arp-ip-dst 10.8.1.156 -j dnat --to-dst
fe:26:5a:76:37:77 --dnat-target ACCEPT
-p IPv4 --logical-in bridge-01 --ip-dst 10.8.1.156 -j dnat --to-dst
fe:26:5a:76:37:77 --dnat-target ACCEPT

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

Bridge chain: POSTROUTING, entries: 1, policy: ACCEPT
--logical-out bridge-01 -j snat --to-src f2:ab:75:e1:32:56 --snat-arp
--snat-target ACCEPT





now is when the thing gets weird, an arping from the hypervisor bridge
interface to the gateway works:

hypervisor # arping -c 3 -I bridge-01 10.8.1.254
ARPING 10.8.1.254 from 10.8.1.150 bridge-01
Unicast reply from 10.8.1.254 [00:10:DB:FF:20:90]  2.098ms
Unicast reply from 10.8.1.254 [00:10:DB:FF:20:90]  5.485ms
Unicast reply from 10.8.1.254 [00:10:DB:FF:20:90]  2.135ms
Sent 3 probes (1 broadcast(s))
Received 3 response(s)

hypervisor # tcpdump -e -nn -s 0 -i bridge-01 'ether host (
00:10:db:ff:20:90 or 00:26:5a:76:37:77 or f2:ab:75:e1:32:56 ) and arp'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on bridge-01, link-type EN10MB (Ethernet), capture size 262144 bytes
13:37:43.875506 f2:ab:75:e1:32:56 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.150, length 28
13:37:43.885833 00:10:db:ff:20:90 > f2:ab:75:e1:32:56, ethertype ARP
(0x0806), length 60: Reply 10.8.1.254 is-at 00:10:db:ff:20:90, length
46
13:37:44.875699 f2:ab:75:e1:32:56 > 00:10:db:ff:20:90, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (00:10:db:ff:20:90)
tell 10.8.1.150, length 28
13:37:44.877338 00:10:db:ff:20:90 > f2:ab:75:e1:32:56, ethertype ARP
(0x0806), length 60: Reply 10.8.1.254 is-at 00:10:db:ff:20:90, length
46
13:37:45.875761 f2:ab:75:e1:32:56 > 00:10:db:ff:20:90, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (00:10:db:ff:20:90)
tell 10.8.1.150, length 28
13:37:45.877361 00:10:db:ff:20:90 > f2:ab:75:e1:32:56, ethertype ARP
(0x0806), length 60: Reply 10.8.1.254 is-at 00:10:db:ff:20:90, length
46




from the virtual machine eth0 interface to the hypervisor bridge
interface works:

vm1 # arping -c 3 -I eth0 10.8.1.150
ARPING 10.8.1.150 from 10.8.1.156 eth0
Unicast reply from 10.8.1.150 [F2:AB:75:E1:32:56]  0.829ms
Unicast reply from 10.8.1.150 [F2:AB:75:E1:32:56]  0.668ms
Unicast reply from 10.8.1.150 [F2:AB:75:E1:32:56]  0.826ms
Sent 3 probes (1 broadcast(s))
Received 3 response(s)

hypervisor # tcpdump -e -nn -s 0 -i bridge-01 'ether host (
00:10:db:ff:20:90 or 00:26:5a:76:37:77 or f2:ab:75:e1:32:56) and arp'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on bridge-01, link-type EN10MB (Ethernet), capture size 262144 bytes
13:39:13.918186 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.150 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:39:13.918229 f2:ab:75:e1:32:56 > 00:26:5a:76:37:77, ethertype ARP
(0x0806), length 42: Reply 10.8.1.150 is-at f2:ab:75:e1:32:56, length
28
13:39:14.928307 00:26:5a:76:37:77 > f2:ab:75:e1:32:56, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.150 (f2:ab:75:e1:32:56)
tell 10.8.1.156, length 28
13:39:14.928340 f2:ab:75:e1:32:56 > 00:26:5a:76:37:77, ethertype ARP
(0x0806), length 42: Reply 10.8.1.150 is-at f2:ab:75:e1:32:56, length
28
13:39:15.939079 00:26:5a:76:37:77 > f2:ab:75:e1:32:56, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.150 (f2:ab:75:e1:32:56)
tell 10.8.1.156, length 28
13:39:15.939110 f2:ab:75:e1:32:56 > 00:26:5a:76:37:77, ethertype ARP
(0x0806), length 42: Reply 10.8.1.150 is-at f2:ab:75:e1:32:56, length
28



BUT, from the virtual machine eth0 interface to the gateway FAILS:

# arping -w 3 -c 3 -I eth0 10.8.1.254
ARPING 10.8.1.254 from 10.8.1.156 eth0
Sent 4 probes (4 broadcast(s))
Received 0 response(s)

and it seems that is because the vnet0 interface doesn't receive
arpreply packets, just compare the capture on the bridge
interface(bridge-01) with the capture on the vm interface (vnet0):


tcpdump -e -nn -s 0 -i bridge-01 'ether host ( 00:10:db:ff:20:90 or
00:26:5a:76:37:77 or f2:ab:75:e1:32:56 ) and arp'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on bridge-01, link-type EN10MB (Ethernet), capture size 262144 bytes
13:42:45.752291 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:42:45.753874 00:10:db:ff:20:90 > fe:26:5a:76:37:77, ethertype ARP
(0x0806), length 60: Reply 10.8.1.254 is-at 00:10:db:ff:20:90, length
46
13:42:46.755646 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:42:46.759556 00:10:db:ff:20:90 > fe:26:5a:76:37:77, ethertype ARP
(0x0806), length 60: Reply 10.8.1.254 is-at 00:10:db:ff:20:90, length
46
13:42:47.765540 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:42:47.767170 00:10:db:ff:20:90 > fe:26:5a:76:37:77, ethertype ARP
(0x0806), length 60: Reply 10.8.1.254 is-at 00:10:db:ff:20:90, length
46
13:42:48.769890 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:42:48.773466 00:10:db:ff:20:90 > fe:26:5a:76:37:77, ethertype ARP
(0x0806), length 60: Reply 10.8.1.254 is-at 00:10:db:ff:20:90, length
46


 tcpdump -e -nn -s 0 -i vnet0 'ether host ( 00:10:db:ff:20:90 or
00:26:5a:76:37:77 or f2:ab:75:e1:32:56 ) and arp'
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on vnet0, link-type EN10MB (Ethernet), capture size 262144 bytes
13:43:48.733304 f2:ab:75:e1:32:56 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 60: Request who-has 10.8.1.254 tell 10.8.1.24, length
46
13:43:50.864755 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:43:51.873545 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:43:52.876357 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28
13:43:53.879307 00:26:5a:76:37:77 > ff:ff:ff:ff:ff:ff, ethertype ARP
(0x0806), length 42: Request who-has 10.8.1.254 (ff:ff:ff:ff:ff:ff)
tell 10.8.1.156, length 28



why the bridge-01 interface of the hypervisor see arpreply packets but
they doesn't get relayed to the vnet0 interface of vm1?


what might be the problem?
