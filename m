From: Hose <subscriptions@bluemaggottowel.com>
Subject: MARK --set-mark target + iproute2 not working as expected
Date: Wed, 12 Jan 2005 13:01:49 -0600
Message-ID: <20050112190149.GB9350@bluemaggottowel.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I've been wrestling with this since last night.  Basically I'm trying to
route certain outgoing ports out a certain interface (eth1). eth2 is the
default gateway, and eth0 is the local subnet that is being NAT'd
through the box.  I am working with something similar to this post:

http://lists.netfilter.org/pipermail/netfilter/2005-January/057842.html

This post basically explains how to route based on a --set-mark based on
an iptables --set-mark rule and corresponding iproute2 rule (appended
here for convenience):

iptables -A PREROUTING -i eth0 -t mangle  -p tcp  --dport 995 -j MARK \
--set-mark 4

ip rule add fwmark 4 table another.out
ip route add default via $GATEWAY dev eth0 table another.out
ip route flush cache

For my situation, I changed the iptables line to 
iptables -t mangle -A OUTPUT -p tcp --dport 6667 -j MARK --set-mark 4

And since it's going out an interface that gets NAT'd
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to-source $eth1_ip

This is just for test purposes; as you can see, I'm just testing out the
mark capabilities with a typical irc port.  Since the irc client is
actually on the routing box, I had to move to the OUTPUT chain instead
of PREROUTING. The corresponding iproute2 rule for fwmark 4 is inserted
and the route cache flushed.

When I try it out, I notice the remote irc server receives the client
connection but then attempts to respond with the IP address of the OTHER
interface, but on eth1!  In other words, the response comes back on
eth1 (correct), but it somehow is asking for the destination IP address
of eth2 - I noticed this because they slammed into the firewall log.

tcpdump -i eth1 port 6667 reveals that the irc client is indeed being
routed out eth1 with a supposedly correct IP... so where is the eth2 IP
address coming into play?  It shouldn't...?

I should probably mention that I'm NATing the entire subnet of eth0, and
it defaults to a gateway through eth2. iproute2 has some simple rules
setup (from [ip-address]) that correctly routes incoming requests out
the proper interface.  The only change I've made is the fwmark rule
pointing to the proper gateway on eth1.  

Finally, Chapter 11 of the Linux Advanced Routing & Traffic Control
HOWTO mentions that SNAT and --set-mark collide, but doesn't really
explain much else beyond that.  

http://www.ibiblio.org/pub/Linux/docs/HOWTO/other-formats/html_single/Adv-Routing-HOWTO.html

This is on a Debian/Woody box, with iptables v1.2.6a, and a 2.4.27
kernel.

Hose

