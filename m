From: Eric Leblond <eric@regit.org>
Subject: Re: Modify packets using netfilter
Date: Sat, 13 Dec 2003 21:21:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071346885.1309.3.camel@porky>
References: <007101c3c190$0b3d6450$cb0210ac@jz105>
	 <200312131549.45158.Antony@Soft-Solutions.co.uk>
	 <007d01c3c198$873df440$cb0210ac@jz105>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-r8HdRIBG0U8/OXmX72yV"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007d01c3c198$873df440$cb0210ac@jz105>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org


--=-r8HdRIBG0U8/OXmX72yV
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le sam 13/12/2003 =C3=A0 17:45, Jee J.Z. a =C3=A9crit :
> Hi Antony and all,
>=20
> Thanks for your reply. What I am trying to do is to get the whole packets=
 including their payloads and store them into a self defined queue, and ran=
domly modify some bits in each packet.=20
> I am using iptables userspace programming. Does anybody have some good id=
ea how to achieve this? Thank you.

with libipq you can modify the payload of the packet :

Take from man page :
int ipq_set_verdict(const struct ipq_handle *h, ipq_id_t  id,  unsigned
       int verdict, size_t data_len, unsigned char *buf);

if data_len is not 0 and buf is not NULL, the header and payload of the
packet get replaced by the datas pointed by buf.

BR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-r8HdRIBG0U8/OXmX72yV
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/23TFnxA7CdMWjzIRAr71AJ9h7zrthjVdm/R5Vcb+xyjYrYcD3QCeL9zL
pL4dSWfpNY38t5Kc206s2uU=
=0tgz
-----END PGP SIGNATURE-----

--=-r8HdRIBG0U8/OXmX72yV--

