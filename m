From: "Joao Alberto M. dos Reis" <joao@afreis.com.br>
Subject: Re: choosing the output gateway
Date: Thu, 29 Jul 2004 19:50:34 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091141434.23223.31.camel@goku.afreis.com.br>
References: <1091140143.23217.29.camel@goku.afreis.com.br>
	 <200407292339.26158.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-4NIlAQ+n1GdcZj7eLrr9"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407292339.26158.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--=-4NIlAQ+n1GdcZj7eLrr9
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

yep
On Thu, 2004-07-29 at 19:39, Antony Stone wrote:
> On Thursday 29 July 2004 11:29 pm, Joao Alberto M. dos Reis wrote:
>=20
> > Hi,
> >
> > I have the following:
> > 1 linux box with 2 valid IPs with different gateways each.
> >
> > I need to port forward different ports inside my network to different
> > machines.
> >
> > I have set a default gateway to the first link and created a routing
> > table for the second link pointing to the second gateway. but when I
> > make my portforward to this second link, the packets try to leave by th=
e
> > first gateway.
> >
> > How can I fix that?
>=20
> Did you use iproute2 rules for this?
>=20
> http://lartc.org
>=20
> Regards,
>=20
> Antony.

--=-4NIlAQ+n1GdcZj7eLrr9
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBBCX86cfDZuH0KEiERAn5mAJ9rc0mbHT2iGYntkQXDWIS7tQEYVgCgpFCw
CIoiGzIWfr3gEIZa6rHaLLM=
=gFO5
-----END PGP SIGNATURE-----

--=-4NIlAQ+n1GdcZj7eLrr9--


