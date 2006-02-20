From: Sebastian Heidl <s.heidl@teles.de>
Subject: Re: Tricking NMAP
Date: Mon, 20 Feb 2006 18:40:24 +0100
Message-ID: <1140457224.6950.23.camel@sehe-c4.berlin.teles.de>
References: <00d301c63641$476e6870$020a0aac@SOUTHWEST>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00d301c63641$476e6870$020a0aac@SOUTHWEST>
In-Reply-To: <00d301c63641$476e6870$020a0aac@SOUTHWEST>
References: <00d301c63641$476e6870$020a0aac@SOUTHWEST>
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
To: James Strickland <jstic04@cp.centennialcollege.ca>
Cc: netfilter@lists.netfilter.org

On Mon, 2006-02-20 at 12:15 -0500, James Strickland wrote:
> Hello, i am trying to set up something to further trick port scanners.  I
> want to dnat all new connections to an inside server, and not have the
> router crash!
> 
> currently, with my setup, a port scan on all ports should return that all
> ports from 1-65534 are filtered. this is done by dnat'ing all new
> connections to my wan interface over to an internal host.  The internal host
> software responds with an RST.  Unfortunately, with all the new entries for
> the router, it crashes.
> 
> is there anything i can set in proc to reserve more processes for such a
> thing?  how about adding more memory, will that help?

This is for Kernel 2.6.x, I'm not sure if it works the same way in
2.4.x.

In /proc/sys/net/ipv4/netfilter/ip_conntrack_max you can increase the
maximum number of conntrack entries. This number is limited by the
available RAM (about 250 bytes per entry, depends on your architecture).

But why don't you drop the unwanted pakets in the first place or just
answer with a reset (-j REJECT --reject-with tcp-reset) on the
router/firewall ?

HTH,
_sh_

