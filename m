From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Netfilter and SCTP
Date: 30 Apr 2003 16:04:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051711484.1690.121.camel@raylinux.internal>
References: <Law8-F94rhYQYx3G5aY000150f0@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-rcXp5Tul1uIxCFf9/787"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law8-F94rhYQYx3G5aY000150f0@hotmail.com>
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


--=-rcXp5Tul1uIxCFf9/787
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Isn't SCTP just a sub-protocol of TCP/IP?

If it is then you can use rules like this:

iptables -A FORWARD -i eth0 -p 132 -s 1.2.3.4 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT


This is what I do for protocol 47 which is used by MS VPN connections.

Ray

On Wed, 2003-04-30 at 14:50, Cyrille Colin wrote:
> Hi,
>=20
> I would like to know how Netfilter's translator deals with SCTP / IP pack=
ets=20
> (Stream Control Transmission Protocol, IP protocol 132).
>=20
> similarly to UDP, it should be able to translate the source adress in the=
 IP=20
> header, and the source port in the SCTP common header, if needed. And=20
> recompute SCTP and IP headers checksums.
>=20
> is this currently supported ? if not how Netfilter behave when receiving=20
> such a packet ??
>=20
> any help on this would be very much appreciated... seems that NAT boxes d=
o=20
> not like SCTP very much...
>=20
>=20
> Thanks
>=20
> Cyrille
>=20
>=20
>=20
>=20
>=20
> _________________________________________________________________
> MSN Messenger : discutez en direct avec vos amis !=20
> http://www.msn.fr/msger/default.asp
>=20
>=20

--=-rcXp5Tul1uIxCFf9/787
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+r9f8h1fuR/Bv+ygRAhwdAJ40oe8ze8V8Gfi4ACTT+Cq1WZufEwCdGfuv
n8Dguke/fxRXoofIWuWjqEc=
=bgxG
-----END PGP SIGNATURE-----

--=-rcXp5Tul1uIxCFf9/787--


