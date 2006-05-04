From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Not NATed packets
Date: Fri, 05 May 2006 00:22:00 +0200
Message-ID: <445A7E88.406@plouf.fr.eu.org>
References: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>
	<e30e0b$284$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e30e0b$284$1@sea.gmane.org>
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
Cc: Petr Pisar <petr.pisar@atlas.cz>

Petr Pisar a =E9crit :
>=20
> and after doing this excercise I can't see any change on counters in=20
> POSTROUTING chain. Naturaly I can't see anything in the kernel log (as=20
> you can see, I log everything before MASQ and after that).
>=20
> I seems, these magic packets are completly bypassing POSTROUTING chain.
>=20
> I found out too that TCP traffic goes inside this chain only with first=
=20
> SYN packet. After that there the packets are I don't see them anymore.=20
> Is it normal?
>=20
> So, I have one workaround. These magic packets are INVALID from point o=
f=20
> state module's view.

Connection tracking state is the key to explain all that you observed.
Only NEW packets can create an entry in the connection tracking table=20
(which contents can been seen through /proc/net/ip_conntrack) and can go=20
through the 'nat' chains. That's why :
- INVALID packets bypass the nat chains, thus aren't NATed nor counted
- only the first NEW packet of a connection, which is usually a SYN in=20
TCP connections, goes through the nat chains. Duplicate SYN, although=20
NEW too, or subsequent packets belonging (ESTABLISHED) or related=20
(RELATED) to the same connection in either direction don't. However all=20
get automatically NATed according to the conntrack entry in a way=20
determined by how the first packet was NATed.

>=20
> I'm not sure if any INVALID packet can also be considered as a health=20
> packet. Can you see any false positivities?

Unlike malformed packets which the experimental "unclean" match tries to=20
detect, INVALID packets are not "unhealthy" in nature, they're just=20
unexpected. And yes, false positive can occur. With kernels older than=20
2.4.29, some locally-generated ICMP replies are wrongly considered=20
INVALID instead of RELATED.

