From: Alexander Samad <alex@samad.com.au>
Subject: Re: Review of firewall script
Date: Tue, 16 Mar 2004 12:54:20 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040316015420.GE26800@samad.com.au>
References: <20040315231838.GB26800@samad.com.au> <200403152335.29942.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dnvf+KcI+0MByPWJ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403152335.29942.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--Dnvf+KcI+0MByPWJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 15, 2004 at 11:35:29PM +0000, Antony Stone wrote:
> On Monday 15 March 2004 11:18 pm, Alexander Samad wrote:
>=20
> > Hi
> >
> > I have attached my firewall script, basically creates a DB of rules,
> > also creates a default set of rules.
> >
> > Any comments ?
>=20
> It's long, it's complicated, and it contains some regexes which I don't e=
ven=20
> want to think about.
>=20
> If you get some problems, by all means post the output of "iptables -L -n=
vx;=20
> iptables -L -t nat -nvx" and tell us what the problems are, but I think t=
his=20
> script is in such a nonstandard form that not many people here are going =
to=20
> spend the time looking through it and trying to see if there are any secu=
rity=20
> holes.

Yeah true, it builds a db and you can run the script against the db to
build the tables.  Usually use it on new box to create a default DB of
rules and then play from there, normal sequence

makefirewall makeall
makefirewall setsecurity
makefirewall showtables | less


>=20
> That's my opinion, anyhow....   (happy for someone else to show I'm wrong)
>=20
> Regards,
>=20
> Antony.
>=20
> --=20
> If at first you don't succeed, destroy all the evidence that you tried.
>=20
>                                                      Please reply to the =
list;
>                                                            please don't C=
C me.
>=20
>=20
>=20

--Dnvf+KcI+0MByPWJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAVl5LkZz88chpJ2MRAglkAKDGQU9TqnAMmITsjBXitiKjW+sSQQCg8gxd
XVfuGDohfA2tUkwXvtsM/5A=
=ok/E
-----END PGP SIGNATURE-----

--Dnvf+KcI+0MByPWJ--

