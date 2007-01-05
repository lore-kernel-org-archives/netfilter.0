From: Ted Phelps <phelps@gnusto.com>
Subject: Re: GRE Packet in IPSec not Inbound?
Date: Fri, 05 Jan 2007 02:10:36 -0600
Message-ID: <17305.1167984636@laika.gnusto.com>
References: <00ea01c73096$671bc7d0$35535770$@com>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: Your message of Thu, 04 Jan 2007 23:54:53 MST. 
	<00ea01c73096$671bc7d0$35535770$@com> 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


"Joshua Perry" writes:
> Ok so the problem I have is that in the interface chain for the interface
> that is connected to the internet Shorewall puts a policy match filter "--m
> policy --dir in --pol none" When the ESP packets come in it matches that
> policy because it is inbound.  The GRE packet that gets excised from the ESP
> begins again at INPUT but that packet does not match that rule for some
> reason.  At first I wasn't sure if this was by design or not so I manually
> put in a jump rule without the policy match which worked good.

The IPsec packet matches the vpn1_in policy because it matches this rule:

    1   152 ACCEPT     esp  --  *      *       67.42.31.242    0.0.0.0/0

It's not surprisng that the packet no longer matches this once the ESP
wrapper is stripped away.  If you want to accept the packet because it
matched this rule when it first came in (which I assume is what you
want) then you need to mark it as having arrived on a secure interface.

Have a look at the LARTC HOWTO:

    http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.netfilter.html

Cheers,
-Ted

