From: Stephen Frost <sfrost@snowman.net>
Subject: Re: ipt_recent 0.2.3/0.2.7 --rttl still doesn't work
Date: Sun, 2 Mar 2003 13:00:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030302180047.GL3989@ns.snowman.net>
References: <F1152nIAu1pzLEwbHzv0002d362@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tv2SIFopg1r47n4a"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F1152nIAu1pzLEwbHzv0002d362@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: per j <perj8@hotmail.com>
Cc: netfilter@lists.netfilter.org


--tv2SIFopg1r47n4a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* per j (perj8@hotmail.com) wrote:
> Have you got any luck fixing the --rttl bug?   It's already been a couple=
=20
> weeks since the last post.  I tried to go around this problem with no=20
> success.  I don't want to put all my rules into one chain, the INPUT chai=
n,=20
> to get it to work and prefer separate chains to make my firewall rules=20
> easier to maintain.  Apparently --rttl doesn't work when --set is on a=20
> different chain on the filter table.  That's the problem.

Ok, coming back to this issue I'm pretty sure I have an idea as to what
the problem is.  It's pretty simple, really, the TTL is going to change
somewhere while in the kernel.  Probably in the routing logic.  This
means that in PREROUTING the TTL is one thing but in FORWARD (after
being routed) it's been decremented by one.

The 'solution' to this problem would really be for the recent module to
always go with the initial TTL and detect if the routing logic has been
called or not to decide if it needs to increment the TTL to get back to
the original TTL.  Unfortunately at the moment I'm not sure if that will
be very easy or not but I'll look around and see if I can't make this
work.

	Stephen

--tv2SIFopg1r47n4a
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+YkbPrzgMPqB3kigRAsC1AKCOcQNvF43Dd/AoiVy33oFTTskrPACePNpN
DFQqtA91b4UuQLfNv0rIuIg=
=OQ3h
-----END PGP SIGNATURE-----

--tv2SIFopg1r47n4a--

