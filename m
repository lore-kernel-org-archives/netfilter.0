From: "Steven Kath" <steven.kath@vyatta.com>
Subject: TCP New vs. Invalid with nf_conntrack
Date: Tue, 15 Apr 2008 18:31:34 -0700 (PDT)
Message-ID: <040101c89f61$8768de20$5000040a@skathlaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello Netfilter List,

I could use some advice or documentation on the criteria and settings
nf_conntrack and related modules use to distinguish between INVALID and
NEW TCP connections.

We use a Debian-based distro designed to act as a fully featured internet
router.  The most recent version of the software is based on Debian
Testing (Lenny) while the previous version is based on Debian Stable
(Etch).  As I understand it, Etch uses iptables 1.3.6 and the deprecated
module ip_conntrack, while Lenny uses iptables 1.4.0 and the more recent
module nf_conntrack. 

I have a network with some asymmetrical routing, such that this Linux
border router sees the return SYN/ACK traffic from a connection initiated
through a VPN router.  The Linux router sees the SYN/ACK but not the SYN
packet.  Under Etch with the module ip_conntrack the SYN/ACK is treated as
NEW. Under Lenny with the module nf_conntrack, the SYN/ACK is treated as
INVALID. 

Using the recent version, we have to allow invalid packets, but this seems
like bad practice.  

The documentation I've reviewed shows that the flags: 
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal 
and/or 
/proc/sys/net/netfilter/nf_conntrack_tcp_be_liberal
should make it so that "the behaviour is much more liberal and only
considers out of window RST packets as INVALID."

I grepped through the sources for the kernel and spotted a similar comment
preceding the declaration for this flag: "If it's non-zero, we mark only
out of window RST segments as INVALID."

I've set both of these flags to 1 but the more recent netfilter build
continues to consider the SYN/ACK packet invalid. 

Can anyone offer some insight as to why the packets are still being marked
INVALID, and what if anything can be done to have them considered NEW as
with previous versions? 

Thanks, 
- Steve

