From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: Re: broadcasts to other network?
Date: Thu, 23 Dec 2004 08:35:30 +0100
Message-ID: <41CA7542.99C24E57@knoware.nl>
References: <41C7F5C5.6023137F@knoware.nl> <41C87F59.8050606@hdr-roma.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

primero@hdr-roma.it schreef:

> Frans Luteijn wrote:
>
> >...
> >
> >But no packets went out, at least that I couldn't see after adding a
> >LOG-rule at OUTPUT and FORWARD.
> >
> >Is there an easy way to solve this or do I need a relaying-program (like
> >dhcp)?
> >
> >Greetings,
> >
> >
> >
> The easiest way, IMHO, is using an UDP-Relay ... i mean, what is more
> simple then a little daemon running smoothly ? ;)
>
> A better and not easy way would be bridging the interface to the
> internal lan with the interface to the router using the same network
> class. This way broadcasts would pass normally from one side of the
> firewall to the other one, you could as well filter traffic beetween the
> two interfaces.
>
> I would choose the latter ;)
> bye
> primeroz

I want to choose the former. I am offering  my ADSL to my house-mates
via a
wireless lan connected to my firewall with a fourth interface (not drawn
in
my first mail) and I don't want thost users on my private-net (it can be
filtered out, but why doing it the hard way?).
Does someone know a program, that can relay udp-broadcasts?

Greetings,
--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B
GPG PblKey fprnt=ED20 0F25 C233 DC59 3FFA  170E D0BF 15F5 0BA6 1355


