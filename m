From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: passive mode ftp
Date: 23 May 2003 12:04:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053684294.1787.6.camel@raylinux.internal>
References: <3ECDE243.3133BBAA@nerim.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qrMu2zamOOt81SHeGgLB"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3ECDE243.3133BBAA@nerim.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-qrMu2zamOOt81SHeGgLB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-05-23 at 10:56, Eric Constantineau wrote:
> Hi !
>=20
> I want to be able to use passive ftp under my firewall...
>=20
> Right now passive mode does not function because I allow only packets
> WITH port 21 as a destination OR source.  When in normal mode, packets
> from the ftp server have 21 for the source port and the packets from the
> client have 21 for the destination port so it works.  But, entering
> passive mode, the destination and source ports are not 21, so my
> firewall blocks.
>=20
> Using a ftp client such as leechftp, cuteftp, wsftp is okay, but using
> the browser (iexplore) does not because it use passive mode.
>=20
> I don't want to open too much my ports, it would mean that someone could
> use those ports to get access to inside networks...  But I want to be
> able to use passive mode, some users do not want to use ftp client
> software, or are not even able to install them...
>=20
> Is there a specific range of ports that all passive ftp use ?
No, passive mode uses random ports from 1024 upwards.

You could use a web proxy like squid. You can force squid to always use
active mode.

Alternatively, you could use the state inspection of iptables and the
ftp connection tracking module to configure passive ftp.

>=20
> Thanks for helping me
>=20
> Eric
>=20
>=20
>=20
>=20

--=-qrMu2zamOOt81SHeGgLB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD4DBQA+zfJGh1fuR/Bv+ygRAq6SAKCbD2ytGNL3WBZh4lpIVvc+wVgCygCVGDoj
V8f4+G0+X5VA7a3Um3fFQQ==
=KiKV
-----END PGP SIGNATURE-----

--=-qrMu2zamOOt81SHeGgLB--


