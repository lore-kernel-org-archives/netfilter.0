From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: icmp echo reply && FORWARD chain
Date: Sun, 2 May 2004 23:43:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009801c43096$e999e0a0$68892090@grouse>
References: <006701c43051$39130ad0$68892090@grouse> <200405021546.51594.Antony@Soft-Solutions.co.uk> <007b01c4305a$34258300$68892090@grouse> <200405021642.01619.Antony@Soft-Solutions.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Antony,

Oh, dear! I am making a lot ot mistakes. The rules are as follows:

iptables -F
iptables -F -t nat
iptables -I FORWARD -j QUEUE
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip
iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.2

The problem is that it seems icmp request destined to PC2 can be caught by
the FORWARD chain, however, the icmp reply destined to PC2 is ignored by the
FORWARD chain.

Sorry again,
Jee

PS, however, you remind me a kind of setup to make traffic bouncing back to
the same subnet.:p


> On Sunday 02 May 2004 4:29 pm, Jee J.Z. wrote:
>
> > Hi Antony,
> >
> > Sorry for the confusion.
> >
> > > > My rules on a gateway linux box (PC2) are set as follows:
> > > >
> > > > Internet (PC1 and so on)
> > > >   |
> > > >   |
> > > > (eth0:global_ip)
> > > > PC2
> > > > (eth1:192.168.0.1)
> > > >   |
> > > >   |
> > > > Internal networks (PC3 (192.168.0.2) and so on...)
> > > >
> > > > iptables -F
> > > > iptables -F -t nat
> > > > iptables -I FORWARD -j QUEUE
> > > > iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip
> > > > iptables -t nat -A PREROUTING -i eth1 -j DNAT --to 192.168.0.2
> > >
> > > That is a weird-looking rule.   Where does IP 192.168.0.2 exist on the
> > > above diagram?
> >
> > It's the internal IP of PC3. I modified the diagram a little bit. Thank
you.
>
> I modified it a bit too, so we don't have problems with line-wrap.
>
> So, what you're saying is that any packet coming in on eth1, addressed to
> anywhere at all, gets DNATted, and sent straight back out eth1 again, now
> addressed to PC3.   Hm.
>
> Why?
>
> Antony.
>
> PS: I'm not sure if the sig below (which gets selected at random by my
mail
> client) is appropriate here, however I can't see it doing any harm to
remind
> people :)
>
> -- 
> 90% of networking problems are routing problems.
> 9 of the remaining 10% are routing problems in the other direction.
> The remaining 1% might be something else, but check the routing anyway.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


