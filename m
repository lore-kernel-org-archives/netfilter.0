From: DEMAINE Benoit-Pierre <benoit@demaine.info>
Subject: ebtables to perform MAC NAT ?
Date: Mon, 21 Jul 2008 08:09:49 +0200
Message-ID: <4884282D.80804@demaine.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello (this is my first post on this list).

I want to use a small PC as Wireless Access-Point. The machine has this 
hardware:
00:07.0 Network controller: Intersil Corporation Prism 2.5 Wavelan 
chipset (rev 01)
00:0f.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
RTL-8139/8139C/8139C+ (rev 10)

The system is Debian with Hostap package.

For a long time, I used to use it only as a NAT bridge, using Iptables 
script. But Iptables implies "one way only request", and two different 
unrouted networks, that are not very practical for users.

I have recently tried to convert the machine to a pure bridge, using 
brctl. It does not work. In fact, it's years I am warned brctl rarely 
works with wifi cards. Still, I think that modern tools can workaround 
the old limits.

What's available now:

br0       Link encap:Ethernet  HWaddr 00:09:5B:91:56:08
           inet addr:192.168.0.203  Bcast:192.168.0.255  Mask:255.255.255.0
           inet6 addr: fe80::209:5bff:fe91:5608/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:1192127 errors:0 dropped:0 overruns:0 frame:0
           TX packets:1094443 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:296603610 (282.8 MiB)  TX bytes:272312079 (259.6 MiB)

br0:1     Link encap:Ethernet  HWaddr 00:09:5B:91:56:08
           inet addr:192.168.0.204  Bcast:192.168.0.255  Mask:255.255.255.0
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1

eth0      Link encap:Ethernet  HWaddr 00:E0:C5:68:F9:6E
           inet6 addr: fe80::2e0:c5ff:fe68:f96e/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:553969 errors:0 dropped:0 overruns:0 frame:0
           TX packets:712094 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:51979425 (49.5 MiB)  TX bytes:270921240 (258.3 MiB)
           Interrupt:10 Base address:0xe000

eth1      Link encap:UNSPEC  HWaddr 
00-09-5B-91-56-08-30-3A-00-00-00-00-00-00-00-00
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:641464 errors:0 dropped:0 overruns:0 frame:0
           TX packets:531774 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:1000
           RX bytes:273746227 (261.0 MiB)  TX bytes:63487239 (60.5 MiB)
           Interrupt:11

lo        Link encap:Local Loopback
           inet addr:127.0.0.1  Mask:255.0.0.0
           inet6 addr: ::1/128 Scope:Host
           UP LOOPBACK RUNNING  MTU:16436  Metric:1
           RX packets:4 errors:0 dropped:0 overruns:0 frame:0
           TX packets:4 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:380 (380.0 b)  TX bytes:380 (380.0 b)

wlan0_ren Link encap:Ethernet  HWaddr 00:09:5B:91:56:08
           inet6 addr: fe80::209:5bff:fe91:5608/64 Scope:Link
           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
           RX packets:641464 errors:0 dropped:0 overruns:0 frame:0
           TX packets:531774 errors:0 dropped:0 overruns:0 carrier:0
           collisions:0 txqueuelen:0
           RX bytes:262199875 (250.0 MiB)  TX bytes:59233047 (56.4 MiB)
           Interrupt:11


Gluton:~# brctl show
bridge name     bridge id               STP enabled     interfaces
br0             8000.00095b915608       no              eth0
                                                         wlan0_rename

For obvious reasons, I run this during init:
echo 1 > /proc/sys/net/ipv4/ip_forward

Straight after setting up the bridge, the machine can be accessed by 
both sides, but nothing goes through. When one side (let say host A on 
the ethernet side) tries to ping the other side (let say host B in Wifi 
side), I see this in console:
Gluton:~# tcpdump -veni br0 arp
tcpdump: listening on br0, link-type EN10MB (Ethernet), capture size 96 
bytes
07:49:29.152299 00:d0:b7:0a:4c:d0 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 60: arp who-has 192.168.0.1 tell 192.168.0.51
07:49:30.152305 00:d0:b7:0a:4c:d0 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 60: arp who-has 192.168.0.1 tell 192.168.0.51
07:49:31.152306 00:d0:b7:0a:4c:d0 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 60: arp who-has 192.168.0.1 tell 192.168.0.51
07:49:32.828278 00:d0:b7:0a:4c:d0 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 60: arp who-has 192.168.0.1 tell 192.168.0.51

After
	 ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
	 --to-source 00:09:5B:91:56:08 --snat-arp ;
