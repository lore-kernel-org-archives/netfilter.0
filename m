From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat problem in transparent firewall
Date: Wed, 4 Aug 2004 12:30:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408041230.03828.Antony@Soft-Solutions.co.uk>
References: <200408041010.32442.raido@elin.ttu.ee> <200408040945.19567.Antony@Soft-Solutions.co.uk> <200408041414.51486.raido@elin.ttu.ee>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408041414.51486.raido@elin.ttu.ee>
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

On Wednesday 04 August 2004 12:14 pm, Raido Kurel wrote:

> > That's because the DNAT target does not return to the chain.   The LOG
> > target is almost the only target I can think of which *does* return back
> > to the chain for further processing - all other targets are the "final
> > outcome" for the packet.
> >
> > Put the two rules the other way round and you'll get both LOGging and
> > DNATting.
>
> Thanks, I have been missed that. Now I can ask my question in other words:
>
> I presume, that http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png is
> correct.
>
> According to this picture, my packets should flow in lowest path.
> To be sure it is so, I have made rules to log incoming packet in 3 points:
> a)iptables nat table prerouting chain
> b)ebtables filter table forward chain
> c)iptables mangle table forward chain
> d)ebtables filter table input chain
>
> I try to connect fron Internet to aaa.aaa.aaa.12
>
> In case of rule:
> iptables -t nat -A PREROUTING -d aaa.aaa.aaa.12 -j DNAT --to-dest
> aaa.aaa.aaa.13
>
> I see packet only in point a)
>
> In case of no rule or rule
> iptables -t nat -A PREROUTING -d aaa.aaa.aaa.12 -j DNAT --to-dest
> aaa.aaa.aaa.12
>
> I see packet in a), b) and c) points.
>
> I see also packet in a), b) and c) points if I connect from internet to
> aaa.aaa.aaa.13
>
> It's just like DNAT rule drops packet, but it can't be, because DNAT to the
> same address works fine. I know I have missed something important, but what
> could it be?

What do your LOGging rules say?   Is it possible that you are trying to LOG 
packets addressed to aaa.aaa.aaa.12, and therefore the rules no longer see 
the packets once the address has been changed to aaa.aaa.aaa.13?

Regards,

Antony.

-- 
I don't know, maybe if we all waited then cosmic rays would write all our 
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the list;
                                                           please don't CC me.


