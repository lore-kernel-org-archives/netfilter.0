From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 07:28:11 -0800
Message-ID: <20050112152811.GA28242@home.tig-grr.com>
References: <1105537635.3751.22.camel@hubcap.ljm.dom>
	<20050112151142.79460.qmail@web26102.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050112151142.79460.qmail@web26102.mail.ukl.yahoo.com>
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
To: Roland Kaeser <roli8200@yahoo.de>
Cc: netfilter@lists.netfilter.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I JUST WANT TO RUN THE IPT_STRING ON A KERNEL 2.6.

Jason is correct, IPT_STRING is a toy and should not be used for filtering
packets on a firewall in an enterprise setup.  What happens to your
IPT_STRING match when someone sends TCP packets one byte at a time?

A transparent proxy with a userspace application level filter is likely a
better choice.

--=20
If you have received this email in error, you are required to shred it
immediately, add some nutmeg, three egg whites and a dessertspoonful of
caster sugar.  Whisk until soft peaks form, then place in a warm oven for 40
minutes.  Remove promptly and let stand for 2 hours before adding some
decorative kiwi fruit and cream.  Then notify me immediately by return email
and eat the original message.

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAkHlQgsACgkQFMm9uvwPXW6f1gCgkbsHriSOBhI5l107ppj0cRvG
RKsAnRohonOPOXQISSix1YAVtafZ/8ZM
=Iba3
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--

