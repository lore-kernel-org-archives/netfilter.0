From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: how to filter applications with iptables
Date: 26 Jun 2003 09:21:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056612072.1474.10.camel@raylinux.internal>
References: <20030626070125.065CEC11A@postfix4-2.free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-qSkqduTl0vee+Zymf1TE"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030626070125.065CEC11A@postfix4-2.free.fr>
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


--=-qSkqduTl0vee+Zymf1TE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

There are verious ways to 'block' packets from unwanted apps. Some use
netfilter some don't.

You can block mime types using a squid proxy.
You can block arbitrary strings in packets using the string match
support in the P-O-M for netfilter, e.g. -m string --string 'KAZAA'
Most applications use specific ports and protocols, so you could find a
combination of those and block the app that way, e.g. MSN messenger uses
TCP port 1863
Some apps need to contact a central server, so blocking that server will
effectively disable the app, e.g. Yahoo messenger.=20

Regards

Ray

On Thu, 2003-06-26 at 10:03, Liber Chr=E9tien wrote:
> Hello,
> I've been looking for some information but couldn't find, so here it goes=
, I'm asking=20
> to the list : (excuse my technical english if I'm not clear enough)
>=20
> I've a LAN at home with mdk as server and win and mdk on the clients
>=20
> My question is : is there a way to block certain applications, such as sp=
ecific=20
> softwares (office suite for example), to access internet with iptables?
>  How to identify the packets emitted from such applications and block the=
m ?
>=20
> Thanks=20
>=20
> Bruno
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-qSkqduTl0vee+Zymf1TE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA++p7oh1fuR/Bv+ygRAo+kAKCOVFxoANFAb3g4XyNJzrZwK+LeNQCeM67r
ykRZPqIBok9jd2y7xAwA2Gg=
=zL5A
-----END PGP SIGNATURE-----

--=-qSkqduTl0vee+Zymf1TE--


