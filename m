From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Doing Bridge with firewalling
Date: Wed, 1 Jan 2003 10:08:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030101150801.GR677@ns>
References: <20021231205417.GQ677@ns> <001001c2b113$e2181800$0100a8c0@zultys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zBPbvmIlJjvpbu6L"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001001c2b113$e2181800$0100a8c0@zultys.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ranjeet Shetye <ranjeet.shetye@zultys.com>
Cc: netfilter@lists.netfilter.org


--zBPbvmIlJjvpbu6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Ranjeet Shetye (ranjeet.shetye@zultys.com) wrote:
> I think I got it right :D.

Unfortunately not quite.

> Hence when you downsize your (layer 3) router into a (layer 2) bridge,
> your neo-bridge becomes a layer 2 entity and disappears from the layer 3
> i.e. it is no longer visible at layer 3. Therefore no firewalling, no
> NAT.

See, this isn't entirely correct.  A bridge passes around ethernet
frames, yes, *but* that does *NOT* mean that it can't modify those
frames.  It can, in fact, modify those frames for NATing purposes.
It can also do full state-based firewalling by watching the frames go by
and doing exactly what netfilter does today.

There's also an eptables or some such out there for filtering based on
raw ethernet frames but basically everything in iptables will work too
with the right patches.  The only thing that won't is MASQ because your
ethernet interfaces don't have an IP address for MASQ to use, *however*,
you *CAN* to SNAT/DNAT/etc.

	Stephen

--zBPbvmIlJjvpbu6L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+EwRRrzgMPqB3kigRAk0tAKCbnMa0oZcEr8RMj4QD+QAIsDkJ3ACfXEvP
zw8LtraUQvLFl5Of8GhK3E0=
=1Gue
-----END PGP SIGNATURE-----

--zBPbvmIlJjvpbu6L--

