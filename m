From: Alexander Samad <alex@samad.com.au>
Subject: Re: kernel 2.6 ipsec and DNAT
Date: Fri, 10 Sep 2004 16:59:29 +1000
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040910065929.GY6074@samad.com.au>
References: <ED78BD9E-FDCA-11D8-8A26-000A95BDFB08@equation.fr>
	<20040903223115.GP3169@samad.com.au>
	<20040910081322.1a2e843a@xenia.leun.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4XGXW98AkZ9Jbbyi"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040910081322.1a2e843a@xenia.leun.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--4XGXW98AkZ9Jbbyi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 10, 2004 at 08:13:22AM +0200, Michael Leun wrote:
> Hello,
>=20
> On Sat, 4 Sep 2004 08:31:15 +1000
> Alexander Samad <alex@samad.com.au> wrote:
>=20
> > > The problem I am encountering now is that it seems that DNAT is not=
=20
> > > working when the d-natted session is from a tunneled site. My settup
> > > is=20
> [...]
> > > Is there any problem like this under the current 2.6.8 kernel ? Do
> > > you have any idea to try to bypass the problem ?
>=20
>=20
> > This is a known problem with netfilter and 2.6 and ipsec with the
> > native stack, there are fixs in pom-ng (Patch o matic), but this means
> > building your own kernel as it patches the kernel and the netfilter
> > modules.  Not to bad though, been doing this for a while and haven't
> > had any majour problems
>=20
> But, as far as I know, the patches in pom-ng (even cvs) do not work
> since 2.6.7.

This might be the case as I haevn't looked at it since 2.6.7
>=20
> I mailed the author of this patches (Patrick McHardy) and he told me two
> times he is going to fix this RSN(tm) - but unfortunately does seem to
> have not had time to do it yet.
>=20
> Have I overlooked something, or is there indeed no working solution for
> 2.6.8? Has anybody fixed the patches?
>=20
> --=20
> Bye,
>=20
> Michael Leun
>=20
>=20
>=20

--4XGXW98AkZ9Jbbyi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBQVDRkZz88chpJ2MRAhAwAJ0SKTSKduid9b0nsDrI+C3jlX+MgQCgw5ir
n/ryUZMflu8to2kK7B1vvro=
=hMlc
-----END PGP SIGNATURE-----

--4XGXW98AkZ9Jbbyi--

