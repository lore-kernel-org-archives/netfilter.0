From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Doing Bridge with firewalling
Date: Wed, 1 Jan 2003 10:10:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030101151001.GS677@ns>
References: <001001c2b113$e2181800$0100a8c0@zultys.com> <20021231221901.7569.qmail@web40311.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RtGa12sjXv8gVUZO"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20021231221901.7569.qmail@web40311.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Kevin McConnell <kevymac@yahoo.com>
Cc: Ranjeet Shetye <ranjeet.shetye@zultys.com>, netfilter@lists.netfilter.org


--RtGa12sjXv8gVUZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Kevin McConnell (kevymac@yahoo.com) wrote:
> --- Ranjeet Shetye <ranjeet.shetye@zultys.com> wrote:
> > I think that we need to clearly define the
> > terminology for Kevin.
>=20
> Yes, thank you! :) I am always up for learning new
> things. So it was just done at layer 2 instead of
> layer 3. I understand now. BUT, back to what the
> original poster said. He said that he wanted to have
> the bridge do firewalling and NAT'ing (If I read his
> post correctly). So according to what is written
> below, he can't do that... right?=20

That's what he was claiming but that's incorrect.  I've done it and I've
helped other people through the process of doing it.  The big thing is
to get the patch from the bridge homepage (if it hasn't been
incorporated into the main kernel yet).

	Stephen

--RtGa12sjXv8gVUZO
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+EwTJrzgMPqB3kigRApMdAJ9Q9n3gg0EGrpGNPKoXcx11rFTdugCgmrY4
+D+do1LcpjFvJ985bmlkfbg=
=RlvP
-----END PGP SIGNATURE-----

--RtGa12sjXv8gVUZO--

