From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall structure and more (Newbie)
Date: Thu, 8 Jul 2004 18:28:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081828.49545.Antony@Soft-Solutions.co.uk>
References: <20040708171016.GA16115@itstud.chalmers.se>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040708171016.GA16115@itstud.chalmers.se>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thursday 08 July 2004 6:10 pm, Erik Wikstr=F6m wrote:

> But what I do lack is a guide on how to structure your firewall, what
> chains to create and what to put in them. So far the best structure I'v=
e
> come up with considers 3 (or 5) senarios. The first being packets arive
> from the net with the firewall as destination. Second being packets fro=
m
> the firewall, then you have to consider different rules depending on th=
e
> destination (LAN or not). And the third scenario, of course, is packets
> passing through on their way to or from the LAN, again different rules
> depending on destination.
>
> My idea is to create 3 chains for each scenario, one for tcp, one for
> udp and one for icmp. And maybe some more like one for port forwarding
> or so. But that's an awful lot of rules and some of them might contain
> only one or two rules
>
> Which leads to my questions: What do you think of this structure? What
> would you do?

I think this structure is more complex than needed, and the complexity wo=
n't=20
make it easier to understand.

What would I do?   I would put the rules for packets entering the firewal=
l=20
into the INPUT chain, I'd put the rules for packets leaving the firewall =
in=20
the OUTPUT chain, and I'd put rules for packets going through the firewal=
l=20
into the FORWARD chain :)

I know that may sound trite, but that is what I would do.   If one or mor=
e of=20
the chains then ended up looking overly-complicated, I would consider=20
breaking out some of the rules into user-defined chains, but I would base=
=20
those chains on the source or destination of the packets, not on whether =
they=20
were TCP, UDP, ICMP or something else.

I would turn the question around to you: why do you think it is better to=
 have=20
the rules arranged into different chains as you have suggested?   Do you=20
think that is easier to understand?   (If you *do* find it easier to=20
understand, then go ahead and do it, don't do what *I* find easy to work=20
with.)

> I'm also open to suggestions for things to block, and maybe suggestions
> on rules to do so, like ping of death and other known problems.

What to block?   Everything you don't know you want to allow.   That is=20
standard security practice - don't think about what to DROP in the firewa=
ll;=20
DROP everything (default policy) and then ACCEPT what you want (with the=20
rules).

Ping of death?   Well, why allow ping packets at all?   Why should anyone=
 out=20
on the Internet be able to ping your firewall or your internal machines? =
 =20
The same principle applies to many vulnerabilities - if a service isn't=20
needed, just block it completely.

Hope this helps,

Antony.

--=20
The difference between theory and practice is that in theory there is no=20
difference, whereas in practice there is.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


