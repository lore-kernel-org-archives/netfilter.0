From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: How to block only MX query made to DNS server
Date: Sat, 27 Nov 2004 23:40:47 -0800
Message-ID: <20041128074047.GA12810@home.tig-grr.com>
References: <20041127095139.46240.qmail@web12308.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041127095139.46240.qmail@web12308.mail.yahoo.com>
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
To: pravin rane <pgr_80@yahoo.com>
Cc: netfilter@lists.netfilter.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I want to block DNS MX query made through my network.
> What iptables rule I should use.

I'll give you source to a _really_ alpha version dns match, but it's pretty
much untested and unused right now.  I wrote it when verisign did their
stupid root wildcard trick.  Since they backed down, I haven't had any
reason to continue development.  It's not going to be of use unless you are
willing to put some time into debugging and testing.

--=20
The hardest thing in the world to understand is the income tax.
        -- Albert Einstein

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkGpgP8ACgkQFMm9uvwPXW4jEwCdEQaH9SUReoQ55cALE+CifsAO
+koAn3LLe7/IarFJ/ys//kNFtrTK2I/o
=HpTG
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

