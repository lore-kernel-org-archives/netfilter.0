From: Harald Welte <laforge@netfilter.org>
Subject: Re: Multiple instances of match extensions
Date: Tue, 24 Jun 2003 19:06:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030624170622.GV2645@sunbeam.de.gnumonks.org>
References: <200306231449.09703.arvanit@ellemedia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0786ZyFfTSxuegBe"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200306231449.09703.arvanit@ellemedia.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Arvanitis Kostas <arvanit@ellemedia.com>
Cc: netfilter@lists.netfilter.org


--0786ZyFfTSxuegBe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2003 at 02:49:09PM +0300, Arvanitis Kostas wrote:
> Is it possible to specify more than one instance of a match extension for=
 a=20
> given rule? The code seems to accept this, but when I try giving two TCP=
=20
> match options using iptables, it exits with an unclear error:
> root@home# iptables -t nat -A POSTROUTING --source 10.0.0.0/8 -mtcp=20
> --destination-port 8080 --syn -mtcp --destination-port 80 -j MASQUERADE

> I know that my example can be accomplished using multiport, but it is jus=
t=20
> used to clarify my question, which is: Can more than one instance of a ma=
tch=20
> extension exist for a single rule? Even if not, is this something possibl=
e in=20
> a future version of iptables?

no, this is not possible due to some architectural limitations.  I
think in the early development this was something optionally to be
implemented (there are some comments in the code), but never was
followed.  It is unlikely that this is going to change, since I'm not
aware of anybody being in urgent need to have that feature, and it would
involve lots of code change.

btw: since this is a development question, why didn't you ask it on the
developer list?

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--0786ZyFfTSxuegBe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE++IUOXaXGVTD0i/8RAiEWAJ9B2D88oHnLW6nGLzbzmyxlAsOwZACeOMUk
b4ZLd8clp4+4m86AT+iAF3U=
=L06+
-----END PGP SIGNATURE-----

--0786ZyFfTSxuegBe--

