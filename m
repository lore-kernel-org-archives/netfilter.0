From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: help iptables queuing
Date: 18 Jun 2003 12:33:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055932392.2530.48.camel@raylinux.internal>
References: <20030618093855.41783.qmail@mail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-togof5NfyiIsESYp214i"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030618093855.41783.qmail@mail.com>
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


--=-togof5NfyiIsESYp214i
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Is your kernel compiled with connection tracking support (either in the
kernel, or as a module)?

Ray

On Wed, 2003-06-18 at 11:38, Paridhi Bansal wrote:
> HI!!
>=20
> I am using RedHat linux 7.3 with iptablesv1.2.5..I am using iptables queu=
ing to get the packets to my application...I have used thefollowing
> iptables' commands:
>=20
> 	iptables -t nat -A OUTPUT -j QUEUE
> 	iptables -t nat -A PREROUTING -j QUEUE
> 	iptables -t nat -A POSTROUTING -j QUEUE
> 	iptables -A INPUT -j QUEUE
>=20
> But instead of getting all the packets,i just get first packet of every c=
onnection.For example, just first packet of TCP telnet, FTP connection (wit=
h SYN bit set and ACK not set )and not the subsequent packets.Why is this s=
o?????
>=20
> Can somebody help me with the explanation of this??????
>=20
>=20
> Paridhi
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-togof5NfyiIsESYp214i
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+8D/oh1fuR/Bv+ygRAiYjAJ4lxwkffVRq3EoL7sMgTysGLGiSQQCgnJnj
J8Gn0UxV7ikesTV83upYooA=
=5ugA
-----END PGP SIGNATURE-----

--=-togof5NfyiIsESYp214i--


