From: Andy Smith <andy@strugglers.net>
Subject: Re: Unzustellbar: [SPAM] - Re: Why does this connection stop being
	tr acked? - Sending mail server found on relays.ordb.org (fwd)
Date: Wed, 15 Jun 2005 19:57:07 +0000
Message-ID: <20050615195707.GY754@strugglers.net>
References: <Pine.LNX.4.60.0506151315040.25078@darkstar.sysinfo.com>
	<20050615173143.GX754@strugglers.net>
	<42B07379.6000907@riverviewtech.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5FFaGRZUwcpbKFrw"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <42B07379.6000907@riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org


--5FFaGRZUwcpbKFrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2005 at 01:29:13PM -0500, Taylor, Grant wrote:
> IMHO the mail list software should be set up such that it prunes
> the prior servers out of the mail headers as these sending servers
> (to the netfilter list it's self) are the ones in error, not the
> netfilter server yet the servers that are bouncing the messages
> are looking at the original servers.

But then we wouldn't be able to see where mail had actually come
=66rom, which would be unecessarily annoying.  If I *want* to apply my
own anti-spam metrics on the route of the email then so be it.  The
error here is not bouncing mail correctly to Sender or Return-Path:

Return-path: netfilter-bounces@lists.netfilter.org

MTAs that don't obey that will bounce mail back to the posters, not
the mailing list software, which breaks bounce handling, makes VERP
pointless, and is just plain broken.

> Again the mail list is not changing the from email address to be
> the mail list like I think they should.  IMHO any and all email
> passing through this list should be to and from the list email
> address.  Unfortunetly there is probably much debate on how to run
> mail lists and what should and should not be done.  But alass this
> is not really the proper place to do so.

It isn't the From which MTAs obey but the Sender, which in this case
is correctly set to be the mailing list.

Why remove useful info just to compensate for terribly broken
software?

> As of yet I have not tried contacting this mail list administrator
> to this regard so I can not comment one way or the other on their
> cooperation, perhaps it is time to do such.

Their address bounces too...

--5FFaGRZUwcpbKFrw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFCsIgTIJm2TL8VSQsRApWSAJ9V09TRwlZc7uMuev9vK+PLEHroGACfUa4c
4yYjHa+F55UTKVk3bvn1CUM=
=DPJY
-----END PGP SIGNATURE-----

--5FFaGRZUwcpbKFrw--

