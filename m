From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: RTSP
Date: Fri, 3 Oct 2003 09:15:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003161506.GA17911@home.tig-grr.com>
References: <771599703.20030930173006@netfids.com> <20030930235504.GB2030@home.tig-grr.com> <20031003102707.GX5758@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="G4iJoqBmSsgzjUCe"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031003102707.GX5758@sunbeam.de.gnumonks.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Harald Welte <laforge@netfilter.org>, Geffrey Velasquez <g_netfilter@netfids.com>, netfilter@lists.netfilter.org, tmarshall@real.com


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2003 at 12:27:07PM +0200, Harald Welte wrote:
> On Tue, Sep 30, 2003 at 04:55:04PM -0700, Tom Marshall wrote:
> > You can try this:
> >=20
> >   http://home.tig-grr.com/rtsp/index.html
>=20
> Why did nobody submit that to patch-o-matic yet?=20

Because I don't do patch-o-matic and nobody else has seen fit to do it, I
suppose.

> Another issue, to quote from the above URL:
> > Please let me know if you use this module, and how it works for you.
> > The more feedback, the more incentive to improve the module and try to
> > get it into the mainline kernel.
>=20
> This is not possible.  The netfilter coreteam strongly opposes including
> conntrack/nat helpers for protocols where there is not at least one free
> software client and server implementation.  AFAIK, there is no free RTSP
> server implementation so far.  Please inform me, if I'm wrong.

It's an IETF standard (well, RFC if you want to be technical).  I don't care
about your political games and I'm not going to bother hunting down a "free"
(whatever your definition of that word) implementation.  I'm sure they
exist.  If you don't accept a patch for a commonly used protocol that has
RFC status, then you are doing a disservice to your users.

--=20
A great many people think they are thinking when they are merely
rearranging their prejudices.
        -- William James

--G4iJoqBmSsgzjUCe
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj99oIoACgkQFMm9uvwPXW5f2gCgjRJtvBRNSL3Emxja2HsP4Plk
Vs8An2EI8XxikjLx/srOTa1zvbMiSMaH
=Bkvp
-----END PGP SIGNATURE-----

--G4iJoqBmSsgzjUCe--

