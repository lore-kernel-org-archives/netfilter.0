From: Eric Leblond <eric@inl.fr>
Subject: Re: Pb update iptables NAT
Date: Tue, 25 Oct 2005 17:05:53 +0200
Message-ID: <1130252753.4872.39.camel@localhost.localdomain>
References: <BAF83494CE653943A97B9F755016A06601EDFC92@ftrdmel1.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-pkf+ivRJGyabq8TfYNxo"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAF83494CE653943A97B9F755016A06601EDFC92@ftrdmel1.rd.francetelecom.fr>
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
To: LE BER Erwan RD-CORE-LAN <erwan.leber@francetelecom.com>
Cc: netfilter@lists.netfilter.org


--=-pkf+ivRJGyabq8TfYNxo
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable

Le lundi 24 octobre 2005 =E0 16:58 +0200, LE BER Erwan RD-CORE-LAN a
=E9crit :
> Hello,
>=20
> I'm using iptables on an embeded linux plateform. I applie a first
> PREROUTING DNAT rule , it's OK.=20
> But Now I need to update the rule to rout this packet to another
> terminal. I have flushed my iptables rules and create an another but the
> packets always go to the first terminal.
> Can you help me on updating a iptables rules without stoping the packets
> flow.

In fact, this is not possible without kernel interaction.
NAT chains is only hit at first packet, the connection tracking then
stores the translation done and keep it for all the connection.

Maybe you could have a look at the connmark tool that will be available
with 2.6.14. It seems to be able to update conntrack entry, that could
be a nice workaround.

Cordialement,
--=20
=C9ric Leblond, eleblond@inl.fr
T=E9l=E9phone : 01 44 89 46 40, Fax : 01 44 89 45 01
INL, http://www.inl.fr

--=-pkf+ivRJGyabq8TfYNxo
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDXknRnxA7CdMWjzIRAk84AJ4jxbYcBOZUMFRgKyFDa800vV1CigCgjY1g
RgFKwiD7uCtjdWrERArhxMg=
=+r0t
-----END PGP SIGNATURE-----

--=-pkf+ivRJGyabq8TfYNxo--


