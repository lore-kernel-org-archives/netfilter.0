From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: System Load
Date: Mon, 17 Nov 2003 11:16:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069060584.22071.59.camel@raylinux.internal>
References: <200311141519.11902.bikrant_ml@wlink.com.np>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZVqAuk+RHfflLEG46SSS"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311141519.11902.bikrant_ml@wlink.com.np>
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


--=-ZVqAuk+RHfflLEG46SSS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2003-11-14 at 11:34, Rohit wrote:
> Hi,
> 	Is it possible to know how much system resources (cpu/memory load) that =
the=20
> netfilter module(s) is using? We are using HTB to shape our client traffi=
c=20
> and there are 4 iptables rule for each client in the mangle table. I thin=
k it=20
> will be helpful to gather such data and graph it using mrtg.
>=20
Just remember, iptables is only used to mark the traffic. tc is used to
classify and shape the traffic.

> I'm really sorry if someone has already asked about it.
> Thanks a lot.
>=20
> with regards,
> Rohit Nepali
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-ZVqAuk+RHfflLEG46SSS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/uJHoh1fuR/Bv+ygRAjUcAKCtTAFtc542TkCT2IkWU/0L1deEJQCfXxlV
qtrQURczttsOsmUpusF3eB0=
=/ohx
-----END PGP SIGNATURE-----

--=-ZVqAuk+RHfflLEG46SSS--


