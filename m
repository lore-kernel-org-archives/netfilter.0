From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: TTL patch buggy?
Date: Wed, 7 Jan 2004 15:44:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040107204422.GB20346@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0401071709030.4717-100000@filer.marasystems.com> <1073502275.16972.10.camel@jasiiitosh.nexusmgmt.com> <200401071918.26902.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200401071918.26902.Antony@Soft-Solutions.co.uk>
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

On Wed, Jan 07, 2004 at 07:18:26PM +0000, Antony Stone wrote:

> The whole point of the TTL field in IP headers in the first place was to avoid 
> routing loops (small or large).

Absolutely.

> 
> TTL gets decremented by every router a packet passes through, so that 
> eventually after passing through some (larger than is reasonable for a normal 
> journey) number of routers, the packet gets discarded.   In normal 
> circumstances this does not happen, however when it does happen it is 
> important that it happens correctly.
> 
> If you ever increase the value of TTL on a packet's journey through a router, 
> then a routing loop involving that router will not be detected unless the 
> number of other routers involved in the loop is at least as many as the 
> amount you have increased the TTL by.

Good point. I like the formulation :-)

> Therefore I would suggest that leaving TTL as it is (ie: not decrementing it, 
> but not incrementing it either) on its way through a router is just about 
> acceptable (and this will prevent the machien from showing up in traceroutes, 
> which I understand is the requirement here?)

All that said, I believe there is no harm in incrementing the TTL for the
inbound packets __iff__ one's network is not that deep and most definitely not
a transit network.

Ramin



> but incrementing it so that its 
> value on leaving a machine is any higher than it was on arriving at the 
> machine is a Very Bad Idea(TM).
> 
> IMHO & YMMV, etc...
> 
> Antony.
> 
> -- 
> This is not a rehearsal.
> This is Real Life.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 

