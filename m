From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: Try to NAT a RTP stream
Date: Tue, 29 Apr 2003 20:26:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430032642.GA4762@home.tig-grr.com>
References: <200304270824.31892.lists@ohlmeier.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200304270824.31892.lists@ohlmeier.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Nils Ohlmeier <lists@ohlmeier.de>
Cc: netfilter@lists.netfilter.org


--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

What application are you using to setup the RTP stream?  If you are using
RTSP, I posted an RTSP NAT module for kernel 2.4.21-preX a couple of weeks
ago that may solve your problem.

On Sun, Apr 27, 2003 at 08:24:31AM +0200, Nils Ohlmeier wrote:
> Hello,
>=20
> i try to NAT RTP streams with my own application (i do not use iptables t=
o=20
> insert the rules -> should i go to netfilter-devel?).
>=20
> Scenario:
> 192.168.0.114 <-----> 192.168.0.2
>                       Netfilter NAT
>                      217.224.223.167 <--------------> 195.37.77.110
>=20
> The result is that packets go from private to public but not vice versa. =
And=20
> the ruleset looks like this (empty chains omitted, ruleset is only for=20
> debuging, masquerade rule is for keeping my existing connections):
>=20
> Chain FORWARD (policy ACCEPT 237 packets, 47356 bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>     0     0 ACCEPT     udp  --  *      *       195.37.77.110       =20
> 192.168.0.114      udp spts:18554:18555 dpts:8766:8767
>   399 79648 ACCEPT     udp  --  *      *       192.168.0.114       =20
> 195.37.77.110      udp spts:8766:8767 dpts:18554:18555
>=20
> Chain PREROUTING (policy ACCEPT 3481 packets, 552K bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>     0     0 DNAT       udp  --  *      *       195.37.77.110       =20
> 217.224.223.167    udp spts:18554:18555 dpts:32790:32791=20
> to:192.168.0.114:8766-8767
>=20
> Chain POSTROUTING (policy ACCEPT 660 packets, 52480 bytes)
>  pkts bytes target     prot opt in     out     source              =20
> destination
>     0     0 SNAT       udp  --  *      *       192.168.0.114       =20
> 195.37.77.110      udp spts:8766:8767 dpts:18554:18555=20
> to:217.224.223.167:32790-32791
>     9  1835 MASQUERADE  all  --  *      *       192.168.0.0/23       0.0.=
0.0/0
>=20
> What i do not understand is why the packets from internal hit the rule in=
=20
> FORWARD but do not hit the same rule in POSTROUTING.
> The second strange thing is that packets come in on the external interfac=
e=20
> (observed with ngrep) but to not hit the PREROUTING rule.
> I fear i missed something obvious :-(
>=20
> Any help/ideas appreciated.
>=20
> Greetings
>   Nils Ohlmeier

--=20
Guilty until proven innocent: abusing the legal system in the name of the
war on terror.  http://www.wired.com/news/conflict/0,2100,58326,00.html

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj6vQnIACgkQFMm9uvwPXW6csQCfSgBRzw441RqtaKOJ3B1l/rUd
vFwAoIfy4MDbpIzW5NGWnvZsNPQXmki3
=7Iza
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--

