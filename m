From: "Mark Weaver" <mark@npsl.co.uk>
Subject: 2.6 native ipsec and MASQUERADE target interaction - bug?
Date: Tue, 16 Dec 2003 15:06:08 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDCEPHEJAA.mark@npsl.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Firstly, apologies if this isn't the right list and please redirect me if
so.

There seems to be a bug in the MASQUERADE target when using 2.6.0-test11 and
ipsec.  I could reproduce the problem with:

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Now what that's _supposed_ to do with ipsec packets I'm not sure, but to be
really certain i also did:

iptables -t nat -I POSTROUTING -s 10.0.0.0/8 -d 10.0.0.0/8 -j ACCEPT

which should prevent all VPN traffic from being mangled.

Let's say we have a tunnel from 10.0.1.0/24<->10.0.2.0/24 with gateways
10.0.1.1/24 and 10.0.2.1/24 where 10.0.2.1 is the v2.6 host and 10.0.1.1 is
a v2.4+freeswan.  Connectivity is up and working and from from 10.0.2.1, all
hosts are accessible via ping and telnet.  But for all clients in the
10.0.2.0/24 subnet for which forwarding should be active on the VPN, ping
works ok across both subnets, but telnet produces packets which are
unmasqueraded as having come from port 1, sample tcpdump:

What I saw was ping working fine through the tunnel, but telnet had some
very strange results.

10.0.2.1:~# tcpdump -n -i any host 10.0.1.6
tcpdump: listening on any
15:00:56.655700 10.0.2.48.47016 > 10.0.1.6.25: S 3043083403:3043083403(0)
win 16384 <mss 1460,nop,nop,sackOK> (DF)
15:00:56.667549 10.0.1.6.25 > 10.0.2.48.47016: S 2614137956:2614137956(0)
ack 3043083404 win 65535 <mss 1460,nop,nop,sackOK> (DF)
15:00:56.667728 10.0.1.6.1 > 10.0.2.48.47016: S 2614137956:2614137956(0) ack
3043083404 win 65535 <mss 1460,nop,nop,sackOK> (DF)
15:00:56.669454 10.0.2.48.47016 > 10.0.1.6.1: R 3043083404:3043083404(0) win
0
15:00:56.669558 EXTERNAL-IP > 10.80.80.6: ESP(spi=0x69d1ec0e,seq=0x4c4)

It seems that the packet comes back in fine but is then unwrapped
(erroneously) by the MASQUERADE rule, which doesn't quite know how to
rewrite the port and somewhere shoves in a default value of 1.  I'm happy to
dig around in the code if someone gives me a place to start!

Finally, this does not affect SNAT:
iptables -t nat -I POSTROUTING -s 10.0.0.0/8 -d 10.0.0.0/8 -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.0.2.0/24 -d 0/0 -j
SNAT --to-source=$EXTIP

works fine.


