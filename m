From: Stephen Frost <sfrost@snowman.net>
Subject: Re: -m recent
Date: Thu, 23 Jan 2003 14:15:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030123191505.GL484@ns.snowman.net>
References: <3E2FEA1C.9030305@maximum-linux.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TakKZr9L6Hm6aLOc"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E2FEA1C.9030305@maximum-linux.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: uniplex <uniplex@maximum-linux.net>
Cc: netfilter@lists.netfilter.org


--TakKZr9L6Hm6aLOc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* uniplex (uniplex@maximum-linux.net) wrote:
> Has anyone here had any luck with this?

It works for me and I use it, though, well, I wrote it too, so.. :)

> It's logging the ip and ttl etc etc in the file it's supposed to, but=20
> the --update -j DROP rule I'm using doesn't seem to have any effect.
>=20
> Here's a snip of rules from my script that I've been using to test with.=
=20
> I've put them in the same order as they appear in the script. It's not=20
> the entire script(of coarse) and I'm matching to icmp packets just to=20
> test with.
>=20
> iptables -A INPUT -i eth0 -p all -m recent --name icmps --update -j DROP
>=20
> iptables -N icmps
> iptables -A INPUT -i eth0 -p icmp -j icmps
> iptables -A icmps -m recent --name icmps --set -j DROP
> iptables -A icmps -j DROP

This looks good to me..  Can you tell me what version of ipt_recent
you're using?  An old version had a bug where the --name only worked
when it was the last option, that may be the problem.

	Stephen

--TakKZr9L6Hm6aLOc
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+MD85rzgMPqB3kigRArHdAJ4kwd45mLyGUgYVafKsqwfa9B877gCdF2G0
CnDyPnLX0WoHB2DH0xYyhxo=
=grY7
-----END PGP SIGNATURE-----

--TakKZr9L6Hm6aLOc--

