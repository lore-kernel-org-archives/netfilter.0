From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: martians from myself?
Date: 15 Sep 2002 13:11:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1032088288.28097.140.camel@tux>
References: <1031927325.15445.3.camel@rayw>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature";
	boundary="=-oAehexvdGkLEewpuRxdr"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031927325.15445.3.camel@rayw>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: netfilter@lists.samba.org


--=-oAehexvdGkLEewpuRxdr
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2002-09-13 at 16:28, Raymond Leach wrote:
> Hi
>=20
> Can someone tell me what would cause this:
>=20
> Sep 13 16:32:07 firefly kernel: martian source 108.122.0.0 from
> 127.0.0.23, on dev eth2
> Sep 13 16:32:07 firefly kernel: ll header:
> 00:01:02:50:b8:9e:08:00:20:a5:04:26:08:00
>=20
> The MAC address in the ll header is the interface on my firewall.
>=20
> Any help would be appreciated

so I assume 00:01:02:50:b8:9e is the macaddress of your interface?
(destination mac in the frame)

the packet is sent from 08:00:20:a5:04:26 with 127.0.0.23 as sourceip
(loopback ip), try to find out which machine on your network that is.


--=20
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

--=-oAehexvdGkLEewpuRxdr
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA9hGrgWm2vlfa207ERAsWPAJ92nqtwIS2s6aVz/2WRV5Ws9vt1vwCgvPri
zAvL1nqYPyKCuY1tOt3VzAY=
=/1kE
-----END PGP SIGNATURE-----

--=-oAehexvdGkLEewpuRxdr--

