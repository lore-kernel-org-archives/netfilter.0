From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: netfilter meets iproute in distributed routers
Date: Tue, 10 Feb 2004 15:35:24 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679156@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Frank Gruellich <frank@home.manuelm.org>, netfilter@lists.netfilter.org

Quick and Dirty: SNAT the connection when it is leaving Box A. The
problem instantly goes away.

Frank Gruellich wrote:
> Hello,
>=20
> I am trying to do some weird routing.  This is my (simplified[1])
> setup:=20
>=20
>                     ,---.
>                     | S |
>                     `-+-'
>                       | .1.0/24
>       ,---. .3.0/24 ,-+-.
>  0/0--+ A +---------+ B +--0/0
>       `---'         `---'
>=20
> Well, we moved to the new IPv2 last year... just kiddin, all nets are
> subnets of 192.168.0.0/16.  Box A and B masq the internal nets to
> their IP# given from the (different) ISPs.  S has .1.1 and runs
> several services reachable via B and, by default, uses B as its
> gateway to 0/0.   =20
>=20
> Sometimes somebody connects to box A on a specific port $P, which I
> DNAT to S.  (Every connect to box B to this port will be refused.)=20
> The problem arises, when I try to catch the answer to route it to A.=20
> I thought about using -j MARK of -t mangle and a special routing
> table (as described in the LARTC, chapter 11).   =20
>=20
> Okay, let's say I would use
>=20
>  # iptables -t mangle -A PREROUTING -p tcp -s 192.168.1.1 \
>  > --sport $P --dport 1024:65535 -m state --state RELATED,ESTABLISHED
> \  > -j MARK --set-mark 1=20
>=20
> on box B.  Replys to the connect will match, get the mark and will be
> routed the right way to box A.  Now let's assume, S itself opens a
> connection to the net.  It happens it uses $P as local port[2].  The
> first packet would be -m state --state NEW and will not match the
> above rule.  But any further will and will be routed a completely
> different way[3].  If I omit the -m state every connections opened by
> S from $P will be marked and routed via B (that would be acceptable,
> but is somehow ugly).      =20
>=20
> Cool thing would be, if a packet is matched by the rule any
> subsequent packets would match, too.  The -j DNAT works this way,
> AFAIK, but I found nothing next to the -j MARK in the docs[4].  Then,
> similar to the shown rule, I could accept all new connections and
> mark any remaining. More cool thing would be, if I could use the
> conntrack of box A in a rule on box B... well lets stay realistic.  =20
>=20
> Any hints, how I could do the trick?
>=20
> Thanks in advance and sorry for my poor english,
>  regards, Frank.
> =3D=3D=3Dfootnotes=3D=3D=3D
> [1] The whole setup can be found at
> <URL:http://manuelm.clug.de/~frank/network/topologie.png> (48KB).=20
> Box A is loki + hydra, box B is morpheus. [2] Is this possible when a
> service runs at this port? [3] Would this work? [4]
>
<URL:http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TABLE
.MARKMATCH>

