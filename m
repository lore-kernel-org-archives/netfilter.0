From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: connection to vpn Server (pptp) behind iptables FW
Date: Fri, 12 Mar 2004 11:58:03 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079085483.15569.79.camel@raylinux.internal>
References: <DIIE.000000F700002A12@sbgit.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PjlcTCL/GuRvyIHydn84"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000F700002A12@sbgit.com>
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


--=-PjlcTCL/GuRvyIHydn84
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-03-12 at 11:40, peter.gehle@sbgit.com wrote:
> Hi,
>=20
> since two weeks i try to create rules for my iptables fw who
> let pass an vpn tunnel to my internel ms vpn server (pptp).
> i have installed the kernel 2.4.25 and patched it with patch-o-matic (onl=
y the=20
> pptp/gre patch aplied).
>=20
> i load the ip_conntrack_pptp, ip_conntrack_proto_gre, ip_nat_pptp and ip_=
nat_proto_gre modules,
> and my script looks so:
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 1723 -j DNAT --to-de=
stination 192.168.1.2
> iptables -A FORWARD -i eth0 -m state --state NEW -p tcp -d 192.168.1.2 --=
dport 1723 -j ACCEPT
> iptables -A FORWARD -i eth0 -m state --state NEW -p GRE  -d 192.168.1.2 -=
j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p GRE -j DNAT --to-destination 192=
.168.1.2
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> iptables -I FORWARD 1 -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> So whats wrong, becaus i can connect to the vpn server behind the firewal=
l, but the=20
> connection hangs at the authentification. after some minutes i receive an=
 message that
> the server does not respond.
>=20
Micro$oft has a 'technote' on this in their technet section on the
website. AFAIR you need to allow protocol 37 to be forwarded between the
two.

> netstat say this:
> netstat-nat -d 192.168.1.2=20
> Proto NATed Address Foreign Address State=20
> tcp p42821a5e.dip.t-dialin.ne:4394 192.168.1.2:1723 ESTABLISHED=20
> tcp p42821a5e.dip.t-dialin.ne:4392 192.168.1.2:1723 TIME_WAIT
>=20
> Scheme of my network:
> vpn-client -> hw-router -> internet -> hw-router -> firewall -> vpn-serve=
r
>=20
> so whats going wrong?
>=20
> Thanx Peter
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-PjlcTCL/GuRvyIHydn84
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAUYmrh1fuR/Bv+ygRAug8AJ90xS8gMy/zw/xrFNneQ27NwOLFnACffwyO
hZAVvlUIYK1xO3OGQsI85Cg=
=+LD5
-----END PGP SIGNATURE-----

--=-PjlcTCL/GuRvyIHydn84--


