From: =?UTF-8?B?TWFsdGUgU2NocsO2ZGVy?= <MalteSch@gmx.de>
Subject: IPv6 stateful in kernel 2.6.15 & nf_conntrack ?
Date: Wed, 04 Jan 2006 21:06:37 +0100
Message-ID: <43BC2ACD.6070904@gmx.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello,
I am trying to figure out how to do ipv6 stateful inspection with the
new kernel 2.6.15. Currently I am using the patch from USAGI for 2.6.14
but they seem to have dropped the state-match in their patch for 2.6.15.

Is there stateful inspection in 2.6.15 for ipv6 (there is connection
tracking ...) and how could I use it?

Thanks for help

Please CC me since I am not subscribed to this list.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (MingW32)
Comment: GnuPT 2.6.2.1 by EQUIPMENTE.DE
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFDvCrN4q3E2oMjYtURAsGvAJ9SBOCNlE1Yxymbeo8HCk0rK0ekkwCeI7y9
ltVw2q8etJ3W4YETkNJsDxs=
=hnKZ
-----END PGP SIGNATURE-----

