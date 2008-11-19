From: "Jason Pyeron" <jpyeron@pdinc.us>
Subject: Ebtables, bridge, and vlan confusion
Date: Tue, 18 Nov 2008 19:51:12 -0500
Message-ID: <200811190050.mAJ0ogeW020947@mail.pdinc.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a linux device (WRT54GL dd-wrt v24 kernel 2.4.36
http://www.dd-wrt.com/wiki/images/6/64/Ddwrtlogicview.jpg) with eth0 having
vlan0 and vlan1 they are happy inside a bridge br0.

All is well traffic moves freely in and out.

root@nsa1:~# ifconfig
br0       Link encap:Ethernet  HWaddr 00:1C:10:3C:89:1F
          inet addr:192.168.1.2  Bcast:192.168.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:196666 errors:0 dropped:0 overruns:0 frame:0
          TX packets:4891 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:19680738 (18.7 MiB)  TX bytes:450931 (440.3 KiB)

eth0      Link encap:Ethernet  HWaddr 00:1C:10:3C:89:1F
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:5485736 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5458572 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:3430612980 (3.1 GiB)  TX bytes:3428339101 (3.1 GiB)
          Interrupt:4

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING MULTICAST  MTU:16436  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

vlan0     Link encap:Ethernet  HWaddr 00:1C:10:3C:89:1F
          UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
          RX packets:3179327 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2311282 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:3046157762 (2.8 GiB)  TX bytes:318427196 (303.6 MiB)

vlan1     Link encap:Ethernet  HWaddr 00:1C:10:3C:89:20
          UP BROADCAST RUNNING PROMISC ALLMULTI MULTICAST  MTU:1500  Metric:1
          RX packets:2306399 errors:0 dropped:0 overruns:0 frame:0
          TX packets:3147207 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:285708095 (272.4 MiB)  TX bytes:3087831463 (2.8 GiB)

root@nsa1:~# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.001c103c891f       no              vlan0
                                                        vlan1
root@nsa1:~# lsmod
Module                  Size  Used by
switch-robo             5356   0 (unused)
switch-core             6352   0 [switch-robo]
root@nsa1:~#



Now as soon as I insmod ebtables (or subsequently ebtable_filter) traffic can no
longer traverse the bridge, until I unload the modules.

root@nsa1:~# insmod ebtables
root@nsa1:~# insmod ebtable_filter
root@nsa1:~# ebtables --list
Bridge table: filter

Bridge chain: INPUT, entries: 0, policy: ACCEPT

Bridge chain: FORWARD, entries: 0, policy: ACCEPT

Bridge chain: OUTPUT, entries: 0, policy: ACCEPT
root@nsa1:~#

My searches have not lead any insight to this issue.

Thanks

Jason Pyeron

--
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
-                                                               -
- Jason Pyeron                      PD Inc. http://www.pdinc.us -
- Principal Consultant              10 West 24th Street #100    -
- +1 (443) 269-1555 x333            Baltimore, Maryland 21218   -
-                                                               -
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
This message is copyright PD Inc, subject to license 20080407P00.

