From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: stop ICMP broadcasts...
Date: Wed, 3 Dec 2003 13:34:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312031838.hB3IcjAm006197@discmail.com>
References: <20031203184509.GC28783@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031203184509.GC28783@cannon.eng.us.uu.net>
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
To: 'Ramin Dousti' <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

I am on neither of those networks.  There are 2 devices on that network - an
old cisco router and the iptables box - the cisco is simply a router in this
case.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ramin Dousti
Sent: Wednesday, December 03, 2003 1:45 PM
To: Aldo S. Lagana
Cc: netfilter@lists.netfilter.org
Subject: Re: stop ICMP broadcasts...

You cannot prevent any upstream router/host from sending you any
kind of packet (including ICMP broadcasts). What you can do is
to ignore them but be carefull not to ignore legitimate ICMP's.

What network are you on? The first broadcast is coming from
216.112.46.227 and the second one is coming from 194.85.34.35.
At least this is what the DNS says which most definitely is wrong
because the broadcasts should only have local significance.

Ramin

On Wed, Dec 03, 2003 at 12:21:41PM -0500, Aldo S. Lagana wrote:

> I'm attempting to stop these types of broadcasts directed at a NIC that
has
> a registered IP address:
> 12:13:26.670379 w227.z216112046.bos-ma.dsl.cnc.net > X.X.X.X: icmp: echo
> request
> 12:13:26.701129 w227.z216112046.bos-ma.dsl.cnc.net > X.X.X.X: icmp: echo
> request
> 12:13:26.710815 w227.z216112046.bos-ma.dsl.cnc.net > 255.255.255.255:
icmp:
> echo request
> 12:13:27.192127 ns.majordomo.ru > 255.255.255.255: icmp: echo request
> 
> I simply do not want those packets coming to my IP address - is it not
> possible?  I attempted to set the /proc variable about no icmp broadcasts,
> but I still see the packets in a tcpdump - is this simply what you can
call
> a mini-dos in that the icmp probes are not really hitting the iptables
> ruleset?  These rules were no help:
> iptables -t nat -I PREROUTING -i eth1 -p icmp -j DROP
> iptables -I INPUT -i eth1 -p icmp -j DROP
> 


