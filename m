From: Stephen Frost <sfrost@snowman.net>
Subject: Re: -m recent
Date: Mon, 24 Feb 2003 08:59:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030224135933.GP18261@ns.snowman.net>
References: <3E2FEA1C.9030305@maximum-linux.net> <20030123191505.GL484@ns.snowman.net> <3E301172.101@maximum-linux.net> <20030123224028.GM484@ns.snowman.net> <3E309EFA.4060605@maximum-linux.net> <20030125012940.GN484@ns.snowman.net> <3E398201.3090502@maximum-linux.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J9aX9M0sKuxf6dAJ"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E398201.3090502@maximum-linux.net>
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


--J9aX9M0sKuxf6dAJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* uniplex (uniplex@maximum-linux.net) wrote:
> Stephen Frost wrote:
>=20
> >If you want to install using one of the tarballs I've created it's
> >pretty simple.  Patch your kernel using the patch-o-matic as normal.
> >Then uncompress/untar the tarball you downloaded and copy the
> >ipt_recent.h and ipt_recent.c from the tarball over the ones that now
> >exist in your Linux kernel tree (from the patch-o-matic).  You can also
> >overwrite the libipt_recent.c that is in the extensions directory with
> >the one from the tarball.  Then compile iptables and your kernel as you
> >normally would.
> >
> >	Stephen
>=20
> Thanks Stephen, I got pretty much everything with it working now. I'm=20
> having a little problem with --seconds now
>=20
> --seconds ! 1800 returns an error. so does --seconds \! 1800
>=20
> Am I doing something wrong here?

Did you try ! --seconds 1800?  I havn't had a chance to go back and look
at things, so this is just a thought. :)

	Stephen

--J9aX9M0sKuxf6dAJ
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+WiVFrzgMPqB3kigRAga1AKCNFcRLLjnQXdVb7Ue6HJNEL6V1EACeONgA
nHnBEAVnY2zv5RT4xJDapEo=
=Pie0
-----END PGP SIGNATURE-----

--J9aX9M0sKuxf6dAJ--

