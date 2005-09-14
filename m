From: "Ferry van Aesch" <tmp123@bavirtual.org>
Subject: Performance issues
Date: Wed, 14 Sep 2005 20:53:46 +0100
Message-ID: <004c01c5b966$5386e7c0$94010a0a@commtech.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

Gents, I'm using 2.6.13-1 (same results with 2.4.27 though). I have a =
PIII 550Mhz with 4 3Com NICs:
  Bus  0, device  12, function  0:
    Ethernet controller: 3Com Corporation 3c905C-TX/TX-M [Tornado] (rev =
120).
      IRQ 5.
      Master Capable.  Latency=3D80.  Min Gnt=3D10.Max Lat=3D10.
      I/O at 0xe400 [0xe47f].
      Non-prefetchable 32 bit memory at 0xfedffc00 [0xfedffc7f].
  Bus  0, device  14, function  0:
    Ethernet controller: 3Com Corporation 3c905C-TX/TX-M [Tornado] (#2) =
(rev 120).
      IRQ 10.
      Master Capable.  Latency=3D80.  Min Gnt=3D10.Max Lat=3D10.
      I/O at 0xf400 [0xf47f].
      Non-prefetchable 32 bit memory at 0xfedff800 [0xfedff87f].
  Bus  0, device  16, function  0:
    Ethernet controller: 3Com Corporation 3c905 100BaseTX [Boomerang] =
(rev 0).
      IRQ 9.
      Master Capable.  Latency=3D64.  Min Gnt=3D3.Max Lat=3D8.
      I/O at 0xe800 [0xe83f].
  Bus  0, device  18, function  0:
    Ethernet controller: 3Com Corporation 3c905 100BaseTX [Boomerang] =
(#2) (rev 0).
      IRQ 11.
      Master Capable.  Latency=3D64.  Min Gnt=3D3.Max Lat=3D8.
      I/O at 0xe000 [0xe03f].

mii-diag output:
eth0:
mii-diag.c:v2.11 3/21/2005 Donald Becker (becker@scyld.com)
 http://www.scyld.com/diag/index.html
  Using the new SIOCGMIIPHY value on PHY 24 (BMCR 0x3000).
 The autonegotiated capability is 01e0.
The autonegotiated media type is 100baseTx-FD.
 Basic mode control register 0x3000: Auto-negotiation enabled.
 You have link beat, and everything is working OK.
   This transceiver is capable of  100baseTx-FD 100baseTx 10baseT-FD =
10baseT.
   Able to perform Auto-negotiation, negotiation complete.
 Your link partner advertised 41e1: 100baseTx-FD 100baseTx 10baseT-FD =
10baseT.
   End of basic transceiver information.

libmii.c:v2.11 2/28/2005  Donald Becker (becker@scyld.com)
 http://www.scyld.com/diag/index.html
 MII PHY #24 transceiver registers:
   3000 782d 0041 6800 05e1 41e1 0007 2801
   0000 0000 0000 0000 0000 0000 0000 0000
   0618 c011 0030 4001 40c8 a000 0000 0000
   d300 0220 8084 9119 0065 1b69 7fff 0000.
 Basic mode control register 0x3000: Auto-negotiation enabled.
 Basic mode status register 0x782d ... 782d.
   Link status: established.
   Capable of  100baseTx-FD 100baseTx 10baseT-FD 10baseT.
   Able to perform Auto-negotiation, negotiation complete.
 Vendor ID is 00:10:5a:--:--:--, model 0 rev. 0.
   No specific information is known about this transceiver type.
 I'm advertising 05e1: Flow-control 100baseTx-FD 100baseTx 10baseT-FD =
10baseT
   Advertising no additional info pages.
   IEEE 802.3 CSMA/CD protocol.
 Link partner capability is 41e1: 100baseTx-FD 100baseTx 10baseT-FD =
10baseT.
   Negotiation  completed.


eth3:
mii-diag.c:v2.11 3/21/2005 Donald Becker (becker@scyld.com)
 http://www.scyld.com/diag/index.html
  Using the new SIOCGMIIPHY value on PHY 24 (BMCR 0x3100).
 Basic mode control register 0x3100: Auto-negotiation enabled.
 You have link beat, and everything is working OK.
   This transceiver is capable of  100baseTx-FD 100baseTx 10baseT-FD =
10baseT.
   Able to perform Auto-negotiation, negotiation complete.
 Your link partner is generating 10baseT link beat  (no =
autonegotiation).
   End of basic transceiver information.

libmii.c:v2.11 2/28/2005  Donald Becker (becker@scyld.com)
 http://www.scyld.com/diag/index.html
 MII PHY #24 transceiver registers:
   3100 786d 2000 5c01 01e1 0021 0000 0000
   0000 0000 0000 0000 0000 0000 0000 0000
   0000 0000 0000 0000 0000 0000 0001 8060
   8020 0c78 0000 3000 a3b9 0080 c305 001d.
 Basic mode control register 0x3100: Auto-negotiation enabled.
 Basic mode status register 0x786d ... 786d.
   Link status: established.
   Capable of  100baseTx-FD 100baseTx 10baseT-FD 10baseT.
   Able to perform Auto-negotiation, negotiation complete.
 Vendor ID is 08:00:17:--:--:--, model 0 rev. 1.
   Vendor/Part: National Semiconductor 83840A.
 I'm advertising 01e1: 100baseTx-FD 100baseTx 10baseT-FD 10baseT
   Advertising no additional info pages.
   IEEE 802.3 CSMA/CD protocol.
 Link partner capability is 0021: 10baseT.
   Negotiation did not complete.

Right now, I'm only using eth0 (the top one) and eth3 (the bottom one). =
Eth1 and eth2 have no cables plugged in.
eth0 has a PPPoE connection to an ISP (ADSL, 2mbit/128kbit, through a =
Netopia router in bridge mode).
On eth3 I have the rp-pppoe-server running, with a number of =
pppoe-sessions hanging off that. It's connected to a 10mbit hub (similar =
results with a 100mbit switch, 100baseTx-FD).

Now, the problem description is quite simple:
When I do a wget or ncftp or anything like that on the Linux machine, =
for instance I download a kernel from ftp.kernel.org, I get some =
211KB/s. Nothing wrong with that for a 2mbit line.
When I do a big transfer over eth3 (so an ftp from the linux machine =
(server) to a windows machine (client) that is one of the pppoe-clients =
on eth3), I can easily saturate the 10mbit hub, and I get a good few =
megabit when using the switch. Again, nothing wrong with that.

Now for the problem. When I use one of those Windows clients to download =
something from the Internet (simple NAT rule in the nat table), I get a =
maximum of about 50KB/s. I can get it to go up to some 90KB/s when I =
play around with the TCP receive window size in the Windows registry, =
but a) that's still way too slow and b) I don't want to mess around with =
Windows registries.

