From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: NAT+FORWARD
Date: Thu, 06 May 2004 12:21:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083838878.29496.22.camel@raylinux.internal>
References: <200405051209.55454.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-3avk5I4Atd7/QzNYtTil"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405051209.55454.pandre@darkstar.nom.za>
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


--=-3avk5I4Atd7/QzNYtTil
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-05-05 at 12:09, Paulo Andre wrote:
> I just need some clarification please.
>=20
> Take for example the following two rules:
>=20
> iptables -t nat -A PREROUTING -i $ext_card -s $client_IP -d $my_ext_ip -p=
 tcp=20
> --dport 80 -j DNAT --to $int_web_IP:80
> iptables -A FORWARD -i $ext_card -d $int_web-IP -p tcp --dport 80 -j ACCE=
PT
>=20
> According to my thinking the above rule would be unsafe as the source was=
 not=20
> specified on the FORWARD rule. As the would allow anyone using the firewa=
ll=20
> as a gateway to have access to $int_web_IP on port 80. Is that correct?
>=20
Assuming their traffic passes the prerouting rules and the $int_web-IP
is routable for them, yes.

> Paulo
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-3avk5I4Atd7/QzNYtTil
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAmhGdh1fuR/Bv+ygRAi6qAKCF54Ge16xZu7nTIcGSA5x/+utXIwCggd3m
G5zuXT3is+6ieyBTC6LegKU=
=xnqa
-----END PGP SIGNATURE-----

--=-3avk5I4Atd7/QzNYtTil--


