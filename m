From: Ben Gamari <ben@smart-cactus.org>
Subject: Minor language issues in documentation
Date: Tue, 16 Sep 2014 12:56:24 -0400
Message-ID: <87vbon33nr.fsf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.smart-cactus.org; s=mail; t=1410886434;
	bh=DkeVEonGOEs5UNnwdto7xr5Vhk8PuktRFcdmT9DERK8=;
	h=From:To:Subject:Date:From;
	b=HLmYaJ6S6/ddskpA/PWtbi3v+O/RvvQHsP0erhq2P3Aav9lJv07IDKUToRaBM0ziY
	 gpZRA2l7qCn7X+xAA6hdOhHtErWndNkYIpdu47rEOqr0nuck/3Yfmz/a+3Q3vF8KnP
	 L+wAeWcp00u6Mqj+SUGev/L7kvQvPgnT69NcVZ14=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

--=-=-=
Content-Type: text/plain


Hello all,

While browsing the nftables documentation I noticed that the word
"performance" is often misused in a variety of ways. For instance,
on the main page[1],

    Fast lookups through performance data structures: The new syntax
    allows you to arrange you rule-set in a very performance way
    contrary to purely linear-list based filtering policies.

The use in the first sentence might be acceptable as a colloquialism but
really could be improved by replacing "performance" with "high
performance".

The second sentence is a bit more serious as it uses "performance", a
noun, as an adjective. You might consider replacing this with
"performance-oriented" or a similar rewrite. I've found this same
mix-up in a few other places as well[2].

I also noticed a couple other small issues,

  * [3] misspells "hybrid"
  * The "Basic operational" section of the documentation ToC would be
    named "Basic operation"

Otherwise thanks for the great packet mangling framework and thorough
documentation!

Cheers,

- Ben


[1] http://www.netfilter.org/projects/nftables/
[2] http://wiki.nftables.org/wiki-nftables/index.php/Main_differences_with_iptables
[3] http://wiki.nftables.org/wiki-nftables/index.php/Configuring_tables

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJUGGu5AAoJEErkyLZmeNiDXhQIAI2Cl+GCbYazzJLCRJlHMdDr
NU7JM2dvh0WHZZ8rbRfpaDM0ElAWPVH9wYQNJkyY5ghlfsNEU27M5M5M+8Cav8lO
z6fafAy/XJGAmc4y3McfLlHf5pxMd1Ab7ryPtUoG2ISiZSJxYBhq2HdY5iUTmxCm
QjnpMToGOfEwPxzaPGeW5QgRfyi8kBI+MF+32IpaG5dvZhOfMO6RdNghy/gb2PN6
WxRJ4xqM30Ip33ihekFh1rYklnTJlujpwzfJ4IQ9C4VMN82OQXlU/Z9Cv7SO4tUx
bD5EVlvpB3Lfc1oZoEYF2q8ZR0nGwRP+ag5NP7KAknIBGTBFrabgmyqHJxKEEeM=
=Bl8s
-----END PGP SIGNATURE-----
--=-=-=--
