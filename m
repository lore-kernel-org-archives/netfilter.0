From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Packet chain traversals
Date: Fri, 1 Nov 2002 17:48:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211011748.50720.netfilter@newkirk.us>
References: <Pine.LNX.4.43.0210301001370.15387-100000@netmonster.pakint.net> <200210301722.g9UHMEe12082@vulcan.rissington.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210301722.g9UHMEe12082@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org

On Wednesday 30 October 2002 12:22 pm, Antony Stone wrote:
> On Wednesday 30 October 2002 4:11 pm, Matthew G. Marsh wrote:
> > > The only thing I can think of is "which interface should this packe=
t go
> > > out of", however that's certainly not the same sort of "decision" a=
s
> > > there is between PREROUTING and INPUT or FORWARD, and I'm not even =
sure
> > > it belongs quite where it is shown...
> >
> > It does exist between OUTPUT and NAT. But the decision structure is m=
ore
> > along the lines of rule application. Thus you can issue rules such as=
:

> The only decisions of interest to netfilter are "is the packet local ?"=
 and
> if not "which interface is it going out of ?".   Both of those have alr=
eady
> been decided in the first routing decision, between prerouting and inpu=
t /
> forward.
>
> I'm not convinced there's any purpose in having another routing decisio=
n
> shown between output and postrouting, especially in a document which is
> aimed at beginners.

I'm planning to rebuild the diagram this weekend, in several forms from=20
simplest (in/out/forward/local) to mid (in/out/forward/natpre/natpost/loc=
al)=20
to full.  I've not yet decided if I'm going to have 'routing decision' in=
 the=20
diagram at all, since it seems that the only concrete placement of it is=20
after prerouting, and the existence of multiple parts in the next layer=20
inward (forward and input) makes the existance of SOME decision pretty=20
apparent.  I may just wait until I have a better grasp of the interaction=
 of=20
Netfilter and Iproute2 and see where my understanding leads me for a poss=
ible=20
generation 2 diagram.  :^)

Is there some way that I can expand on Oscar's packet tracking rules to a=
lso=20
track when the packet hits routing?  I was wondering whether I could set =
a=20
TOS in prerouting and output for testing purposes, and track incidents of=
=20
that TOS in routing.

j