When I force the transfers through a squid proxy on the Linux machine, I =
get 211KB/s again. Two seperate TCP streams in other words.

So, it seems that something is slowing things down a *lot* during the =
NAT step.

I've swapped out the hub for a 100mbit switch, to no avail. I've =
assigned an IP to eth3 and a windows machine (to get the pppoe-server =
out of the equation), but to no avail either. I do some HTB stuff on the =
pppoe-connections, but with those disabled (so the standard pfifo_fast =
re-instated), there's also zero in the difference.

It doesn't look like the CPU is going mad over it either, an uptime =
still shows 0.00 0.00 0.00, and the machine is very responsive, so I =
don't think that I'm draining the resources either (not that you'd =
expect that with only 2mbit...)

I've gone back to a 2.4 kernel, but the results are the same.

I'm a bit stumped really. I've set up numerous routers with 2.2 kernels =
(ipchains NAT though), with 3Com cards as well, and I've never had any =
performance issues, even with full 100mbit transfers through it.

The NAT rule is nothing spectacular either:
Chain POSTROUTING (policy ACCEPT 685 packets, 66775 bytes)
 pkts bytes target     prot opt in     out     source               =
destination
  240 17774 SNAT       all  --  *      *       10.11.2.0/24         =
0.0.0.0/0           to:xx.xx.xx.xx

Does anyone know what could be going on here? I'd really appreciate some =
help: this machine is going to serve a rural broadband scheme here =
(wireless), so the 2mbit line is going to be something better, and =
there's going to be a good number of people tapping in to this. However, =
with a max throughput of 50KB/s, there's not much I can do.

If there's any other info that you might need, just ask!


Thanks in advance,

Ferry van Aesch
Ireland.
