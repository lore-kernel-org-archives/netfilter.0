From: Stephen Frost <sfrost@snowman.net>
Subject: Re: -m recent
Date: Fri, 24 Jan 2003 20:29:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030125012940.GN484@ns.snowman.net>
References: <3E2FEA1C.9030305@maximum-linux.net> <20030123191505.GL484@ns.snowman.net> <3E301172.101@maximum-linux.net> <20030123224028.GM484@ns.snowman.net> <3E309EFA.4060605@maximum-linux.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E309EFA.4060605@maximum-linux.net>
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
Cc: netfilter <netfilter@lists.netfilter.org>


--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* uniplex (uniplex@maximum-linux.net) wrote:
> Congrats! :)

Thanks. :)

> I found this in dmesg
>=20
> ipt_recent v0.2.3: Stephen Frost <sfrost@snowman.net>.=20
> http://snowman.net/projects/ipt_recent/

Ok, yeah, that's a kind of old one.  I think you should try 0.2.6,
honestly.

> Do you know where I can find a guide or howto for installing your patch?=
=20
> I'm not to swoft with those types of things, I've used patch and diff=20
> only one time that I can remember.

If you want to install using one of the tarballs I've created it's
pretty simple.  Patch your kernel using the patch-o-matic as normal.
Then uncompress/untar the tarball you downloaded and copy the
ipt_recent.h and ipt_recent.c from the tarball over the ones that now
exist in your Linux kernel tree (from the patch-o-matic).  You can also
overwrite the libipt_recent.c that is in the extensions directory with
the one from the tarball.  Then compile iptables and your kernel as you
normally would.

	Stephen

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+MeiErzgMPqB3kigRAp4jAJ97BWdImEbI9N3rqO2UW+SZgPWh8wCeJoV5
YxptckCTQbbFNo+CoJ3XtnU=
=gyt+
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--

