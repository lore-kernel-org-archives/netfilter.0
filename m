From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: Re: Routing, SNAT and two ISPs
Date: Thu, 12 Aug 2004 09:11:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03ab01c48009$4f8a9640$0100a8c0@newlife>
References: <D5C9032B2B09C64EA2409D6214E91AC905125E@asimail2.alphanumeric.com>
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



> > Well, it's seams to be a little bit more complicated than
> > I thought to loadbalance Internat connection between 2 (different) ISP
> > lines ...
> >
> > Here is my problem:
> >
> > Basically, I need to connect my office to 2 differents ISP (different
> > gateways and different DNS ). My linux box is a 3 NICs Box. The problem
> > is that, for the first ISP, I don't have static Addresses.
> >
> > So, I would like to loadbalance, "route" and NAT all my internals
Addresses
> > through thoses 2 ISP except for some addresses and some port numbers
> > which will use
> > only the ISP2.
>
> have a look at:
> http://linux-ip.net/html/adv-multi-internet.html
>

I like this article because basically it brings out the issues of having
dual
internet connects. I work on it for a few months to realized these issues.
I do not have a theory paper to present, however, I have a different
IMPLEMENTATION of dual internet connections, it is mostly based on
netfilter capabilities ( rather than route-based ), it can handle all sorts
of
combinations :-

1. Static or non-static external IPs.
2. Select outbound based on services.
3. Select outbound based on aggregate bandwidth.
4. Inbound traffic via multiple connections.

And it fits into a diskette. :-) Check out the implementation at :-

   http://www.geocities.com/mctiew/ffw/dual.htm







