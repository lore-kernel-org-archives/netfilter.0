From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Redirect and change the source IP
Date: Mon, 03 Nov 2003 16:00:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067868026.26086.66.camel@raylinux.internal>
References: <oprx2cuychpvmot6@192.168.2.1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-bcoG5kbKF1rps3+5UNv/"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <oprx2cuychpvmot6@192.168.2.1>
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


--=-bcoG5kbKF1rps3+5UNv/
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2003-11-03 at 15:24, Mart=EDn wrote:
> How can I redirect inbound traffic and also change the source IP of this=20
> traffic?
iptables -t nat -A POSTROUTING -i eth0 -s 123.321.123.321 -p tcp --dport
80 -j SNAT --to 1.2.3.4

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-bcoG5kbKF1rps3+5UNv/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/pl96h1fuR/Bv+ygRAk1MAJ9rsKyWRZ0L/oJ9rlnPfxRqosBsdACgpmxm
BN3K9nAQYRpqV8FU0NxU6CI=
=7FeK
-----END PGP SIGNATURE-----

--=-bcoG5kbKF1rps3+5UNv/--


