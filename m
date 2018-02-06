From: Merlin =?ISO-8859-1?Q?B=FCge?= <toni@bluenox07.de>
Subject: nftables: How to filter only ipv6 SSH traffic in an inet table?
Date: Tue, 6 Feb 2018 17:28:09 +0100
Message-ID: <20180206172809.f7a238e06cef71d52ec92ae0@bluenox07.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hey all,

I'm playing around with nftables and wonder how I could filter e.g.
only ipv6 SSH traffic in an inet table?

I've set up a basic inet filter table with the three chains input,
forward and output.

When I then do:

"nft add rule inet filter input ip6 nexthdr tcp tcp dport ssh drop"

... "nft list ruleset" is showing my only "tcp dport ssh drop", so it
seems the ipv6 bit got missed. I also tried:

"nft add rule inet filter input meta nfproto ipv6 tcp dport ssh drop"

... but it yields to the same output.

What am I doing wrong here?

Note that I'm not wanting to actually drop IPv6 SSH traffic, I'm just
trying to get used to nftables :)

I'm using nftables v0.8.2 on an up-to-date archlinux.

Any pointer appreciated!

Thanks!
--=20
Merlin B=FCge <toni@bluenox07.de>
