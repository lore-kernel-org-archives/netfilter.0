From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Asymmetric routing and connection tracking
Date: Tue, 07 Aug 2007 13:59:30 +0200
Message-ID: <1186487970.28140.20.camel@localhost>
References: <46B81A0D.6090900@linpro.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B81A0D.6090900@linpro.no>
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
To: netfilter@lists.netfilter.org

On Tue, 2007-08-07 at 09:06 +0200, Tore Anderson wrote:
>
>  traffic to it.  So far so good.  However, when R1 comes back online,
>  I end up in a situation where inbound traffic is sent first to R1, then
>  on to R2, out to the servers on the access LAN and then back to R2,
>  which then routes the traffic directly out to the transit provider.
>  Thus R1 only sees the inbound traffic.

Assuming that you do some sort of stateful firewalling
on both R1 and R2, I wonder why this works at all, as
at least netfilter in kernel 2.6 isn't too happy
about only seeing one direction of a particular connection's traffic, 
(this used to work in 2.4 stock kernels).

Apart from that, I'd be interested to know why you
set up this system with BGP and OSPF? If you have
just on upstream transit provider?

Couldn't you simply use a another virtual IP on the
transit provider side of R1 and R2, then ask
your upstream provider to route to
that virtual IP and use some sort of generic
IP-Failover-System that switches internal and external
V-IPs only as a block. This way, you also avoid
your asymmetric routing problem. 

    Thomas


