From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Packet chain traversals
Date: Sun, 27 Oct 2002 14:21:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210271421.51119.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0210271942340.12007-100000@laptop1.agatha>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210271942340.12007-100000@laptop1.agatha>
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
To: Oskar Andreasson <blueflux@koffein.net>
Cc: netfilter@lists.netfilter.org

On Sunday 27 October 2002 01:50 pm, Oskar Andreasson wrote:
> Hi Joel,
>
> On Sun, 27 Oct 2002, Joel Newkirk wrote:
> > I've been working on a chain traversal diagram (primarily for my own
> > reasons, but if anybody likes it they are welcome to use it
> > non-commercially) and have a few questions.
> >
> > First, the current form of the diagram is (temporarily) at
> > http://newkirk.no-ip.org:83/Traversal-sm.png
>
> Mmmmm, reminds me of that trip on LSD I took the other day.... =3D) jus=
t
> kidding.=20

mmm.  about the resemblance, or the other day?  :^) (just kidding too :^)

> It does look good really, except you made it rather confusing in
> one aspect... I don't know if it's just me, but why do you have two "ou=
t"
> and two "in"?

Two reasons mostly:  That seems to reflect a common arrangement, where th=
ere=20
is a single connection to the internet and a single connection to local=20
network(s).  (feel free to label the top one 'ppp0' and the bottom 'eth1'=
) =20
It also allows the diagram to more clearly illustrate (to me at least) th=
e=20
situation where a packet can be sent back out the same interface it arriv=
ed=20
from, such as a local DNAT redirection to another local IP.  Also, one or=
=20
three (or more) would ruin the pretty symmetry...

In my mind, I always think of the local machine (local processes) as bein=
g=20
'inside' the firewall, with the individual interfaces being separated by =
it,=20
or the LAN being 'behind' it.  I can't think of a useful, non-degenerate=20
example where this isn't a valid perspective, so I've held to it so far.

> > and the basic rule is that a packet cannot cross a black line.  The
> > choices of colors are meaningless, except to differentiate chains.

> > Also, I wanted to ask for clarification on a point in the latest
> > iptables-tutorial "Traversing of tables and chains" section:  At one
> > point it seems that packets pass through mangle-forward THEN
> > filter-forward, (diagram) yet elsewhere it seems to be the reverse.
> > (table 1)  Which is correct?
>
> I just fixed this today actually. If you want to make absolutely certai=
n,
> run the script attached to the tutorial (I added an updated version to
> this mail since the one in the released tutorial doesn't contain the
> mangle5hooks.patch fixes), tail -f the proper logfile
> and then send ping's from different locations and directions (e.g., pin=
g
> across the firewall, ping to the firewall and ping from the firewall).
> That way you will be able to make sure how it works.

Thanks.
> > Thanks for any input, examples, diagram criticism (artistic or logica=
l)
> > etc. If your response seems to you to be useless to the list in gener=
al
> > then please just send it to me directly.
>
> no problem. Don't take me too seriously though, I am a lousy "artist"
> so... :)

I may be as well, but I've tired of always referring to a visualization t=
hat=20
suited my perspective, and decided to try to make a printed version.  (BT=
W,=20
my actual intention is to tweak then fade the colors out about 70% before=
=20
printing a 'keeper', otherwise I'll have to cover it late in the evening.=
=2E.=20
:^)

j

