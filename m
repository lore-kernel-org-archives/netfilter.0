From: Mohan Khurana <mkhurana@andrew.cmu.edu>
Subject: Re: SNAT matching question
Date: Sun, 29 Sep 2002 13:09:13 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44L-027.0209291259220.1180-100000@unix4.andrew.cmu.edu>
References: <20020929164657.RSYO13996.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929164657.RSYO13996.mta05-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Sun, 29 Sep 2002, Antony Stone wrote:

> No - I meant that there's no sensible way of balancing incoming connections
> because you have no control over the routing of packets out on the Internet
> which are coming to you.

Hmmm, this is true.

> Reply packets should not be a problem unless your ISPs block packets with
> source addresses which don't match the network range you have from them.

This is also true, but what if they do block?  I was hoping there was a
way to maintain connection tracking such that if there is a machine on the
internet that connects to an internally hosted server, it would maintain
the incoming gateway and interface, and then ensure that the equalize
command would ensure that the outgoing packet going to the right gateway.

ip route default table 1 equalize
	nexthop via 1.2.3.4
	nexthop via 5.6.7.8

Lets say some internet machine contact my webserver, which happens to be
at 1.2.3.33.  It would come in on 1.2.3.4.  Now the webserver needs to
send IP packets back out to the internet, so it does a routing table
lookup.  Because ISP1 would block ISP2 traffic and vice-versa, if the
selected gateway (as a result of the equalize statement above) is 5.6.7.8,
then the only way to get that IP packet out would be to NAT it on an IP
from ISP2.  Post-NAT, this would change the source field of the IP packet,
and break communication (the machine on the internet wanted a source of
1.2.3.33).

I think the solution is for incoming packets destined to servers marked as
state NEW to have their gateway and source address placed in a table.
When 1.2.3.33 wants to go out, the equalize flag should look up the table,
see if the destination host is in there, and if it is, it should return
the proper corresponding gateway.

What do you think?  Is this possible?

mohan


