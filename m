From: Mohan Khurana <mkhurana@andrew.cmu.edu>
Subject: Re: SNAT matching question
Date: Sun, 29 Sep 2002 10:15:00 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44L-027.0209291005290.1180-100000@unix4.andrew.cmu.edu>
References: <20020929135323.MYFB13996.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929135323.MYFB13996.mta05-svc.ntlworld.com@there>
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

I'm trying to use the equalize nexthop iproute2 command with netfilter in
order to load balance between two ISPs on this router.  Equalize gives me
different gateway IPs on route determination.  The problem is, if I have
two different ISPs, I think I want something in the NAT table that would
determine which gateway the packet was going out of in order to match it
to the right --to-source address.

Let's say for example that I have something like:

ip route default table 1 equalize
		nexthop via 1.2.3.4 dev eth0
		nexthop via 5.6.7.8 dev eth1

This will give me a gateway of 1.2.3.4 in some cases, and 5.6.7.8 in some
cases (from that I understand, it dishes our the gateway in a round-robin
sort of manner, no?).  Now, if it selected 1.2.3.4 as the gateway, I'd
want it to NAT (if necessary) on 1.2.3.4, otherwise, if it selected
5.6.7.8, I'd want it to NAT on 5.6.7.8.  Does this make sense?

seeking wisdom,

mohan

On Sun, 29 Sep 2002, Antony Stone wrote:

> On Sunday 29 September 2002 2:30 pm, Mohan Khurana wrote:
>
> > Hi everyone,
> >
> > I'm trying to make a dual-homed router right now.
> >
> > I'm wondering, if I add two SNAT entries to the POSTROUTING chain of the
> > nat table, that are completely identical except the the fact that they
> > have different values for their specification of --to-source, will both of
> > them get the opportunity to match?  What decides which one matches them?
>
> Well, yes, they will both get the *opportunity* to match (ie every packet
> will get tested against both rules), however depending on how you qualify the
> rules (specifically, whether you check the source address), the second one
> may not match because the first one has already changed the address.
>
> > I am wondering, if packets come in, and I route them, and ensure that
> > their next-hop is one of the --to-sources, will the rule check both the
> > source range, and the value of the --to-source?
>
> I don't understand.   Why would you set the *source* address of a packet to
> be the address of the next-hop router you're just about to send it on to ?
> Where are you expecting a reply to come back to ?
>
> > Example:
> >
> > iptables -t nat -A POSTROUTING -s 192.168.2.10 -d \! 192.168.2.0/24 -j
> > SNAT --to-source 1.2.3.4
>
> This rule will match all packets with a source address = 192.168.2.10 which
> are not going to the network 192.168.2.0/24 (if they were, why would they be
> going through this firewall anyway ?   They'd just get sent straight across
> the local network...) and will change the source address to 1.2.3.4
>
> > iptables -t nat -A POSTROUTING -s 192.168.2.10 -d \! 192.168.2.0/24 -j
> > SNAT --to-source 5.6.7.8
>
> This rule will try to match all packets with a source address = 192.168.2.10
> which are not going to the network 192.168.2.0/24 but there will never be
> any, because they've all just been changed to have a source address = 1.2.3.4
>
> > If in my iproute2 configuration, if I ensure that the packet is going out
> > with source 5.6.7.8 when flowing around, it should match to the second
> > rule, and skip the first altogether, right?  If I set it to hop to source
> > 1.2.3.4, it should choose the first nat rule, and then skip the second one
> > altogether, right?
>
> I don't understand what you're saying here, and I'm not sure I understand
> what you're trying to do.
>
> Perhaps you could explain your network setup a bit more, and explain what
> you're trying to achieve, and we can comment on whether this seems like a
> reasonable way to achieve it.....
>
> Antony.
>
> --
>
> I vote "no" to this proposal to form a committee to investigate whether we
> should or should not hold a ballot on whether to vote yet.
>
>
>


