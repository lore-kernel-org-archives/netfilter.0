From: Stephen Frost <sfrost@snowman.net>
Subject: Re: Hashing iptables rules for improved peformance?
Date: Mon, 21 Apr 2003 14:31:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030421183102.GC8524@ns.snowman.net>
References: <Pine.LNX.4.44.0304211022100.7357-100000@252.1.168.192.in-addr.arpa>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0304211022100.7357-100000@252.1.168.192.in-addr.arpa>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Mike Ireton <mike-netfilter@tiedyenetworks.com>
Cc: netfilter@lists.netfilter.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Mike Ireton (mike-netfilter@tiedyenetworks.com) wrote:
> My question for the iptables hackers is - am I being silly by trying to=
=20
> peform accounting this way, and does netfilter already implement effecien=
t=20
> internal hashing that destroys my presumption about a long list of rules=
=20
> resulting in linear table lookups? I would assume that netfilter does has=
h=20
> where it can, but filtering rules have a second key to worry about -=20
> namely, their order in the list is relevent, which makes me think=20
> netfilter would have to do the linear lookup.

As it turns out you're not alone in wanting to do things along those
lines.  Someone actually modified my ipt_recent module to track
accounting information per-IP address.  There's a 'new' ippool out there
for which a mini-module which did this could probably be written.  I'm
afraid the existing iptables setup would be slow if you tried to do it
in the way you're describing, especially since you'd have to do it for
every packet.

What's your time frame for needing something?

	Stephen

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+pDjmrzgMPqB3kigRAh56AJwPsUKpRNo+CwMZqVI/Vvh8gk3CmwCgmIOT
KvUAF5XO+6E3xZMf7sr9NEg=
=M73a
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--

