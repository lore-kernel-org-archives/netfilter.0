From: Harald Welte <laforge@netfilter.org>
Subject: Re: ipt_hook: happy cracking with 2.6.0-test9-bk7
Date: Fri, 7 Nov 2003 17:44:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031107164455.GT5741@sunbeam.de.gnumonks.org>
References: <20031105083015.57e2dff1.us15@os.inf.tu-dresden.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+epxrXWOh++2HLjY"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031105083015.57e2dff1.us15@os.inf.tu-dresden.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Udo A. Steinberg" <us15@os.inf.tu-dresden.de>
Cc: netfilter@lists.netfilter.org


--+epxrXWOh++2HLjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2003 at 08:30:15AM +0100, Udo A. Steinberg wrote:
>=20
> [ please CC: me on replies because I'm not subscribed to the netfilter li=
st ]
>=20
> Hi,
>=20
> I'm currently running Linux-2.6.0-test9-bk7 compiled with gcc-3.3.2.
> After upgrading from -test9 to -test9-bk7 I'm getting a lot of
>=20
> ipt_hook: happy cracking.
>=20
> messages. Google search revealed that this indicates broken packets being
> sent out from the machine - and this is indeed so.
>=20
> The problem goes away, if I remove all my firewall rules, which looks to =
me
> as if netfilter's --reject-with is the culprit.

if your firewalls are removed, the respective 'happy cracking' code will
never be run - and thus you'd never get that message.

you could try to tcpdump-capture all outgoing traffic in order to find
out which packets are broken.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--+epxrXWOh++2HLjY
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/q8wHXaXGVTD0i/8RApahAJ9cMtNdzvWFt1xXk+cI/fGZRqwnJACfXxOo
NUFeQhKNVFlY5staiizGsKk=
=OJTV
-----END PGP SIGNATURE-----

--+epxrXWOh++2HLjY--

