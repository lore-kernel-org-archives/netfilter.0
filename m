From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Loose source routed IP packets.
Date: Tue, 23 Sep 2003 14:31:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064320275.31340.104.camel@raylinux.internal>
References: <200309231347.57709.carles@unlimitedmail.org>
	 <Pine.LNX.4.51.0309231409290.14794@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Q91mMsOpYKEFQ2q5jXsc"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0309231409290.14794@dns.toxicfilms.tv>
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


--=-Q91mMsOpYKEFQ2q5jXsc
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-09-23 at 14:12, Maciej Soltysiak wrote:
> > Hi,
> > Is it possible to drop ICMP loose source routed IP packets ?
> > How ?
> Try Fabrice Marie's ipv4options match from patch-o-matic, you would then
> do a:
> # iptables -A INPUT -p icmp -m ipv4options --lsrr -j DROP
>=20
> Regards,
> Maciej
How about :
### don't accept source routed packets
/bin/echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route

Ray
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Q91mMsOpYKEFQ2q5jXsc
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/cD0Th1fuR/Bv+ygRAhj8AJ96dD6vQNji2hemJMINAWUhvaX8GgCgmT9N
Io5GJRd5YRz1s+rfUkFPqnM=
=fRc+
-----END PGP SIGNATURE-----

--=-Q91mMsOpYKEFQ2q5jXsc--


