From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Packet chain traversals
Date: Mon, 28 Oct 2002 00:48:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210280048.01995.netfilter@newkirk.us>
References: <Pine.LNX.4.44.0210272214080.12317-100000@laptop1.agatha>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210272214080.12317-100000@laptop1.agatha>
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

On Sunday 27 October 2002 04:23 pm, Oskar Andreasson wrote:
> On Sun, 27 Oct 2002, Joel Newkirk wrote:
> > On Sunday 27 October 2002 01:50 pm, Oskar Andreasson wrote:

> > In my mind, I always think of the local machine (local processes) as
> > being 'inside' the firewall, with the individual interfaces being
> > separated by it, or the LAN being 'behind' it.  I can't think of a
> > useful, non-degenerate example where this isn't a valid perspective, =
so
> > I've held to it so far.
>
> Try a small backbone or so:).
>
=2E.. :^)

> Sounds as a nice idea. I could use one myself once in a while (lousy
> memory). I would really like seeing the mangle/nat/filter stuff added t=
o
> FORWARD/INPUT/OUTPUT though, and it would be even better:)

YWIMC.  (Anyone who tried to grab the pic this evening but couldn't I=20
apologize - I broke down and rebooted to run Photoshop for a few minutes =
for=20
curved text entry)  try http://newkirk.no-ip.org:83/Traversal-full.png (i=
t's=20
'full' sized at 2048x1600 and 'full' detail with all built-in chains list=
ed) =20
I'm probably going to give it a few days, then if I'm satisfied I'll rebu=
ild=20
it with cleaner text and spacing, and a few flow arrows.

BTW, I'm not happy already with one aspect, but can't see a resolution:  =
I=20
look at this and picture a packet at 'in', then mangle-pre nat-pre and=20
routing.  If it's forwarded then we have a quantum situation where it cou=
ld=20
'be' in either of the forward steps (semi-ovals?) and then to routing aga=
in=20
BEFORE it is really decided which 'out' it is heading for.  Now I know ho=
w it=20
really works, but when I look at this I expect the forwarding destination=
 to=20
already be determined before it hits Mangle Forward, just based on the=20
diagram construction, and it actually isn't.  Oh, well.  Unless someone c=
an=20
suggest an alternative, I'll likely leave it as is. (Yes Oscar, I realize=
d=20
that splitting it to any half would eliminate this artifact... Damn... :^=
)

j

