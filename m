From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: nat problem
Date: Wed, 14 Jul 2004 00:21:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F4607B.60B1E512@knoware.nl>
References: <40F448B2.AF1E21@knoware.nl> <200407132206.08404.Antony@Soft-Solutions.co.uk>
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



Antony Stone schreef:

> On Tuesday 13 July 2004 9:40 pm, Frans Luteijn wrote:
>
> > I have a little problem, which might be a bug. I have an 3COM
> > ISDN-router. It broadcasts every 10 seconds its connectionstatus to the
> > internal net. Now I want to forward those broadcasts to another network.
>
> On Wednesday 07 July 2004 2:07 pm, Antony Stone wrote:
>
> > On Monday 05 July 2004 5:33 pm, Frans Luteijn wrote:
> > >
> > > I have a little problem, which might be a bug. I have an 3COM
> > > ISDN-router. It broadcasts every 10 seconds its connectionstatus to the
> > > internal net.
> >
> > What do yuo mean by "broadcasts"?   What protocol is being used?   What
> > address are the packets sent to?

These are real broadcasts to 192.168.1.255. The protocol is UDP, the source port
is 1025 and the destination port is 2071.Isn't it weird, that at the nat-table,
when I add a rule for logging, I can't see the above meant packets, but at the
filter- and the mangle-table those packets are logged?

At a company I worked for, DHCP broadcasts were sent from one network to another,
so it should be possible.

> >
> > > Now I want to forward those broadcasts to another network.
> >
> > If, by broadcasts, you mean packets addressed to the "broadcast address" of
> > your subnet, it can't be done - you cannot route broadcast packets across a
> > router (that's why people use bridges).   The only way it could be done is
> > to have a machine which understands the protocol, and is connected to both
> > networks, picking up the broadcast packets on one subnet, and then creating
> > new broadcast packets to send to the other network (and, of course, dealign
> > sensibly with the replies).

This is exactly what I mean. I want to forward the broadcastpackets from
192.168.1.255 to 192.168.2.255. I don't want to use a bridge here. I want those
networks separated, so I can share the connection to others without concerning
they can see my private network.

> >
> > This, for example, is how you get Windows NetBios share browsing to work
> > across network boundaries - it's not pretty, but if broadcast packets are
> > what you're starting from then it's the only way.
> >
> > Regards,
> >
> > Antony.
>
> --
> "Linux is going to be part of the future. It's going to be like Unix was."
>
>  - Peter Moore, Asia-Pacific general manager, Microsoft
>
>                                                      Please reply to the list;
>                                                            please don't CC me.



--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B




