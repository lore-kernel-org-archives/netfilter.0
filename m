From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: block msn
Date: 16 Jul 2003 18:01:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058371265.6618.51.camel@raylinux.internal>
References: <3F1538A4.9000702@sat.com.py>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ip5L2PctFA2dGD5E1Iyb"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F1538A4.9000702@sat.com.py>
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


--=-ip5L2PctFA2dGD5E1Iyb
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The msn clients with winblows xp also 'tunnel' via your proxy if they
can't get out via the normal methods. You need to block the msn mime
types.

With ip tables I think you could probably use a string match for
'x-msn-messenger' (if that's the mime type).

Ray

On Wed, 2003-07-16 at 13:36, juanca wrote:
> I`ve got this rulset but It doesn`t work what else do I need to add?
> All the windows machine work msn, just on linux doesn`t
> Any suggetions ?
> Thanks in advance
>=20
> iptables -A FORWARD -s 192.168.0.10 -p TCP --dport 1443:1467 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.33 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.38 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1513:1525 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -d 66.35.229.204 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -d 65.54.194.118 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -d 207.46.107.34 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -d 208.45.129.195 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
> iptables -A FORWARD -s 192.168.0.10 -d 207.46.110.11 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1863 -d 0/0 -j DROP
> iptables -A FORWARD -s 192.168.0.10 -p tcp --dport 1601:1603 -d 0/0 -j DR=
OP
> iptables -A FORWARD -s 192.168.0.10 -d 64.4.13.0/24 -j REJECT
> iptables -A FORWARD -s 192.168.0.10 -d 64.4.0.0/24 -j REJECT
> iptables -A INPUT -p tcp -s 192.168.0.10 -d messenger.microsoft.com -j DR=
OP
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-ip5L2PctFA2dGD5E1Iyb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/FXbBh1fuR/Bv+ygRAs1SAJ9Re0O9xMGFPHtVqVX5ghr0wgjVJACdE28D
C2rLvIFRRmr2UaFoSpOnTYk=
=qaYv
-----END PGP SIGNATURE-----

--=-ip5L2PctFA2dGD5E1Iyb--


