From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: block mirc, messenger
Date: 19 Jun 2003 12:14:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056017678.1446.26.camel@raylinux.internal>
References: <062e01c33643$69dee570$0300a8c0@medannic>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-dd+sVOaIkrl5a6sYe1t7"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <062e01c33643$69dee570$0300a8c0@medannic>
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


--=-dd+sVOaIkrl5a6sYe1t7
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

The INPUT chain (as specified in the docs) is for traffic destined for
the machine (router/fw) itself.

You were most likely looking for the FORWARD chain.

Ray

On Thu, 2003-06-19 at 11:16, HTB wrote:
> Hello ,=20
> =20
> I already install RH. 8, with 2 interface (eth0 10.10.10.8), (eth1
> 192.168.1.1), i want blocking mirc, messeger. I type this command
> =20
> /sbin/iptables -I INPUT -i eth0 -p tcp -s 10.10.10.8/32 --dport 6667
> -j DROP
> =20
> but I still can running mirc.
> =20
> pls help me to solv this problem
> =20
> HTB
> =20
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-dd+sVOaIkrl5a6sYe1t7
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+8Y0Oh1fuR/Bv+ygRAhH+AKCl6QpM9/c54Tylwpsq0305f9vOFACePZxn
dngnPBr9YMFw5rtsmeDTk8g=
=/cH7
-----END PGP SIGNATURE-----

--=-dd+sVOaIkrl5a6sYe1t7--


