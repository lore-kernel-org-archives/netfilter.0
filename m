From: Harald Welte <laforge@netfilter.org>
Subject: Re: failed to configure iptables with 2.6.16 kernel
Date: Tue, 28 Mar 2006 10:09:26 +0200
Message-ID: <20060328080925.GE28782@sunbeam.de.gnumonks.org>
References: <064FKGY12@briare1.heliogroup.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751372AbWC1IJj@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <064FKGY12@briare1.heliogroup.fr>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Hubert Tonneau <hubert.tonneau@fullpliant.org>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org


--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2006 at 04:00:33AM +0000, Hubert Tonneau wrote:
> When upgrading from 2.6.15 to 2.6.16 I noticed iptables not working anymo=
re.
>
> I traced the problem down to a new 'CONFIG_NETFILTER_XTABLES' compile opt=
ion
> that must be set, but I still get some rules rejected as soon as
> '--destination-port' option is used.
>=20
> As an example, the following command:
>   iptables -A eth0in -p udp --destination-port 111 -j DROP

this sounds like you're missing support for the tcp/udp match.
This functionality is implemented in xt_tcpudp.{c,ko}, which is compiled
as soon as x_tables is compiled.

What does cat /proc/netip_tables_matches show before and after executing
your iptables command, and before/after manually executing modprobe
xt_tcpudp.

Also, what is your iptables program version?

Please follow-up-to netfilter@lists.netfilter.org, but keep me in Cc

--=20
- Harald Welte <laforge@netfilter.org>                 http://netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEKO81XaXGVTD0i/8RAs8SAJ0btAexlhAFnE8zHobLiI62AiPSAwCfe0eu
8OlsybppMfuNFDhPbr9s/fU=
=dVTD
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
