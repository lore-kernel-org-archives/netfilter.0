From: Harald Welte <laforge@netfilter.org>
Subject: Re: Dummy interfaces
Date: Sun, 29 Feb 2004 21:47:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040229204750.GM15558@sunbeam.de.gnumonks.org>
References: <200402291915.i1TJFL0Y079287@gate.lianet.ru>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vvRocJ6whMXXNc9q"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200402291915.i1TJFL0Y079287@gate.lianet.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Serge Druzhinin <drserge@nexter.ru>
Cc: Netfilter Mailinglist <netfilter@lists.netfilter.org>


--vvRocJ6whMXXNc9q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 29, 2004 at 10:15:16PM +0300, Serge Druzhinin wrote:
> As I know, loopback interface also don't really exist. But I can match it=
 in
> rules. dummy0 (for example) interface is not rejected by iptables as
> parameter for  -i or -o, but rule never matches.

No, it is not rejected because iptables has no way what interface name
might be valid or not (nobody forces you to call your dummy inteface
dummyX.  This is common practise, maybe even policy, but not
implementation).

> If you have some time to discuss this situation, please take a look to
> following:

This is not a valid use of an interface.  A 'dummy' interface can never
be treated as a real interface.  you won't be able to attach a tc qdisc
or do any other advanced networking stuff eithe.r

=20

--=20
- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  "Fragmentation is like classful addressing -- an interesting early
   architectural error that shows how much experimentation was going
   on while IP was being designed."                    -- Paul Vixie

--vvRocJ6whMXXNc9q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAQk/2XaXGVTD0i/8RAkgeAKCIhm+DMKW18PEIKWAB0n/c5tdsOACgmb7i
7VD9uif7MLkCyq+ywOrq2LY=
=W0bT
-----END PGP SIGNATURE-----

--vvRocJ6whMXXNc9q--

