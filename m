From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Best Practices for iptables
Date: Fri, 05 Dec 2003 16:11:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070633501.10348.10.camel@raylinux.internal>
References: <BAY10-F59WC6BgBxfpG0000cde9@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-9FIlWxCBiC1JsSitSUA5"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY10-F59WC6BgBxfpG0000cde9@hotmail.com>
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


--=-9FIlWxCBiC1JsSitSUA5
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-12-05 at 16:01, Gabby James wrote:
> Hi,
>=20
> I want to allow everything on eth1 and be selective on eth0.  What is the=
=20
> best way of handling unwanted packets?
>=20
> A) Change the policy of the chain to DROP then allow what I want.  Exampl=
e:
> iptables -P INPUT DROP
> iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
>=20
>=20
> B) or leave the policy of the INPUT chain to ACCEPT but put REJECT rules =
at=20
> the end. Example:
> iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
> iptables -A INPUT -p tcp -m tcp -j REJECT
> iptables -A INPUT -p udp -m udp -j REJECT
> iptables -A INPUT -p icmp -j DROP
>=20
> This will give me the same outcome won't it?
No, none of your rules reference the interface, e.g -i eth0
So your rules allow/reject on all interfaces.

>=20
> Thanks in advance!
>=20
> _________________________________________________________________
> Winterize your home with tips from MSN House & Home.=20
> http://special.msn.com/home/warmhome.armx
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-9FIlWxCBiC1JsSitSUA5
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/0JIdh1fuR/Bv+ygRAowRAJ9jUWPP5qNnrj10GrjyzmWCTzr61ACeO+rs
+j7iOhSujv9ZykuBqsdcc+0=
=jD9c
-----END PGP SIGNATURE-----

--=-9FIlWxCBiC1JsSitSUA5--


