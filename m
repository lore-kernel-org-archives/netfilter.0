From: Arona Ann Pearlstein <aronapearl@yahoo.com>
Subject: Forward udp broadcasts (directed broadcasts - 192.168.2.255)
Date: Wed, 19 Nov 2003 01:31:50 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031119093150.42837.qmail@web10108.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,

I need to forward udp broadcasts for a particular project.   I know it's not a
good thing security-wise, but that's a different discussion! 

Essentially, on network 10.0.2.0/24 there is a special program that generates
udp broadcast packets for network 192.168.2.0/24 (this program then, is sending
packets with a destination address 192.168.2.255).  

My Linux 2.4.22 based firewall/router does its job well and normally drops
these broadcast packets.  I have since found a couple (partial) solutions, but
I'm curious as to what the Linux 2.4 kernel can do.

From the research I've done, it seems that directed broadcasts (that is,
addresses with the form 192.168.2.255) are not supposed to be routed.

An RFC even proposes that routers include the directed broadcast routing
option, but that this routing option should be turned off by default:

http://www.faqs.org/rfcs/rfc2644.html 

Here's my question:  Is there anything in the Linux 2.4 kernel that allows
forwarding directed broadcasts?  That is, is there an option that can be
enabled in the Linux 2.4 kernel to allow forwarding directed broadcasts?

From the tests I've done using DNAT, I can route these packets, but as unicast
packets only (not as broadcast packets).  This means that only *one* machine on
the destination network receives these packets (the goal is for *all* the
machines to receive the udp packets).

I've also found that using a udp proxy type program allows me to forward these
packets.  

There is, of course, the option of implementing a bridge, but we want to avoid
bridging the two networks.

For this particular project, we'd like to find a kernel based solution (if at
all possible).

Any ideas? :-)

Thank you in advance for any information,

Ann

Arona Ann Pearlstein
aronapearl@yahoo.com


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

