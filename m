From: Athan <netfilter@miggy.org>
Subject: Re: SMTP external
Date: Thu, 2 Jan 2003 23:44:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030102234447.GA11431@miggy.org>
References: <20ED00AA0BC135449469D6EF0AE79C970FAB@ozlan.fcdomain.net> <00c801c2b2b7$23ccf870$6301a8c0@VAIO>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="X1bOJ3K7DJ5YkBrT"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <00c801c2b2b7$23ccf870$6301a8c0@VAIO>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--X1bOJ3K7DJ5YkBrT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2003 at 04:31:51PM -0700, Linux wrote:
> Before doing this, make sure you are not an open relay

   Of course to be SURE he's not an open relay he'll have to open the
port up to test it from !localhost/network ;).

	iptables -A INPUT -m state --state NEW,ESTABLISHED -p tcp
	--sport 25
	iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -p tcp
	--dport 25

Untested, off the top of my head, but should do the job.

-Ath
--=20
- Athanasius =3D Athanasius(at)miggy.org / http://www.miggy.org/
                  Finger athan(at)fysh.org for PGP key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME

--X1bOJ3K7DJ5YkBrT
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj4Uzu8ACgkQzbc+I5XfxKeIXACgjVj/d06iA+7sqEFBJVraKZ/n
btQAn2yyFSkAJ12wLtQ8K1fs11M7n8ih
=rzlC
-----END PGP SIGNATURE-----

--X1bOJ3K7DJ5YkBrT--

