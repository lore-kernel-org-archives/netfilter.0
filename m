From: Alexander Samad <alex@samad.com.au>
Subject: Re: transparent proxy
Date: Tue, 16 Mar 2004 12:57:24 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040316015724.GF26800@samad.com.au>
References: <3C204966522884458700FF59D6EFB87A474DDE@FORUS01.netpower.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qABWltju4eaUXBmg"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3C204966522884458700FF59D6EFB87A474DDE@FORUS01.netpower.lan>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter <netfilter@lists.netfilter.org>


--qABWltju4eaUXBmg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2004 at 10:19:35AM +0100, Fredrik Emil Jensen wrote:
> Hey=20
>=20
> I'm currently using squid and squidGuard for redirection. Setting up the
> rules:
>=20
> Iptables -t nat -A PREROUTING -p tcp -s 192.168.1.0/24 -d 0/0 --dport 80
> -j REDIRECT --to-ports 3128=20
>=20
> But does anyone know what to do if you want to use iptables to bypass
> squid with single IP address?
>=20
> I know that you can add the rule "iptables -t nat -A POSTROUTING -o eth0
> -s 192.168.1.10/32 -d 0/0 -j SNAT --to "source_Wan_address" ". But this
> rule will be added at the end of the rule list, and all traffic on port
> 80 will still be redirected through squid. Even when I use priority
> "iptables -t nat -I POSTROUTING 1 etc" and I put higher priority on the
> rule for the bypass IP, it is still being redirected through squid. I
> have to remove the redirect rule before I can bypass squid.=20

-A means to append to the end of the chain
-I means to insert at the top
or

-I INPUT 5 - mean to insert above line 5 of a chain.

Chains a processed from top to bottom=20

hope that helps


>=20
> Does anyone know what I'm doing wrong?
>=20
> Using Slackware 9.1 with Kernel 2.6.2, iptables version 1.2.9 and squid
> 2.5
>=20
> Regards,=20
> Fredrik
>=20

--qABWltju4eaUXBmg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVl8EkZz88chpJ2MRAun0AJ44mLIp+j77ORXl2Gua7Sn7Vz77CwCghUEW
fPh0EuEem5h6M7CMXwwd8MU=
=04Px
-----END PGP SIGNATURE-----

--qABWltju4eaUXBmg--

