From: "dravya" <dravya@magma.ca>
Subject: Masqureading issues... packets go over wrong link
Date: Fri, 13 Aug 2004 12:42:30 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408131642.i7DGgUwE021467@webmail2.magma.ca>
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
To: Netfilter mailing list <netfilter@lists.netfilter.org>


Hello all,

I have a system setup with two phones/interfaces (ppp0 and ppp1). I access the internet
via these two interfaces only.

The problem is that there are times when a packet with the ip address of ppp0 goes over
ppp1 and vice-versa. For example, when a machine (with my machine as the gateway) pings a
website outside, I get a change of ip address (from my service provider), meaning that the
packet went on the wrong link. 

I want to be able to send these pings on a particular interface (src add of packet should
be same as ip add of interface (ppp0 or ppp1)).

I have the following rules in my iptables:

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE

and yet when a machine on my network uses my machine as the gateway to ping outside,
packets travel on the wrong link causing change of ip address of the phones. I have tested
this using ethereal and it clearly shows a ppp0 packet (src add of ppp0) outgoing on ppp1,
as I was capturing on ppp1. Also, iptables is masquerading as it shows the number of
packets it masqueraded.

Isn't iptables the last thing before the packet actually goes on the wire??? Even if
ip_route_output() gives me the wrong link shouldn't iptables be able to overright it??

Has this problem been addressed before???? Has it been fixed???

Any help would be appreciated. 
Thank you

Dravya

