From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Exempt one IP from DNAT for the whole network
Date: Wed, 21 Jan 2004 13:33:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074684782.28849.25.camel@raylinux.internal>
References: <747032.1074683300483.JavaMail.root@newdil25>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-q2x0Tcw9oa5pWnxTxbZN"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <747032.1074683300483.JavaMail.root@newdil25>
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


--=-q2x0Tcw9oa5pWnxTxbZN
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2004-01-21 at 13:08, alok.shukla@soft.dil.in wrote:
> hi everybody ,,,=20
> I have a unique problem.=20
> =20
> I have created a rule in the prerouting chain in the nat table to DNAT
> every packet coming from 10.11.12.0/24 network to the webserver
> running on the local machine
> =20
> Now i want one of the IP from this pool to be exempted from this rule.
> I had put a rule in the mangle table so as to RETURN  from prerouting
> chain.
You need to put the rule in the same chain, just above your other rule.

iptables -t nat -A PREROUTING -i eth0 -p tcp -s 10.11.12.1 -j RETURN
iptables -t nat -A PREROUTING -i eth0 -p tcp -s 10.11.12.0/24 -j DNAT
--to 1.2.3.4

This works for me ...

> =20
> I think that this RETURN is not working. I would like to know the
> other ways i can make a machine exempted from the DNAT that is
> occuring.
> =20
> Kindly suggest
> =20
> Alok Shukla
>=20
>=20
> ______________________________________________________________________
> Powered by Xgen(Next Generation Email Client)
> http://www.datainfosys.com
> Do not remove this:[XGEN]210120043820224284:NM[-XGEN-]
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-q2x0Tcw9oa5pWnxTxbZN
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBADmNuh1fuR/Bv+ygRAi9sAJ977qjlzLdys/iy752DUPpBG4zlQACgt+s+
WiCS44JQEB/InEYasab6auw=
=FZlN
-----END PGP SIGNATURE-----

--=-q2x0Tcw9oa5pWnxTxbZN--


