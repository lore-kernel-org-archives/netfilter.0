From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: Qos using htb and transparent squid proxy
Date: 29 Jan 2003 12:26:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043835971.4709.19.camel@rayw.knowledgefactory.co.za>
References: <FD8F124A387AD6119F7900A0D218B321685F37@hslex01.hslbz.local>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-M5gbRN1iCUcN6fnOrzA6"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B321685F37@hslex01.hslbz.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>


--=-M5gbRN1iCUcN6fnOrzA6
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-01-29 at 12:02, Rob Sterenborg wrote:
> > ip basis while going through the transparent proxy. I think=20
> > the proxy is doing all the downloading (as it should be) and=20
> > therefore does not obey the bandwidth limits imposed on the=20
> > requesting user.
>=20
> But in squid you should be able to throttle the bandwidth when you use
> delay pools.

Thanks for all the help so far Rob. Yes, delay pools can be used to some
extent, but I need to throttle according to the source ip before it gets
SNATed, i.e the internal IPs. I need squid to download at the rate that
the client is allowed.

Ray

--=-M5gbRN1iCUcN6fnOrzA6
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+N6xDh1fuR/Bv+ygRAs25AJ93h3ieymb2iCMYia1gbkJVuVA76QCeMjjf
giF+lDT1vPJgdffxUBcviX4=
=V5Mz
-----END PGP SIGNATURE-----

--=-M5gbRN1iCUcN6fnOrzA6--


