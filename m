From: Mason Schmitt <mason.schmitt@sunwave.net>
Subject: rewriting destination port of outbound packets
Date: Thu, 10 Mar 2005 11:20:10 -0800
Message-ID: <42309DEA.4040308@sunwave.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Hash: SHA1

I am attempting to configure a Linux box (mandrake 10.1 - iptables
1.2.9) to redirect http, ftp, real, winmedia, quicktime, and nntp to a
Netapp NetCache transparent caching proxy.

Here is my network layout:

~       Net
~        |
~  Linux router/fw
~        |
- ------switch-------
|             |
clients     cache

Starting first with http, I have made use of fwmark and iproute2 to
first mark traffic from our network to destination port 80 and then
route that traffic, out the same interface it came in on, to the web
cache.  The problem I am trying to resolve is that the traffic that I am
routing to the cache still has the  destination port 80.  I think this
needs to be 3128 (The cache accepts connections on port 3128).

So, is it possible to rewrite the destination port in this scenario?

- --
Mason Schmitt
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFCMJ3qbip6upg8pq8RAomJAKCVqlt6m45/Ib/mBX5SSTH/7aqVegCgj8Y1
4bV9hrjcqvqXxRv3jA2Vqt4=
=uNK8
-----END PGP SIGNATURE-----

