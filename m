From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: KAZAA
Date: 02 Jun 2003 08:09:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054534192.13177.112.camel@raylinux.internal>
References: <001301c32747$3b9e57a0$0200000a@workgroup.kev>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-jzcrzagqp3puQFXC6fsD"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001301c32747$3b9e57a0$0200000a@workgroup.kev>
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


--=-jzcrzagqp3puQFXC6fsD
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Kazaa (at least the latest clients) also try and connect via http to the
kazaa servers, basically they tunnel the kazaa traffic in http.

So use your proxy to deny access to *.kazaa.com.

Or, use the iptables string match to drop all packets with 'kazaa' in
them.

Ray

On Sat, 2003-05-31 at 09:35, Kevin Smith wrote:
> Now I am no expert and this is just a random thought. But if Kazaa looks =
for
> other ports to connect, is there a way to send it a fake connect signal s=
o
> it THINKS its connected? Or what someone suggested to block everything. a=
nd
> allow only the ports you know.
> As I said its just a thought...you decide whether its viable, since I don=
t
> use Kazaa anymore.
> Kev
>=20
>=20
>=20
>=20
>=20
> Message: 1
> Date: Thu, 24 Apr 2003 19:28:52 +0800 (PHT)
> Subject: block kazaa using iptables
> From: "Wesley Jay Deypalan" <wjdeypalan@ictuscomm.net>
> To: <netfilter@lists.netfilter.org>
> Reply-To: wjdeypalan@ictuscomm.net
>=20
> Hi,
>=20
> Is there a way to block kazaa using iptables?Already tried blocking port
> 1214 but to no avail, I heard that kazaa change ports if it cannot connec=
t
> using 1214.
> TIA,
>=20
> wesley
>=20
>=20
>=20
>=20
> --__--__--
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-jzcrzagqp3puQFXC6fsD
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+2uowh1fuR/Bv+ygRAlzGAJ9dvFXNTHmV4o52ZIWeI5E9gZKmNACdHQ+e
K+IYjrm8jDcJxwy1BajiV0Q=
=xSmP
-----END PGP SIGNATURE-----

--=-jzcrzagqp3puQFXC6fsD--


