From: Unknown <unknown@unknown.invalid>
Subject: Re: transparent squid with internal sites as well
Date: 27 Nov 2002 09:00:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038380456.1451.65.camel@rayw.knowledgefactory.co.za>
References: <20021125121935.0adac911.bain@tcsn.co.za>
	 <1038221585.19172.151.camel@rayw.knowledgefactory.co.za>
	 <20021127085814.16b50de3.bain@tcsn.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Xlw5GyNpXYpWE5CjxVBX"
Return-path: <netfilter-admin@lists.netfilter.org>
From: Raymond Leach <Ray@work>
In-Reply-To: <20021127085814.16b50de3.bain@tcsn.co.za>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Henti Smith <bain@tcsn.co.za>
Cc: Raymond Leach <raymondl@knowledgefactory.co.za>, Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-Xlw5GyNpXYpWE5CjxVBX
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-11-27 at 08:58, Henti Smith wrote:
> On 25 Nov 2002 12:53:05 +0200
> Raymond Leach <Ray@work> wrote:
>=20
> > Hi
> >=20
> > One solution could be split horizon DNS? Is your firewall also a DNS
> > server?
>=20
> No it's not. the dns server is on the outside of the firewall.
> What does split horizon DNS do ?=20
>=20
Basically it resolves names to different ip addresses based on where the
request came from. For example it can be setup so that if a person on
the local lan makes a dns request for www.foo.bar.com it will give back
192.168.1.123 and if someone from outside requests www.foo.bar.com it
resolves to the public ip address , e.g. 196.4.160.123.

Ray

> Henti=20
--=20

--=-Xlw5GyNpXYpWE5CjxVBX
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA95G2oh1fuR/Bv+ygRAsW9AJ4gUbzYzhyIP0zR/lt93tub9dDxWACgrhCT
qtn1lHV+ieuqlcIP7U7L0/s=
=6Hcc
-----END PGP SIGNATURE-----

--=-Xlw5GyNpXYpWE5CjxVBX--


