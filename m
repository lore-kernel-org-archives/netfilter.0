From: Franck Joncourt <franck.joncourt@wanadoo.fr>
Subject: Re: How to tarpit without loading conntrack modules?
Date: Mon, 6 Aug 2007 15:01:41 +0200
Message-ID: <20070806130141.GA7805@sid.toystory.lan>
References: <46B13903.2060206@instant.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46B13903.2060206@instant.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2007 at 10:53:07PM -0300, Juan Carlos Castro y Castro wrote:
> (Please CC me as I'm not on the list)
>
> Is it possible to use the TARPIT module without auto-loading conntrack=20
> modules and still leaving the machine able to make outbound connections? =
I=20
> tried the following and it didn't work. Using -m state --state ESTABLISHE=
D=20
> loads the conntrack modules and therefore leaves the machine open to=20
> resource waste by connections that get tarpitted. Is there a solution? Or=
=20
> will I have to separate a machine for the purpose, and leave it unable to=
=20
> make outbound TCP connections?
>
> -A INPUT -s 127.0.0.0/8 -j ACCEPT
> -A INPUT -s (some source) -p tcp -m tcp --dport (some port) -j ACCEPT
> -A INPUT -s (other source) -p tcp -m tcp --dport (other port) -j ACCEPT
> -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK SYN -j TARPIT
> -A INPUT -p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -j TARPIT
>

According to the iptables man page, you have to use the NOTRACK target
to avoid that.

[quote]
If you use the conntrack module while you are using TARPIT, you should
also use the NOTRACK target,  or the kernel will unnecessarily allocate
resources for each TARPITted connection. To TARPIT incoming connections=20
to the standard IRC port while using conntrack, you could:

iptables -t raw -A PREROUTING -p tcp --dport 6667 -j NOTRACK

iptables -A INPUT -p tcp --dport 6667 -j TARPIT
[/quote]

Does it help ?

--=20
Franck Joncourt
http://www.debian.org - http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGtxu1xJBTTnXAif4RAsaDAJ96wA5k/+Tu6fqyiFnHdK7knHpDSACfTPgr
vGu+p1XBomEnFTn/D10Pxo8=
=4SEn
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--


