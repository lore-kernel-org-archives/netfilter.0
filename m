From: Philip Craig <philipc@snapgear.com>
Subject: Re: UnNATing return packets
Date: Mon, 26 May 2003 11:18:55 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3ED16B7F.9050301@snapgear.com>
References: <081A08701BD5BA46ACEE07E9D8A60F871801E4@troy.win.aquilauk.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tim Saunders <Tim.Saunders@aquilauk.co.uk>
Cc: netfilter@lists.netfilter.org

Tim Saunders wrote:
> Your description describes exactly what is happening far better than
> mine did. I am trying to do source routing so that all packets from
> 203.x.x.x go out on the same line as they came in on. Which is not via
> the default route for outgoing packets. To give an example eth0 is
> connected to routers A and B. The default route is to go out via router
> A. Packets destined for 203.x.x.x will come in via router B so the
> return packets need to go out via router B. When the routing decision is
> made the return packets have a source address of: 192.168.0.1 so they
> get routed via router A, then in post routing they get unNATed to a
> 203.x.x.x address. Thus DNAT of incoming connections cannot be used with
> source routing.

A possible solution is to use the CONNMARK patch from p-o-m
in conjunction with mark based routing.  I haven't personally
used this method, but in theory it should work.  Set a mark
for the first packet of every connection based on the orignal
destination, and then restore the mark for subsequent packets
in the connection, and route based on that mark.  The following
untested rules are something like what you want:

iptables -t mangle -A PREROUTING -d 203.0.0.0/8 -m state --state NEW -j CONNMARK --set-mark 1
iptables -t mangle -A PREROUTING -m state --state RELATED,ESTABLISHED -j CONNMARK --restore-mark

http://lartc.org/howto/lartc.netfilter.html has examples of
mark based routing.

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


