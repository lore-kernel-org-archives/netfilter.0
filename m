From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Filtering in PREROUTING
Date: Thu, 18 Jan 2007 20:19:07 +0100
Message-ID: <45AFC82B.6030505@plouf.fr.eu.org>
References: <1169069905.10134.18.camel@len.t-t-l.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169069905.10134.18.camel@len.t-t-l.co.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

george a =E9crit :
> I've seen a few places telling me that you shouldn't filter in the
> mangle table.  However, it seems sensible to me to drop junk packets in
> PREROUTING rather than have to duplicate those rules in both INPUT and
> FORWARD.
>=20
> Having done this, I'm seeing packets dropped as invalid when I would
> expect them to be OK (but most traffic is behaving as expected).  Befor=
e
> I start digging into this I want to check if filtering in the mangle
> table really is stupid.

My thoughts about filtering in PREROUTING/mangle.

Note :
Most of the following also applies to filtering in mangle/OUTPUT,=20
replacing PREROUTING, INPUT and FORWARD with OUTPUT.

* Disadvantages :

- The 'mangle' table was not designed for filtering. The REJECT target=20
only exists only in the 'filter' table, so it cannot be used in other=20
tables to do filtering. You can only use DROP.

- As pointed out by Grant, in the case of forwarded packets the=20
PREROUTING chains ignore the output interface. So any filtering rule=20
relying on the output interface cannot be put in PREROUTING.

* Advantages (true or supposed) :

- Avoid duplicating rules in filter/INPUT and filter/FORWARD.
Wrong : as pointed out by Grant, you can put the common rules in=20
user-defined chains called from both INPUT and FORWARD.

- Drop "junk" packets (malformed, INVALID state, invalid source or=20
destination...) as soon as possible and save the CPU overhead in=20
nat/PREROUTING and the routing decision. It may also save memory space=20
in the routing cache.
However, packets in the INVALID state already skip the 'nat' table, and=20
the routing code can drop some packets with invalid source or=20
destination on its own (e.g. rp_filter).

- As Grant and Alexandru pointed out, you can go furthur and drop "junk"=20
packets in the 'raw' table and save the connection tracking CPU overhead.

Alexandru wrote :
> If you use conntrack, it is even best to do the filtering in raw table
> in PREROUTING, this way your conntrack table is saved from being filled=
.

I do not agree : filtering in the 'raw' table would have no effect on=20
the size of the connection tracking table because these packets would be=20
dropped later anyway and the connection tracking entry cleared. It would=20
just save some CPU. However, I agree with Grant : you can save the=20
conntrack CPU overhead by using the NOTRACK target in the 'raw' table,=20
which it was designed for. If an attacker wants to fill the conntrack=20
table, he'd better use "regular" packets.

- When there is a DNAT rule in nat/PREROUTING redirecting packets from a=20
publicly visible address to a private hidden address, you may wish to=20
prevent direct access to the private address and drop such packets in=20
the 'mangle' table before they reach nat/PREROUTING.
Wrong : You can achieve the same result by just marking packets in the=20
mangle table and filtering them later in the 'filter' table based on the=20
mark. And anyway, is it important to drop such packets, how is it a=20
security issue ?

My conclusion :
Early filtering in the 'raw' or 'mangle' table may save some CPU used=20
for the routing decision and the 'nat' table.
It may also save some memory space in the routing cache.
It does not save memory space in the connection tracking table.
It is not needed to save CPU for the connection tracking, use NOTRACK=20
instead.
It is not needed to avoid rule duplication, use user-defined chains inste=
ad.
It does not add security, except when there would be vulnerabilities in=20
the routing or connection tracking code.

