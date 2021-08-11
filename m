From: Florian Westphal <fw@strlen.de>
Subject: Re: Why aren't INPUT and FORWARD chains available to a
 locally-generated packet?
Date: Wed, 11 Aug 2021 23:09:19 +0200
Message-ID: <20210811210919.GX607@breakpoint.cc>
References: <CACj4R39Zf=cK5p3-_YtDhvqqBMLd3Jyrk7uhcoc9pTm_PrUhtA@mail.gmail.com>
 <20210811142921.GW607@breakpoint.cc>
 <CACj4R39Whos6mVwo1CsvR7me61raq2udnxevjBYgMru3V__JGQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACj4R39Whos6mVwo1CsvR7me61raq2udnxevjBYgMru3V__JGQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry <simonsharry@gmail.com>
Cc: netfilter@vger.kernel.org

Harry <simonsharry@gmail.com> wrote:

Please keep the ML in CC, thnaks.

> On Wed, Aug 11, 2021 at 7:59 PM Florian Westphal <fw@strlen.de> wrote:
> > Harry S <simonsharry@gmail.com> wrote:
> > [..]
> > > Let's say a process on a router host generates a packet. This packet
> > > goes to the OUTPUT chain, following which a routing decision is made.
> >
> > No, for output, routing decision happens before output.
> 
> I perhaps had this documentation source in mind; see the ASCII diagram
> and also the explanation below it for what it says when the routing
> happens:
>     https://netfilter.org/documentation/HOWTO//netfilter-hacking-HOWTO-3.html

"[..] in fact, the routing code is called first (to figure out the source IP
address and some IP options): if you want to alter the routing, you must alter
the `skb->dst' field yourself, as is done in the NAT code."

> But in this diagram,
>     https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg
> as well as in Table 6-2 in the iptables-tutorial here,
>     https://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#TRAVERSINGOFTABLES
> routing happens before OUTPUT -- just like you say.

Yes.

> I guess, my confusion is: Even if routing happens before OUTPUT, why
> in the Netfilter Packet Flow diagram above there is no arrow going to
> mangle:INPUT *also* apart from the raw:OUTPUT arrow already shown in
> the diagram?

Because packets never move directly from OUTPUT to INPUT.

> Could you or someone confirm if the Netfilter Packet Flow Diagram is
> fully accurate *and* complete, as far as the Network and higher layers
> are concerned? (That is, ignoring the ebtables stuff.)

Its accurate.

> > There is a rerouting check/reroute enforcement in mangle:output
> > to handle a change in the packet mark.
> 
> I'm not sure if I'm following. It's shown neither in the diagram nor
> in Table 6-2. This means the diagram and the table are incomplete
> and/or inaccurate?

It says "reroute check", after filter. Its technically incorrect since
there are several reroute checks but I guess it would get too entangled
otherwise.

> > > Now, this packet could be destined either for the loopback interface,
> > > or for one of the host's many ethernet interfaces. If so, why
> > > shouldn't Netfilter bring the packet to the same INPUT / FORWARD
> > > decision-fork in the path that exists for an incoming packet soon
> > > after it has crossed PREROUTING?
> >
> > If its loopback, packet ends up using:
> >
> > OUTPUT -> POSTROUTING -> PREROUTING -> INPUT (or FORWARD).
> 
> Hmm, after POSTROUTING, all texts that I've looked at say that the
> packet is out on the wire!

It is.  Loopback driver maps each xmit to a packet receive.
Packet thus moves from postrouting to prerouting.
