From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Setting a default policy does not work :(
Date: Tue, 02 Dec 2003 17:53:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070380408.941.1.camel@raylinux.internal>
References: <20031202083315.212b9e05.mgale@utilitran.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-p4c2qoPsImzK+Z3yMPRO"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031202083315.212b9e05.mgale@utilitran.com>
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


--=-p4c2qoPsImzK+Z3yMPRO
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-12-02 at 17:33, Michael Gale wrote:
> Hello,
>=20
> 	I have a firewall with multiple interfaces. When I try to set a default =
policy it does not work. I believe this is a problem with netfilter and mul=
tiple interfaces.
>=20
> Example:
>=20
> Inserting the following to the bottom of my firewall script:
>=20
> ### Causes all traffic to or from the box on either interface to be dropp=
ed regardless of all other rules.
>=20
> iptables --policy INPUT DROP
> iptables --policy OUTPUT DROP
> iptables --policy FORWARD DROP
>=20
I use
iptables -P INPUT DROP
instead and it works fine for me.
iptables 1.2.7a, kernel 2.4.20, SuSE 8.2

> ### Causes all traffic to or from the box on either interface to be dropp=
ed regardless of all other rules.
>=20
> iptables -A INPUT -j DROP
> iptables -A OUTPUT -j DROP
> itpables -A FORWARD -j DROP
>=20
> ### But when adding:
>=20
> iptables -A INPUT -i $EXT_FACE -j DROP
> iptables -A INPUT -i $INT_FACE -j DROP
> iptables -A OUTPUT -o $EXT_FACE -j DROP
> iptables -A OUTPUT -o $INT_FACE -j DROP
> iptables -A FORWARD -i $EXT_FACE -j DROP
> iptables -A FORWARD -i $INT_FACE -j DROP
>=20
> The firewall rules behave as they should only allow traffic that matches =
the rules and the default policy now is DROP based on the rules.
>=20
> I believe the problem is caused by having multiple interfaces -- if you o=
nly have 1 interface then the default policy is applied to this interface. =
But if you have multiple networks cards any rule or policy that does not sp=
ecify a network interface becomes a global rule .. as in (iptables -A INPUT=
 -j DROP) and takes affect before any other rules that are based upon netwo=
rk interface.
>=20
>=20
> So if you have these two rules in your firewall script:
> iptables -A INPUT -i $EXT_FACE -j ACCEPT
> iptables -A INPUT -j DROP
>=20
> Even though the first rule is to accept all traffic everything would be d=
enied because the second rule becomes like a global policy since no interfa=
ce is associated with it and it actually gets checked before the packet can=
 make it to the second rule.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-p4c2qoPsImzK+Z3yMPRO
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/zLV4h1fuR/Bv+ygRAl4fAJ972bM2Ti9KemJIvtCmfex+yX6U7wCfSjzd
LmiTjNJnjNfGR4Qhw7Micq4=
=+doK
-----END PGP SIGNATURE-----

--=-p4c2qoPsImzK+Z3yMPRO--


