From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat problem in transparent firewall
Date: Wed, 4 Aug 2004 09:45:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408040945.19567.Antony@Soft-Solutions.co.uk>
References: <200408041010.32442.raido@elin.ttu.ee>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408041010.32442.raido@elin.ttu.ee>
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

On Wednesday 04 August 2004 8:10 am, Raido Kurel wrote:

> > Do you have a FORWARD rule allowing packets through to aaa.aaa.aaa.13
> > after they've been NATted?
>
> Yes.
> Also packets from Internet to aaa.aaa.aaa.13 reach destination.
> I am more worried about fact, that
> -t nat -A PREROUTING -j DNAT ...
> and then
> -t nat -A PREROUTING -j LOG ...
> does not log anything. Without the first rule logging works.

That's because the DNAT target does not return to the chain.   The LOG target 
is almost the only target I can think of which *does* return back to the 
chain for further processing - all other targets are the "final outcome" for 
the packet.

Put the two rules the other way round and you'll get both LOGging and 
DNATting.

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


