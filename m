From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: mangle + TCP Flags
Date: Thu, 11 Dec 2003 09:06:08 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031211170608.GA13784@home.tig-grr.com>
References: <20031210110849.7d0cd782.jm.orset@laposte.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20031210110849.7d0cd782.jm.orset@laposte.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jean-Marie <jm.orset@laposte.net>
Cc: netfilter@lists.netfilter.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yes, but I don't know of any TCPFLAG module.  You might have to write your
own.  I wrote one because I couldn't find one -- if you can find one, please
let me know.  ;-)

On Wed, Dec 10, 2003 at 11:08:49AM +0100, Jean-Marie wrote:
> Hello, can someone tell me if it is possible, thanks to the mangle table,=
 to modify the flags of a TCP packet before it is routed.
> I think to something like that:
> iptables -t mangle -A INPUT -j TCPFLAG --set-flags FIN,URG
> Thank you.

--=20
"Copyright laws are only tolerated because they are not enforced against the
large number of petty offenders."
        -- Alastair Kelman, University of Cambridge, 1997

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj/YpAAACgkQFMm9uvwPXW5BZACdFtPSyXdhdgXYYdVD1qnXSa76
Jm4An2m2RLpgACZ9AoUq2PxX18UEuVZw
=DtyI
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--