I get a bit more messages:

Gluton:~# tcpdump -veni br0 arp
tcpdump: listening on br0, link-type EN10MB (Ethernet), capture size 96 
bytes
07:50:33.792127 00:d0:b7:0a:4c:d0 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 60: arp who-has 192.168.0.1 tell 192.168.0.51
07:50:33.797225 00:11:95:06:ee:3c > 00:09:5b:91:56:08, ethertype ARP 
(0x0806), length 46: arp reply 192.168.0.1 is-at 00:11:95:06:ee:3c
07:50:39.688119 00:d0:b7:0a:4c:d0 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 60: arp who-has 192.168.0.1 tell 192.168.0.51
07:50:39.693650 00:11:95:06:ee:3c > 00:09:5b:91:56:08, ethertype ARP 
(0x0806), length 46: arp reply 192.168.0.1 is-at 00:11:95:06:ee:3c
07:50:40.688125 00:d0:b7:0a:4c:d0 > ff:ff:ff:ff:ff:ff, ethertype ARP 
(0x0806), length 60: arp who-has 192.168.0.1 tell 192.168.0.51
07:50:40.692909 00:11:95:06:ee:3c > 00:09:5b:91:56:08, ethertype ARP 
(0x0806), length 46: arp reply 192.168.0.1 is-at 00:11:95:06:ee:3c

In both cases, the TX packet counter increases for the Wifi card; the RX 
packet counter increases only in the second case => as said in many 
forums: the Wifi card seems to be unable to send packets with a MAC 
different from it's own.

A=00:d0:b7:0a:4c:d0
G=00:09:5b:91:56:08
B=00:11:95:06:ee:3c

My snat command seems to improve things, since Gluton (G for gateway) 
now receive an answer; but, if i understand correctly, when G receives 
the answer, it is not forwarded to the querying host: A. As consequence, 
A's arp table remains empty: arp -n => "192.168.0.1 (incomplete)" .

So, i tried to force arp answers. After the following:
	ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
	 --to-source 00:09:5B:91:56:08 --snat-arp ; ebtables -t nat -A
	 PREROUTING -p arp -j arpreply --arpreply-mac 00:09:5B:91:56:08
all arp querries are answered, to the MAC of the bridge. As an 
advantage, traffic now goes through; as a problem, Gloton answers even 
for IPs that are not taken by any host of any side; this prevents 
systems to boot (before taking an IP, Windows and Linux make an arp 
who-has, and gluton answers, so, the OS complains the IP is already 
assigned to an other host). After forcing manually, or disconnecting 
Gluton for a few seconds, host can take their IPs.

??? Question: how to tell Gluton to always provide answers to arp 
querries when the host is available, and answer only when IP is not 
located on the same side as the question comes from ? In other words, I 
want Gluton to check if an IP is alive, and, if it is not on the same 
side as the question, it should answer it's own MAC.

Two people said they can use brctl with this MA301. I may not have the 
same firmware as they do. Still, I am certain there is an ebtables 
solution to this problem. I have been thinking about the redirect 
Target, but not sure where my packets goes. Snat obviously NAT correctly 
from A to B question, but not the answer from B to A.

Since IPs could move from one side to an other, I really need something 
dynamic (in the 1s to 10s range); I wondered if the --among-dst-file 
option reads file only when declaring the rule, or if it is read 
periodically from the disk; in the second case, I could periodically 
refresh some tables after a periodical compleet scan ...

NB: i don't mind at all about security; i am only trying to get traffic 
go through, as if it was a cheap AP.

You can assume I did not run any other basic command than "echo 1 > 
/proc/sys/net/ipv4/ip_forward".

I would love this machine to be IPv6 compliant in the coming months, so, 
please, try to avoid things that would limit this feature. But if, as I 
think, the problem is only around ARP, IPv6 should not be a problem 
(but, i may be wrong; there seem to be strange IPv6 specific discovery 
packets).

The whole problem lays in arp tables: if after
	 ebtables -t nat -F ; ebtables -t nat -A POSTROUTING -j snat
	 --to-source 00:09:5B:91:56:08 --snat-arp ;
I declare arp tables manually on all hosts, everything works fine.

Thanks.

-- 
  >o_/ DEMAINE Benoit-Pierre (aka DoubleHP) http://benoit.demaine.info/
If computing were an exact science, IT engineers would not have work \_o<

"So all that's left, Is the proof that love's not only blind but deaf."
(FAKE TALES OF SAN FRANCISCO, Arctic Monkeys)
