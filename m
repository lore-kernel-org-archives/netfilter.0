From: Harald Welte <laforge@gnumonks.org>
Subject: Re: Request to add to netfilter/iptables FAQ
Date: Sat, 30 Aug 2003 19:28:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030830172858.GJ17715@sunbeam.de.gnumonks.org>
References: <7105F2BD9451D7479B4B3A99A2B72FAC02C7D7FB@exchange1.ssd.fsi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KIbT1ud6duwZIwNL"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <7105F2BD9451D7479B4B3A99A2B72FAC02C7D7FB@exchange1.ssd.fsi.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Rockefeller, Harry" <harryr@SSD.FSI.com>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--KIbT1ud6duwZIwNL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2003 at 09:04:15AM -0500, Rockefeller, Harry wrote:
> Harald,
> Are you still maintaining this FAQ?  I notice the last
> update was over a year ago.

not really, I am too far away from our users to know about their
frequently asked questions anymore.  We will be posting a call for
volunteers regarding this subject soon.

> I was hoping to find in the "Problems at runtime"
> section the answer to my problem.
>=20
> I'm testing the 2.6.0-test4 kernel on my laptop and had,=20
> to manually 'modprobe' these modules to insert them:
>=20
>   $ lsmod
>   Module                  Size  Used by
>   ip_conntrack_irc       70420  0=20
>   ip_conntrack_amanda    68996  0=20
>   ip_conntrack           24352  2 ip_conntrack_irc,ip_conntrack_amanda
>   ip_tables              15504  0=20
>=20
> Afterward, I run iptables -L and get:=20
>=20
>   iptables v1.2.7a: can't initialize iptables table 'filter':
>   Table does not exist (do you need to insmod?)
>   Perhaps iptables of your kernel needs to be upgraded.

all you need to do is recompile iptables from source.

> Are there known bugs in the 2.6.0<->iptables environment?

no.

--=20
- Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Programming is like sex: One mistake and you have to support it your lifeti=
me

--KIbT1ud6duwZIwNL
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/UN7aXaXGVTD0i/8RApQBAJ4ioHLyeqN2YoFzysZSv53kFfLHFwCfUI1O
dzJEuGkQKJo341V6upaMfHc=
=xNRs
-----END PGP SIGNATURE-----

--KIbT1ud6duwZIwNL--

