From: Harald Welte <laforge@gnumonks.org>
Subject: Re: PPTP NAT
Date: Sat, 18 Jan 2003 16:41:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030118154147.GB5739@sunbeam.de.gnumonks.org>
References: <1042821169.13896.22.camel@torwood>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9zSXsLTf0vkW971A"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1042821169.13896.22.camel@torwood>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Colin Simpson <colin@csl.co.uk>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2003 at 04:32:49PM +0000, Colin Simpson wrote:
> Sorry to annoy you about this but I'm having real problems with the
> pptp-conntrack-net netfilter patch. I have tried looking around the web
> but no one seems to talk much about how to fix this.
>=20
> I have patched with patch-o-matic the 2.4.20 kernel. It seems to apply
> ok and build. But I now get the following when I try to apply any SNAT
> rule
>=20
> iptables -t nat -p tcp -A POSTROUTING -s 192.168.77.0/24 -j SNAT
> --to-source 80.195.55.115:1024-65535
> iptables v1.2.7a: Unknown arg `--to-source'
> Try `iptables -h' or 'iptables --help' for more information.
>=20
> Am I missing something?

yes, you need to rebuild the iptables userspace package, since the size
of some NAT related structures have changed.

> Colin Simpson
> Network Manager

--=20
- Harald Welte / laforge@gnumonks.org               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
"If this were a dictatorship, it'd be a heck of a lot easier, just so long
 as I'm the dictator."  --  George W. Bush Dec 18, 2000

--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE+KXW7XaXGVTD0i/8RAvxKAKCI6DSYNIfq7Gxf97UvYmXcOSyJzwCggYj+
isxZoZugbY/k+8Epd4t+ILE=
=DBhO
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--

