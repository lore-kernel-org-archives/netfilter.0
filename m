From: george <gk@t-t-l.co.uk>
Subject: Re: Filtering in PREROUTING
Date: Fri, 19 Jan 2007 13:17:40 +0000
Message-ID: <1169212660.16267.1.camel@len.t-t-l.co.uk>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
	<45AFC82B.6030505@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45AFC82B.6030505@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thu, 2007-01-18 at 20:19 +0100, Pascal Hambourg wrote:
> Hello,
>=20
> george a =C3=A9crit :
> > I've seen a few places telling me that you shouldn't filter in the
> > mangle table.  However, it seems sensible to me to drop junk packets =
in
> > PREROUTING rather than have to duplicate those rules in both INPUT an=
d
> > FORWARD.
> >=20
> > Having done this, I'm seeing packets dropped as invalid when I would
> > expect them to be OK (but most traffic is behaving as expected).  Bef=
ore
> > I start digging into this I want to check if filtering in the mangle
> > table really is stupid.
>=20
> My thoughts about filtering in PREROUTING/mangle.
>=20
> Note :
> Most of the following also applies to filtering in mangle/OUTPUT,=20
> replacing PREROUTING, INPUT and FORWARD with OUTPUT.
>=20
> * Disadvantages :
>=20
> - The 'mangle' table was not designed for filtering. The REJECT target=20
> only exists only in the 'filter' table, so it cannot be used in other=20
> tables to do filtering. You can only use DROP.

I only want DROP :)  The 3 classes of packets I want to drop are:
- broadcasts, mostly from Windows boxes which include Grant's netbeui
example.  These are most frequent and were the trigger for doing this.
- spoofed source address (I don't know if I really need these with
rp-filter enabled, in particular to catch private addresses if they
manage to get in from the Internet.  I may be being too paranoid here)
- some connection-oriented tests on NEW and INVALID (which is where I
started this thread from as I'm seeing packets dropped by the INVALID
check which I wouldn't expect and I wanted to find out if this could be
simply because I had the check in the wrong table)

>=20
> - As pointed out by Grant, in the case of forwarded packets the=20
> PREROUTING chains ignore the output interface. So any filtering rule=20
> relying on the output interface cannot be put in PREROUTING.

Not relevant to me
>=20
> * Advantages (true or supposed) :
>=20
> - Avoid duplicating rules in filter/INPUT and filter/FORWARD.
> Wrong : as pointed out by Grant, you can put the common rules in=20
> user-defined chains called from both INPUT and FORWARD.

I realise this.
>=20
> - Drop "junk" packets (malformed, INVALID state, invalid source or=20
> destination...) as soon as possible and save the CPU overhead in=20
> nat/PREROUTING and the routing decision. It may also save memory space=20
> in the routing cache.

That was my thinking.

> However, packets in the INVALID state already skip the 'nat' table, and=
=20
> the routing code can drop some packets with invalid source or=20
> destination on its own (e.g. rp_filter).
>=20
> - As Grant and Alexandru pointed out, you can go furthur and drop "junk=
"=20
> packets in the 'raw' table and save the connection tracking CPU overhea=
d.

Can't remember if I had a reason not to do this or if I just didn't
realise.  Following my continuing education though I now know that I
couldn't filter on state in raw so I'd like to think that I found that
out before ;)
>=20
> Alexandru wrote :
> > If you use conntrack, it is even best to do the filtering in raw tabl=
e
> > in PREROUTING, this way your conntrack table is saved from being fill=
ed.
>=20
> I do not agree : filtering in the 'raw' table would have no effect on=20
> the size of the connection tracking table because these packets would b=
e=20
> dropped later anyway and the connection tracking entry cleared. It woul=
d=20
> just save some CPU. However, I agree with Grant : you can save the=20
> conntrack CPU overhead by using the NOTRACK target in the 'raw' table,=20
> which it was designed for. If an attacker wants to fill the conntrack=20
> table, he'd better use "regular" packets.
>=20
> - When there is a DNAT rule in nat/PREROUTING redirecting packets from =
a=20
> publicly visible address to a private hidden address, you may wish to=20
> prevent direct access to the private address and drop such packets in=20
> the 'mangle' table before they reach nat/PREROUTING.
> Wrong : You can achieve the same result by just marking packets in the=20
> mangle table and filtering them later in the 'filter' table based on th=
e=20
> mark. And anyway, is it important to drop such packets, how is it a=20
> security issue ?
>=20
> My conclusion :
> Early filtering in the 'raw' or 'mangle' table may save some CPU used=20
> for the routing decision and the 'nat' table.
> It may also save some memory space in the routing cache.
> It does not save memory space in the connection tracking table.
> It is not needed to save CPU for the connection tracking, use NOTRACK=20
> instead.
> It is not needed to avoid rule duplication, use user-defined chains ins=
tead.
> It does not add security, except when there would be vulnerabilities in=
=20
> the routing or connection tracking code.

These all look good to me.  I haven't needed NOTRACK before so I'd have
to get that bit straight in my head if I were to go that way.

I'm still not sure that I'm doing anything wrong, just unconventional.
From what I've been told via this list I'm thinking that it would be
sensible to move my broadcast dropping to raw, state checks to filter
and I don't know if I even need the spoofing checks, but if I do I
suspect raw is the place for them.

I am still slightly nervous that by going against the designers'
intentions I might end up with something breaking.  I would hope that
anything dangerous wouldn't be allowed but "of course I didn't check for
that - nobody would do that would they" is a classic reaon for software
flaws :)



