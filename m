From: Alexander Samad <alex@samad.com.au>
Subject: Re: Redirecting outgoing SMTP from LAN to another LAN server
Date: Thu, 29 Apr 2004 23:37:57 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040429133757.GK7147@samad.com.au>
References: <20040429095949.GB22172@acentral.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DozTQjXnjm3C9Xhk"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040429095949.GB22172@acentral.co.uk>
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


--DozTQjXnjm3C9Xhk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2004 at 10:59:49AM +0100, Gavin Hamill wrote:
> Hullo :)
>=20
> I'd like to do $SUBJECT, but after much playing with commands like
>=20
> iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 25 -j DNAT --to 10.0=
=2E0.253:25

what about=20

iptables -t nat -A PREROUTING -p tcp -i eth1 -s ! 10.0.0.253  --dport 25 -j=
 DNAT --to 10.0.0.253:25

I presume 10.0.0.253 is also on eth1.

>=20
> I have given up and have come to you fine people for help...
>=20
> My LAN is on eth1, with WAN on eth0. The gateway machine is 10.0.0.254 do=
ing masq for=20
> LAN clients, but I'd like to send any outgoing SMTP connections to 10.0.0=
=2E253 - alas=20
> any time I've tried, I just end up killing ALL outgoing SMTP :(
>=20
> Any suggestions warmly received!
>=20
> Cheers,
> Gavin.
>=20
>=20

--DozTQjXnjm3C9Xhk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAkQU1kZz88chpJ2MRAuRCAJ0YVnku67TaPkQYHllKRxBMCttC+ACdE6YQ
7lddjn3dOpgZqi8q2aBLr24=
=R9d7
-----END PGP SIGNATURE-----

--DozTQjXnjm3C9Xhk--

