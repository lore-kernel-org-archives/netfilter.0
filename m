From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: String Replace
Date: Thu, 18 Mar 2004 06:13:37 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040318141337.GB13069@home.tig-grr.com>
References: <810BC538117E9F4E9BB152E0C100DF1F0A5422@farmer.vikus.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IiVenqGWf+H9Y6IX"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F0A5422@farmer.vikus.net>
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


--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Wed, Mar 17, 2004 at 02:58:24PM -0500, Patrick Ahler wrote:
> UDP protocol (port 53), DNS

Oh boy.  DNS is particularly fun to muck around with.  The "message
compression" scheme (see RFC 1035 4.1.4) makes it very complex to properly
change resolver packets.  I started writing a pair of resolver modules when
Verisign implemented their "site finder" abomination, but abandoned the
project when they discontinued it.  If there is interest, perhaps I can pick
up the project again.

--=20
"The idea that Bill Gates has appeared like a knight in shining armour to
lead all customers out of a mire of technological chaos neatly ignores the
fact that it was he who, by peddling second-rate technology, led them into
it in the first place."
        -- writer Douglas Adams, on Windows 95

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkBZrpEACgkQFMm9uvwPXW6v3QCfcvmQ3cmGzeGTugqWhfUH1mcI
OnMAnRCVm17IbWCrIOyphAydzKMq88p6
=LwOE
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--

