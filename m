From: "John Wells" <lists@sourceillustrated.com>
Subject: icmp unreachable - need to frag
Date: Sun, 24 Oct 2004 01:50:06 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1865.172.16.3.2.1098597006.squirrel@172.16.3.2>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Gentlemen,

I'm having a perplexing problem with icmp unreachable packets.  I'm
running TaoLinux with kernel 2.4.21 and iptables v.1.2.8.

I have a network setup that includes a DSL connection to the internet, and
internal lan, and an wireless lan that can connect to the internal lan via
a PPTP VPN (due to lack of a good ipsec client for Mac OSX).

It essentially looks like this:

All wireless clients (after authenticated with PPTP): 192.168.0.0/24
All internal LAN clients: 172.16.0.0/16

A VPN server/router sits between the wireless and internal lan, with two
interfaces enabled...one that has a 192.168.0.1 address, and one that has
a 172.16.3.2 address.  The router takes traffic from the wireless clients
and masquerades it into the internal network.  If the traffic from the
wireless clients is destined for the Internet, the packets are again
MASQ'd on that outbound connection from the internal lan.

This has worked for some time with only one eMac (MacOSX) connecting from
the wireless network.  No problems whatsoever.  However, this past week, I
added a Windows XP laptop to the mix.  It appeared, at first, to be
working, and indeed it is for most sites.  However, accessing certain
sites from the laptop...slashdot, wikipedia, amazon.com, cause icmp
unreachable messages to be sent.  For example, here's an attempt to
connect to slashdot:

[root@airport scripts]# tcpdump host slashdot.org -l
tcpdump: listening on eth0
09:33:24.269454 172.16.3.2.1829 > slashdot.org.http: S
3045606506:3045606506(0)
win 16384 <mss 860,nop,nop,sackOK> (DF)
09:33:27.224869 172.16.3.2.1829 > slashdot.org.http: S
3045606506:3045606506(0)
win 16384 <mss 860,nop,nop,sackOK> (DF)
09:33:27.332020 slashdot.org.http > 172.16.3.2.1829: S
911608977:911608977(0) ac
k 3045606507 win 5840 <mss 1460,nop,nop,sackOK> (DF) [tos 0x20]
09:33:27.336360 172.16.3.2.1829 > slashdot.org.http: . ack 1 win 17200 (DF)
09:33:27.338073 172.16.3.2.1829 > slashdot.org.http: P 1:481(480) ack 1
win 1720
0 (DF)
09:33:27.457883 slashdot.org.http > 172.16.3.2.1829: . ack 481 win 6432
(DF) [to
s 0x20]
09:33:28.264668 slashdot.org.http > 172.16.3.2.1829: . 1:861(860) ack 481
win 64
32 (DF) [tos 0x20]
09:33:28.265251 172.16.3.2 > slashdot.org: icmp: 172.16.3.2 unreachable -
need t
o frag (mtu 896) [tos 0xc0]
09:33:28.269985 slashdot.org.http > 172.16.3.2.1829: . 861:1721(860) ack
481 win
 6432 (DF) [tos 0x20]
09:33:28.270114 172.16.3.2 > slashdot.org: icmp: 172.16.3.2 unreachable -
need t
o frag (mtu 896) [tos 0xc0]
09:33:31.260505 slashdot.org.http > 172.16.3.2.1829: . 1:861(860) ack 481
win 64
32 (DF) [tos 0x20]
09:33:31.260820 172.16.3.2 > slashdot.org: icmp: 172.16.3.2 unreachable -
need t
o frag (mtu 896) [tos 0xc0]
09:33:37.261652 slashdot.org.http > 172.16.3.2.1829: . 1:861(860) ack 481
win 64
32 (DF) [tos 0x20]
09:33:37.262174 172.16.3.2 > slashdot.org: icmp: 172.16.3.2 unreachable -
need t
o frag (mtu 896) [tos 0xc0]

I'm no expert regarding this sort of stuff, but logic suggested that the
problem was with the mtu somewhere on the path.  I did note that the MTU
on the ppp0 (pptp) interface was 896, so I tried increasing this value. 
No luck, same behavior.  This was also true if I tried to lower it.

I'm at a loss for what to try, and my research hasn't run across anything
substantial.  Scrapping the XP laptop is not an option, unfortunately. 
The eMac continues to function fine on these sites, and I haven't run
across anything glaringly obvious on the Windows side.

Is this likely a misconfiguration on my part?  Has anyone experienced
anything similar?

I appreciate any insight you can provide.

John


