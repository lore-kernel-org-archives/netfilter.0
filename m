From: Simon Loewen <simon@simonloewen.com>
Subject: drop all out going SMTP connection bar two
Date: Tue, 01 Aug 2006 18:50:42 -0400
Message-ID: <44CFDAC2.6010601@simonloewen.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512



Hi,

I would like to drop all out going SMTP connections through our router
except smtp1.internal and smtp2.internal on all of the outbound
interfaces.  I would like to filter on the destination port 25.

Would this be easy to do?

Thanks for any advise,
S.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQFEz9rCkcP1ZXUvpGURCrZ7AJ4haVmH4Hypjq6LjgBFRNFav6EQ1QCgkMkk
m4I4NLc3u12NXg2cOwdrCxE=
=kQ8+
-----END PGP SIGNATURE-----


