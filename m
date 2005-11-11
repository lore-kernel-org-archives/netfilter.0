From: Alexander Samad <alex@samad.com.au>
Subject: Re: SNAT vs MASQUERADE
Date: Fri, 11 Nov 2005 19:08:49 +1100
Message-ID: <20051111080848.GC9770@samad.com.au>
References: <200511090951.31228.rob0@gmx.co.uk>
	<NEBBLLCNFOFHMALJMDDEGEDPBFAB.pablo@blueoakdb.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f0KYrhQ4vYSV2aJu"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <NEBBLLCNFOFHMALJMDDEGEDPBFAB.pablo@blueoakdb.com>
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
To: Pablo Sanchez <pablo@blueoakdb.com>
Cc: netfilter@lists.netfilter.org


--f0KYrhQ4vYSV2aJu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2005 at 10:05:24PM -0500, Pablo Sanchez wrote:
>=20
>=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org
> > [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of /dev/rob0
> > Sent: Wednesday, November 09, 2005 10:52 AM
> > To: netfilter@lists.netfilter.org
> > Subject: Re: SNAT vs MASQUERADE ... RE: ftp conntrack - nat problem
> >=20
> >=20
> > On Wednesday 2005-November-09 09:23, Pablo Sanchez wrote:
> > > When you say the SNAT target is better.  Can you quantify 'better?'=
=20
> > > Are there any functional limitations overcome by SNAT over the
> > > MASQUERADE target?
> >=20
> > Ooooh, I was afraid someone might ask that. Unfortunately I am only=20
> > parroting the party line.
>=20
> Hi,
>=20
> I discovered a case where SNAT'ing is necessary over the MASQUERADE targe=
t. =20
>=20
> I have an environment where I'm peering and I send traffic via one IP (wh=
en my primary ISP is down and they're providing backup) and they send me tr=
affic via another IP (when they're down and I'm providing backup).  The IP'=
s are associated with one interface so I assign one IP to the NIC's if-cfg =
file and I IP alias the second IP.
>=20
> Pictorially, here's what I have:
>=20
>            DSL               DSL
>             |                 |
>        [ router A ]<---->[ router B ]
>         172.16.1.x         10.1.1.x
>=20
> When [A] is failed over to [B], [A]'s routing table looks like so:
>=20
> Destination     Gateway         Genmask         Flags Metric Ref    Use I=
face
> 10.1.1.101      0.0.0.0         255.255.255.255 UH    0      0        0 e=
th2 <-- IP alias
> 172.16.1.128    0.0.0.0         255.255.255.252 U     0      0        0 e=
th2 <-- ifcfg'd
> 172.32.1.0      0.0.0.0         255.255.255.248 U     0      0        0 e=
th1
> 172.16.1.0      0.0.0.0         255.255.255.128 U     0      0        0 e=
th0
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
> 0.0.0.0         10.1.1.101      0.0.0.0         UG    0      0        0 e=
th2
>=20
> On [A], here are how the IP's are assigned to 'eth2':
>=20
> ip addr show dev eth2
> 4: eth2: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc tbf qlen 3
>     link/ether 00:09:5b:1a:82:72 brd ff:ff:ff:ff:ff:ff
>     inet 172.16.1.129/30 brd 172.16.1.131 scope global eth2
>     inet 10.1.1.105/32 scope global eth2
>     inet6 fe80::209:5bff:fe1a:8272/64 scope link=20
>        valid_lft forever preferred_lft forever
>=20
> What I have found is when I use the MASQUERADE target, [B] sees the traff=
ic as if it came via IP 172.16.1.129.
>=20
> If I SNAT to 10.1.1.105, then the traffic comes to [B] looks like it's co=
ming from 10.1.1.105
>=20
> I thought intuitively, since I had defaulted the gateway to 10.1.1.101, [=
B] would see the traffic originating from 10.1.1.105.
>=20
> Funky eh?  Perhaps I don't fully understand the underpinnings of the MASQ=
UERADE target however it seems it picks the IP based on the ifcfg value, no=
t the value of how traffic is being directed (via a default gateway).

There was a thread on this earlier, MASQ looks at the IP addresses early
in the route disission process and picks the first one that meets the
criteria.....  or something along those lines

>=20
> Cheers,
> ---
> Pablo Sanchez - Blueoak Database Engineering, Inc
> Ph:    819.459.1926          Toll free:  888.459.1926
> Cell:  819.664.9118                Pgr:  pablo_p@blueoakdb.com
> Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)
>=20
>=20
>=20

--f0KYrhQ4vYSV2aJu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFDdFGQkZz88chpJ2MRAkFJAJ9AQoVs9Qw+ziQWsfPl+P1CPSVz5gCfev5L
zJHRbeEYgjLQ6/xsv03KBBA=
=LfRW
-----END PGP SIGNATURE-----

--f0KYrhQ4vYSV2aJu--

