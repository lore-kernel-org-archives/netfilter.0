From: Harald Welte <laforge@netfilter.org>
Subject: Re: I found what I was looking for l7-filter.sf.net.
Date: Sun, 15 Feb 2004 16:55:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040215155502.GN15567@sunbeam.de.gnumonks.org>
References: <20040209224943.27665.qmail@web11906.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/UvyDgxjlFfP/4zZ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20040209224943.27665.qmail@web11906.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Mike Mestnik <cheako911@yahoo.com>
Cc: "lists.netfilter.org netfilter" <netfilter@lists.netfilter.org>, l7-filter-developers@lists.sourceforge.net


--/UvyDgxjlFfP/4zZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 09, 2004 at 02:49:43PM -0800, Mike Mestnik wrote:
> Are there any plans to add this to the patch-o-matic?  If nothing else
> could you put a link on your links page.

Since the original authors of l7-filter did never contact us, we didn't
know about their project at all. =20

In fact, you are the first one mentioning it to me, and I'm now reading
through their source. =20

Although I'm not a fan of doing stuff like this inside the kernel, I
think it is still a valid candidate for patch-o-matic (ng). However,
this is up to the original software authors.

A couple of comments:

- put all the new struct ip_conntrack members into a seperate
  sub-structure (like the 'nat' and 'helper' substructures do)
- think about type usage.  Use unsigned int for stuff like numpackets,
  since it is not likely to become negative ;)
- Adhere to CodingStyle (tab-width indent, ...)
- use arch-independent types in ipt_childlevel_info, or it will break
  on sparc64 and other archs
- don't put regexp.c/ressub.c into linux/include/linux/regexp.  This
  belongs together with the iptables module
- Add sufficient GPL notices to every=20
- Please decouple the 'childlevel' match and submit it seperately.  We
  could even submit it to the kernel soon.
- I can't see any locking in your code, and I don't think it's SMP safe

One additional question:

- Did you consider basing your work on top of libqsearch?
  (http://www.cartel-securite.fr/pbiondi/libqsearch.html)

  libqsearch is IMHO the preferred (and already existing and widely
  deployed, even in commercial products) way of doing pattern matching
  inside the kernel.

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--/UvyDgxjlFfP/4zZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAL5ZWXaXGVTD0i/8RAgThAKChWAlF+sbvM13dRsTFLWeocUvJFgCfYbvV
aMe2KLjcqkMhGZIoSpeRn3o=
=tdjg
-----END PGP SIGNATURE-----

--/UvyDgxjlFfP/4zZ--

