From: Harald Welte <laforge@netfilter.org>
Subject: Re: can't delete with iptables
Date: Sun, 15 Feb 2004 16:59:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040215155955.GQ15567@sunbeam.de.gnumonks.org>
References: <200402070721.i177LxJ09969@mail.bg8.so-net.ne.jp>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X35wERi4JU/f1kly"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200402070721.i177LxJ09969@mail.bg8.so-net.ne.jp>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Hideaki Nemoto <eme@bg8.so-net.ne.jp>
Cc: netfilter@lists.netfilter.org


--X35wERi4JU/f1kly
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 07, 2004 at 04:23:07PM +0900, Hideaki Nemoto wrote:
> Hi,
>=20
> I can't delete the rule by iptables, that I inserted
> with my program using libiptc.
>=20
> I've managed to insert, replace, and delete the rulesfrom my program.
> But I can't delete that rule by iptables, or the ip6tables.

Please note that libiptc is not meant as a public API for 3rd party
applications.  We do not encourage people to do so, and it is not
supported at all.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--X35wERi4JU/f1kly
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAL5d7XaXGVTD0i/8RAg5/AKCag5Tpej6WJDIJkTVXLMy05HYlLgCdGpuR
Bm6eaPo7SZLd0O7yr6mWCJA=
=fqwQ
-----END PGP SIGNATURE-----

--X35wERi4JU/f1kly--

