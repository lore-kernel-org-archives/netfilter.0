From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Rules for Blocking Proxies...
Date: Tue, 20 Apr 2004 15:47:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082468866.9098.45.camel@raylinux.internal>
References: <000b01c426f6$cc216f10$36b4fea9@SABNANIS>
	 <006f01c426dc$572c2cf0$0c00a8c0@pepelui>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-M/Ka/l6yHkLCep11twSe"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006f01c426dc$572c2cf0$0c00a8c0@pepelui>
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


--=-M/Ka/l6yHkLCep11twSe
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2004-04-20 at 15:35, Alexis wrote:
> set up your own proxy server and only permit connections to this box
> :)
> =20
> =20
>         ----- Original Message -----=20
>         From: Harry
>         To: netfilter@lists.netfilter.org
>         Sent: Tuesday, April 20, 2004 1:44 PM
>         Subject: Rules for Blocking Proxies...
>        =20
>         Hi All,
>         I am running Fedora and Redhat 9 on two servers at my
>         Cybercafe, connected on two Hi speed Lines, I have a decent
>         firewall script, but these days I am facing issues about
>         people changing the Proxy settings in order to get thru porn
>         sites, can anybody suggest some rules which I can implement in
>         the script that avoids connection to these servers?
>         Suggestions are welcome.
<snip>
Or use a ban list to DROP packets destined for the public proxies ...

--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-M/Ka/l6yHkLCep11twSe
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAhSoCh1fuR/Bv+ygRAp1cAJ9aAzsSJ4sbdiPitR3bfzmkGpAWRQCgjasu
fp6vh8GmGL8wSX11qP4SG7A=
=FZli
-----END PGP SIGNATURE-----

--=-M/Ka/l6yHkLCep11twSe--


