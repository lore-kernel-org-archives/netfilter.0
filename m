From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: BANDWIDTH MANAGEMENT
Date: 29 Jul 2003 12:22:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059474162.16733.26.camel@raylinux.internal>
References: <3F2647E5.8000206@libero.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-Vlw6twVocksE/pud7EAv"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2647E5.8000206@libero.it>
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


--=-Vlw6twVocksE/pud7EAv
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-07-29 at 12:09, Giulius wrote:
> Hi list!
>=20
> I need to find a method to limit my bandwidth, and i would like to know=20
> if exist a module with netfilter that do this.
>=20
Yes and no.

bandwidth management on Linux is done using tc (traffic control) - part
of ip route2.

Ther are however modules of P-O-M (netfilter) that can route traffic via
different interfaces according to netfilter rules. Sort of poor mans
load balancing.

Have a look at tc and the queuing disciplines (HTB, TBF, SFQ, CBQ, etc).

Ray
> Tx.
> Giulius.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-Vlw6twVocksE/pud7EAv
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/Jkryh1fuR/Bv+ygRAqPiAJ48blir7qmr88KGVq1Kwb5EJ8jlwACcC5Jb
M+y4nhGxRMKqW3AOek9V2ZM=
=mzUZ
-----END PGP SIGNATURE-----

--=-Vlw6twVocksE/pud7EAv--


