From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Allow Proxy connection
Date: 18 Jun 2003 15:36:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055943389.2530.98.camel@raylinux.internal>
References: <000701c3359c$925ca020$0200a8c0@basti79>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ajBTDsg0f557I+i3gdSw"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000701c3359c$925ca020$0200a8c0@basti79>
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


--=-ajBTDsg0f557I+i3gdSw
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I use similar rules except:

<snip>

> iptables -A OUTPUT -o eth0 -p tcp --dport 80:90 -m state --state
> NEW,ESTABLISHED -j ACCEPT
> iptables -A INPUT  -i eth0 -p tcp --sport 80:90 -m state --state
> ESTABLISHED     -j ACCEPT
>=20
Then of course there's also port 8080 for tomcat and 443 for SSL with
similar rules.

Since you are using state matching, only established connections are
allowed back in.

> But this works only if the webserver in the internet is running on port
> 80. So i tried to use the -m owner --uid-owner option to match all
> packets from the proxy user. The i had to accept all ESTABLISHED packets
> in the INPUT chain, because the owner match works only in OUTPUT chain.
>=20
> What i did now is the following:
>=20
> iptables -A OUTPUT -o eth0 -p tcp -m owner --uid-owner proxy -m state
> --state NEW -j CONNARK --set-mark 1
> iptables -A OUTPUT -o eth0 -m connmark --mark 1 -j ACCEPT
> iptables -A INPUT  -i eth0 -m connmark --mark 1 -j ACCEPT
>=20
> This seems to work, but what i wann know now:
>  - Is this solution secure?
>  - Anybody got a better solution?
>=20
> Regards
> Sebastian.
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-ajBTDsg0f557I+i3gdSw
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD4DBQA+8Grdh1fuR/Bv+ygRAnboAJ9p4LX4K6vmPWBCa2BX2cURN+LPqwCWImbT
B+QM2d6FnZ/Jj5/LwHPpIA==
=m7nT
-----END PGP SIGNATURE-----

--=-ajBTDsg0f557I+i3gdSw--


