From: Stephen Frost <sfrost@snowman.net>
Subject: Re: can this be written as one rule ?
Date: Sun, 1 Jul 2007 11:04:05 -0400
Message-ID: <20070701150405.GA4887@tamriel.snowman.net>
References: <4687C1D4.3090704@gatworks.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4687C1D4.3090704@gatworks.com>
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
To: "U. George" <netbeans@gatworks.com>
Cc: netfilter@lists.netfilter.org


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* U. George (netbeans@gatworks.com) wrote:
>> $IPTABLES -t nat -A PREROUTING -i $INET_IFACE -s 121.124.176.0/20 -j DROP
>
> And so on ?

You can (ab)use ipt_recent to do it.  There might be other ways but the
gist of it would be to build an ipt_recent table with those addresses at
boot and then reference it using an --rcheck or similar.

	Enjoy,

		Stephen

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFGh8JlrzgMPqB3kigRAve3AKCYhjpzw5P1wmsgSPUDQGXLSRmvpgCcCTJc
Bs0gGK3TiWba7e5lJX0pHmc=
=ZNPr
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

