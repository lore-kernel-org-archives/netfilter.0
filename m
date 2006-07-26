From: WP <mls100@comcast.net>
Subject: IPTables problem perhaps related to ECN/CWR flags?
Date: Wed, 26 Jul 2006 04:45:39 -0700
Message-ID: <44C755E3.7050908@comcast.net>
Reply-To: mls1000@s92551514.onlinehome.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Greetings,

I currently setup a home network with the following topology:

Cable Modem -> Linux Computer (IPTables+NAT) -> Switch (3com 8 port 
100mbit Officeconnect) -> 4 computers.

I use Arno's IPTables Script: 
http://rocky.eld.leidenuniv.nl/iptables-firewall/arno-iptables-firewall_1.8.6c.tar.gz 
.

I run two computers running two different versions of the a server 
behind the NAT. The first version (2.0) is extremely old and runs on DOS 
6.22 and a packet driver (henceforth referred to as W2). The second 
(3.0) runs fine on Windows XP (henceforth referred to as W3). From the 
internal LAN, I can connect to both servers fine. From the outside 
though, people are only able to connect to W3 . Both listen on port 23. 
I decided to setup tcpdump and see what was going on.

I compared the packets being sent when successful (via LAN)

wireshark screenshot of tcpdump cap: 
http://s92551514.onlinehome.us/upload/LANtoW2.jpg

to the ones being ignored (via Outside)

wireshark screenshot of tcpdump cap: 
http://s92551514.onlinehome.us/upload/OUTSIDEtoW2.jpg *# note the 
connect packet is forwarded successfully, but W2 does not respond.*

...and noticed that the only difference was the ECN and CWR flags.

I did a little googling, and saw a few random posts that said some sites 
don't function with ECN enabled, and that ECN is supplied only when it 
is negotiated. So I'm thinking perhaps the outside client asks my Linux 
routing comp if it supports ECN (/proc/sys/net/ipv4/tcp_ecn is 0), Linux 
comp says yes?, packet is generated with ECN/CWR and sent to Linux, 
Linux forwards packet to W2 with those flags intact. W2, being old and 
not knowing what those flags mean, ignores the packets.

This is of course pure theory, as I have little to no knowledge of any 
of this stuff to be honest, I'm just comparing what works and what 
doesn't. So my question is this, would the CWR and ECN flags possibly 
cause W2 to act this way? If so, is there some tool I can use to strip 
those flags when forwarding packets to W2 so that they match the LAN 
packets I captured? Or is there a better solution to this whole mess?

Thanks very much,

MLS

Relevant version info etc...

Router:
Gentoo Linux 2006.0
Kernel 2.6.16
IPTables 1.3.5
Wireshark 0.99.2
TCPDump 3.9.4
LibPcap 0.9.4

W2:
MS-DOS 6.22
Intel E100B Packet Driver 11.11

