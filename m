From: Alexander Samad <alex@samad.com.au>
Subject: Re: Ipsec/l2tp
Date: Sun, 4 Jul 2004 08:58:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040703225822.GF6126@samad.com.au>
References: <4FE82EE778704E4D9D31E9CE0BEC1465032312@caf02.caf.local> <200407031213.33996.Antony@Soft-Solutions.co.uk> <opsaj8azll5vdmd8@smtp.fastwebnet.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <opsaj8azll5vdmd8@smtp.fastwebnet.it>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 03, 2004 at 01:46:01PM +0200, Primero wrote:
>=20
> >
> >I hope someone else here can now fill in some useful details for you, =
=20
> >given
> >that you're using 2.6.6
> >
> >Regards,
> >
> >Antony.
> >
>=20
> I'm not an expert, but AFAIK and because it works using this way i think =
=20
> that in 2.6 the process is very similar.
>=20
> In 2.6 ipsec imlementation there is no Virtual interface, like ipsec0 or =
=20
> everything else, but the packets both encrypted and unencrypted come from=
 =20
> the same interface , in expample eth0. They traverse netfilter two times,=
 =20
> like in 2.4 , they get the first time to the INPUT chain, if accepted the=
y =20
> traverse netfilter again in the normal process.
>=20
> The reason i mark my packets at the STEP 1 when they come in encrypted is=
 =20
> because i needed a way to identify packets that arrived ENCRYPTED, get =
=20
> decrypted and acceppted by ipsec and that are traversing the netfilter fo=
r =20
> the second time.
> This way i can be sure that i handle only packets that have been accepted=
 =20
> by ipsec and i can feel good :)
>  for example, i use ipsec fot my WIFI lan and i have this kind of rules:
>=20
> 1) MANGLE/PREROUTING for packets arriving in esp protocol
>=20
> iptables -t mangle -a PREROUTING -s $Y_WIFI_HOSTS -i $MY_WIFI_INTERFACE -=
p =20
> esp -j MARK --set-mark 10
>=20
> 2) INPUT for packets arriving in esp protocol
>=20
> iptables -A INPUT -p esp -j ACCEPT
>=20
> now IPSEC will authenticate and eventually accept the packets
>=20
> 3) INPUT and FORWARD for previously athenticated packets
>=20
> iptables -A FORWARD -m --mark 10 -j MY_FORWARD_CHAIN
> iptables -A INPUT -m --mark 10 -j MY_INPUT_CHAIN

Hi

I believe there is a patch in pom-ng called policy that let you match a
packet based on which ipsec policy it used.

Another methog I use is using the updown script option and adding remove
firewall rules on the fly, on seconds thoughts that is not as good as
above though.

Alex

>=20
>=20
>=20
> bye
>=20
>=20
>=20
> --=20
> Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/
>=20
>=20

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA5zoOkZz88chpJ2MRAuUgAKCAJmKWo9TskRYeyQre/JrtDSxPIACgoZ2o
GLBj3Ky5frvY2SiQzaly6xk=
=0U7S
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--

