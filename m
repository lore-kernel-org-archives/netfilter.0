From: Husnu Demir <hdemir@metu.edu.tr>
Subject: is it a BUG?
Date: Thu, 03 Oct 2013 15:42:20 +0300
Message-ID: <524D662C.30301@metu.edu.tr>
Reply-To: hdemir@metu.edu.tr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Today I found that mistakenly I have wrote VLAN5 instead of vlan5 for
the interface name in iptables. And found out that capital letter is
not same with small letters :) When I think as *nix user it is correct
but somehow I didnot think about that. So CASE is important for iptables.






Interesting.

Best Regards,

Husnu Demir.
Network.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJSTWYsAAoJEISpBAM51qlEtkAH/1xyHDvKHQFFgcja2BAqbYgc
khv+/XHjeWomKSZQGiTwo4x4BPmS6nvQ9tuw8Q8i0u7MXZp9esZ+fneWoe+cwglO
rtiHgsfRN/99lkVupQIuyf0FTm727jL3uQDIXqfMHCBZF+r6hbxZiZsFRZJ2mexG
h0thG7G3B3OBfHPldSx0Ura6qmVkP6PQoRcwHtl2LwCO520AbXV1hYyIeXSYfqNR
MB4IzGz4hpwpSkO4z3C3BYL3fDjJSSIqTYAfmsvdH5u7BomSK551TGIU8Rl1mjbP
1u3EfBQDW4L4hLxmIX8C2IAQOK9KxPb1CTYq1XfoYsFH+mK2uk88JI7C1/ITdHQ=
=MWFJ
-----END PGP SIGNATURE-----
