From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall structure and more (Newbie)
Date: Thu, 8 Jul 2004 19:16:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081916.34953.Antony@Soft-Solutions.co.uk>
References: <20040708171016.GA16115@itstud.chalmers.se> <200407081828.49545.Antony@Soft-Solutions.co.uk> <20040708180732.GA16355@itstud.chalmers.se>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040708180732.GA16355@itstud.chalmers.se>
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

On Thursday 08 July 2004 7:07 pm, Erik Wikstr=F6m wrote:

> On Thu, Jul 08, 2004 at 06:28:49PM +0100, Antony Stone wrote:
> > On Thursday 08 July 2004 6:10 pm, Erik Wikstr=F6m wrote:
> >
> > I would turn the question around to you: why do you think it is bette=
r to
> > have the rules arranged into different chains as you have suggested? =
  Do
> > you think that is easier to understand?   (If you *do* find it easier=
 to
> > understand, then go ahead and do it, don't do what *I* find easy to w=
ork
> > with.)
>
> My thought was that by sorting the packets by type at first and then
> make a more througout filtering I would avoid the overhead of having,
> for example, a UDP packet go through a lot of rules concerning TCP-
> packets. But, as you say it leads to a quite complicated structure, but
> since the firewall is quite old (75MHz) and a lot of P2P traffic is
> passing through I thought that it might have some value.

Well, a good policy is to have the rules which match the most packets at =
the=20
top of the ruleset (so that most packets pass through a small number of r=
ules=20
before being matched).   This is why the stateful rule "-m state --state=20
ESTABLISHED,RELATED" is the very first rule in most people's rulesets.

A good way to find out what order to put the rules in is to guess, and th=
en=20
after some reasonable amount of traffic has passed through the firewall, =
use=20
"iptables -L -nvx" to see the packet / byte counters in the first two=20
columns.   Rearrange your rules so that the ones with the highest packet =
(not=20
byte) counts come first, and you have a pretty optimum design.

Regards,

Antony.

--=20
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


