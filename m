From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Internet Servers behind firewall (passthrough)
Date: Wed, 11 Feb 2004 07:58:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076479135.2747.44.camel@raylinux.internal>
References: <E1AqjCT-0004ja-FZ@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zhy75ygZj6i2pjZ4kNvG"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AqjCT-0004ja-FZ@vishnu.netfilter.org>
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


--=-zhy75ygZj6i2pjZ4kNvG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-02-11 at 03:29, Yuta Kawamoto wrote:
> Hi, I am not a very netfilter savvy person. (beginner)
> My problem is this:
>=20
> I have 10 public(internet) IP addresses, each for a server.
> These servers run a variety of OS-es, from RedHat Linux to MaxOSX
> the only path for them to the internet, is a single network cable(a "red"
> colored wire).
> Right now, I have a RedHat Linux 9 machine connected to this red wire.
> I have installed IPTABLES, but do not really know how to configure rules.
>=20
> I would like this Linux "routing machine" to take all traffic to the 10
> internet IP's
> and pass them straight on to the servers connected on the other side of t=
his
> machine.
>=20
You need to investigate DNAT.

>=20
> Internet(red wire) -> [eth0]Linux Routing PC[eth1] -> Switch/Hub -> 10
> servers
>=20
> I would need all ports on each of the machines,
> as they would be serving all forms of traffic.
>=20
> I have asked some friends who know more about Linux than I do, to no avai=
l.
> I would really appreciate any and all help in this matter.
>=20
> Yuta Kawamoto
>=20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-zhy75ygZj6i2pjZ4kNvG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAKcSfh1fuR/Bv+ygRAhQPAKC7oTxYFDtv3urqk1pLMs+Yj5nU/wCeM07l
a7Hau0dJahGZF0Vr3zIACbQ=
=tr8s
-----END PGP SIGNATURE-----

--=-zhy75ygZj6i2pjZ4kNvG--


