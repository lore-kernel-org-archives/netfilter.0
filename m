From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: FORWARDING and NAT chains
Date: Fri, 30 Jan 2004 07:50:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075441811.1999.116.camel@raylinux.internal>
References: <001901c3e670$a4bd2250$3d40000a@wisdom>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-6NCV1/wdZDCMTrhyIkkI"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001901c3e670$a4bd2250$3d40000a@wisdom>
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


--=-6NCV1/wdZDCMTrhyIkkI
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2004-01-29 at 16:02, Srinivasa Hebbar wrote:
> Hello,
>=20
> I believe that the NAT PREROUTING and POSTROUTING will=20
> always takes place for all the incoming/outgoing packets
> irrespective of whether the packet is destined to the node or not.
>=20
> I have a situvation that if the dest. IP address of the packet is
> for the local node, then apply NAT rule, otherwise it should simply
> forward the packet according to the routing table.
>=20
> How can I achive the above?
>=20
Use the INPUT chain of the nat table.

> Any help is very much appreciated.
>=20
> Regards,
> S. Hebbar.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-6NCV1/wdZDCMTrhyIkkI
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAGfCTh1fuR/Bv+ygRAgLrAJ9QO/q0iAQoC0g9ej07719w2WNSvACgkYZu
PPisda7dWc3V0VvxYLU4NtU=
=IGkb
-----END PGP SIGNATURE-----

--=-6NCV1/wdZDCMTrhyIkkI--


