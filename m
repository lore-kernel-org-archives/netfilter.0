From: Harald Welte <laforge@netfilter.org>
Subject: Re: Possible dangerous flaw in the NAT howto
Date: Tue, 24 Jun 2003 19:10:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624171046.GW2645@sunbeam.de.gnumonks.org>
References: <20030622024450.19E60105939@hot.ee>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WeojGOqAOUQyw5FN"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030622024450.19E60105939@hot.ee>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Elver Loho <kernelpenguin@hot.ee>
Cc: netfilter@lists.netfilter.org


--WeojGOqAOUQyw5FN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2003 at 05:44:49AM +0300, Elver Loho wrote:
> I was on #netfilter (irc.freenode.net) earlier and asked about a
> possible flaw in the NAT howto, but got no reply (people sleeping?) so
> I'm just going to paste what I said here and go to sleep. (nearing 6am
> currently)
>=20
>=20
> <elver> I have a question about masquerading. The NAT howto gives an
> example like this: "iptables -t nat -A POSTROUTING -o ppp0 -j
> MASQUERADE", but since it masks the packets that are outgoing on ppp0
> (by the destination IP, interface IP and netmask) then could that rule
> also be exploited by outside hosts tunneling?
> [...]

Well, using nat doens't mean that you don't want to use packet filtering
anymore, does it?=20

I mean, apart from your MASQUERADE rule you would still have a packet
filtering ruleset in the 'filter' table, just like on any normal non-NAT=20
firewall.=20

> Elver Loho
> kernelpenguin@hot.ee

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--WeojGOqAOUQyw5FN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE++IYWXaXGVTD0i/8RAsTvAJ4hdmlavedmepdqlB3t0K+QEC5AuQCdFvoM
UL4q+0lggHtGWns84OjaxSc=
=xYYC
-----END PGP SIGNATURE-----

--WeojGOqAOUQyw5FN--

