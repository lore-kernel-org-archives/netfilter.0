From: "Greg Scott" <GregScott@Infrasupport.com>
Subject: RE: Bizarre NAT behavior
Date: Fri, 8 Jul 2011 17:29:57 -0500
Message-ID: <925A849792280C4E80C5461017A4B8A2A040E2@mail733.InfraSupportEtc.com>
References: <925A849792280C4E80C5461017A4B8A2A03FEB@mail733.InfraSupportEtc.com><925A849792280C4E80C5461017A4B8A2A0404D@mail733.InfraSupportEtc.com><925A849792280C4E80C5461017A4B8A2A04055@mail733.InfraSupportEtc.com> <BANLkTinoDyYksg01LfN7W2NBXZnm3+B78g@mail.gmail.com> <925A849792280C4E80C5461017A4B8A2A0405D@mail733.InfraSupportEtc.com> <925A849792280C4E80C5461017A4B8A2A040E0@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Payam Chychi <pchychi@gmail.com>, Jan Engelhardt <jengelh@medozas.de>, Steven Kath <steven.kath@vyatta.com>, Lynn Hanson <LynnHanson@eaganhills.org>, Joe Whalen <JoeWhalen@eaganhills.org>

One more piece of data:

On the firewall, I did:

ip link set br0 promisc on

and now my telnet on port 80 test connects, as does a real browser.  For
now, I'll just put this in my rc.firewall script as a workaround unless
and until a better answer comes along.

- Greg Scott




-----Original Message-----
From: netfilter-owner@vger.kernel.org
[mailto:netfilter-owner@vger.kernel.org] On Behalf Of Greg Scott
Sent: Friday, July 08, 2011 3:39 PM
To: netfilter@vger.kernel.org
Cc: Payam Chychi; Jan Engelhardt; Steven Kath; Lynn Hanson; Joe Whalen
Subject: RE: Bizarre NAT behavior

This took me a while to get back and troubleshoot and I still don't
understand what's going on.  This is the problem with internal users
addressing a website with its external IP Address, doing SNAT and DNAT
over a Linux bridge.  The last discussion was on 6/23/2011.

From Jan Engelhardt:
> Potential explanation: Packets being dropped inside the routing core
due 
> to violation of RP filter. [tcpdump hooks in very early and thus can 
> still see stuff.]

I don't think it's an rp_filter problem - see below.  


And from Steven Kath:
> I'd gather this information to try to understand the problem better:
>
> tcpdump -e -i <dev> [filters...]
> (-e: Print the link-level header on each dump line.)
>
> tcpdump -e -i <dev> -p [filters...]
> (-p: Don't put the interface into promiscuous mode.)

Steve's suggestion helped peel back another onion layer.  Bridge br0
bridges physical interfaces eth1 and eth0.  Physical interface eth1 is
on the private LAN side, eth0 on the public Internet side.  

For my testing, from a CMD window on the server hosting the website, I
do:

telnet aa.bb.115.151 80 (aa.bb obfuscated first 2 IP Address octets), 
and then watch with tcpdump on the firewall.  

Also on the firewall, I did this:
echo "0" > /proc/sys/net/ipv4/conf/eth0/rp_filter
echo "0" > /proc/sys/net/ipv4/conf/eth1/rp_filter
echo "0" > /proc/sys/net/ipv4/conf/br0/rp_filter

So that turned of any possible rp_filtering.  

And then on the firewall:
/usr/sbin/tcpdump -p -e -i br0 host aa.bb.115.151 -nn -vv

while the telnet was running in another window.

Nothing - no output, no matter what value I use for any of the rp_filter
files.  Nothing from my telnet session to port 80 hits bridge br0 on the
firewall.  

But here's the curious part - looking at physical interface eth1, I see
these packets when I do the same telnet test:

[root@ehac-fw2011 ~]# /usr/sbin/tcpdump -p -e -i eth1 host aa.bb.115.151
-nn -vv
tcpdump: WARNING: eth1: no IPv4 address assigned
tcpdump: listening on eth1, link-type EN10MB (Ethernet), capture size
65535 bytes
14:51:33.412280 00:0f:20:f7:06:18 > 00:03:47:3a:59:79, ethertype IPv4
(0x0800), length 62: (tos 0x0, ttl 128, id 18631, offset 0, flags [DF],
proto TCP (6), length 48)
    192.168.10.2.54092 > aa.bb.115.151.80: Flags [S], cksum 0xddb2
(correct), seq 4146878900, win 65535, options [mss 1460,nop,nop,sackOK],
length 0
14:51:39.427928 00:0f:20:f7:06:18 > 00:03:47:3a:59:79, ethertype IPv4
(0x0800), length 62: (tos 0x0, ttl 128, id 18733, offset 0, flags [DF],
proto TCP (6), length 48)
    192.168.10.2.54092 > aa.bb.115.151.80: Flags [S], cksum 0xddb2
(correct), seq 4146878900, win 65535, options [mss 1460,nop,nop,sackOK],
length 0
^C
2 packets captured
2 packets received by filter
0 packets dropped by kernel
[root@ehac-fw2011 ~]#

Here's something else curious - looking at "ip link show", it looks like
bridge br0 takes on the MAC address of physical NIC eth0.  But the
internal LAN is connected to physical eth1.  I wonder if this behavior
is different than the older version?  If the MAC Address for bridge br0
is different than the physical device I'm actually connected to, I
wonder if bridging "thinks" I'm trying to hit a foreign MAC Address?  

[root@ehac-fw2011 ~]# ip link show eth1
4: eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 00:0d:88:31:d8:24 brd ff:ff:ff:ff:ff:ff
[root@ehac-fw2011 ~]# ip link show eth0
3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast
state UP qlen 1000
    link/ether 00:03:47:3a:59:79 brd ff:ff:ff:ff:ff:ff
[root@ehac-fw2011 ~]#
[root@ehac-fw2011 ~]# ip link show br0
5: br0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc prio state
UNKNOWN
    link/ether 00:03:47:3a:59:79 brd ff:ff:ff:ff:ff:ff

[root@ehac-fw2011 ~]# brctl show macs br0
bridge name     bridge id               STP enabled     interfaces
br0             8000.0003473a5979       no              eth0
                                                        eth1


Hmmmm - so a packet comes in on eth1, with a destination MAC Address
belonging to port eth0.  So eth1 throws it away because it "thinks" this
is a foreign MAC Address?  But this all worked before, so what's
different?  Or were earlier bridges in promiscuous mode by default and
now they're not?  Have I stumbled across a new bridging bug?  Is the
best workaround to just put br0 into promiscuous mode?

Thanks

- Greg Scott


--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
