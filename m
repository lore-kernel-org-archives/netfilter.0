From: Stephen Frost <sfrost@snowman.net>
Subject: Re: ipt_recent 0.2.3/0.2.7 --rttl doesn't work
Date: Tue, 4 Feb 2003 21:53:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030205025346.GC484@ns.snowman.net>
References: <F130IeK7IiGUpNfpjAn0000c4a5@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FIfSo9pyi3Jhph90"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F130IeK7IiGUpNfpjAn0000c4a5@hotmail.com>
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


--FIfSo9pyi3Jhph90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* per j (perj8@hotmail.com) wrote:
> I'm using vanilla kernel 2.0.43 with patches from patch-o-matic CVS=20
> (Jan24,2003), openmosix, super-freeS/WAN, ipt_recent 0.2.7=20
> (ipt_recent-0.2.6.tar.gz).  And netfilter stuff all built as modules.

  You're using 2.0.43?  iptables was introduced in 2.4...=20

> Here are the rules in my iptables 1.2.7a:
> INPUT chain (default DROP):
> -j ACCEPT -i ppp0 --state ESTABLISHED,RELATED
> -j DROP -i ppp0 -m recent --update --rttl --name recentDropBox
> -j LOG -i ppp0 --log-prefix recentDropBox -m limit
> -j DROP -i ppp0 -m recent --set --name recentDropBox

  First you might try adding --rttl to the --set line.  I'll also go
  back and check my code in that area...  Using the latest ipt_recent,
  can you paste what you see in /proc/net/ipt_recent/recentDropBox?

  There could certainly be a problem in that area as the TTL match has
  been tested less...

  	Stephen

--FIfSo9pyi3Jhph90
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+QHy5rzgMPqB3kigRAlkcAJ0bcBusds0252+Mvzu0jWsbWuxwbwCfVPQ7
PDSpfk5R+4Is36WMb/fZEqs=
=Imj7
-----END PGP SIGNATURE-----

--FIfSo9pyi3Jhph90--

