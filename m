From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: is it a BUG?
Date: Thu, 03 Oct 2013 15:04:40 +0200
Message-ID: <524D6B68.4050100@saasplaza.com>
References: <524D662C.30301@metu.edu.tr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <524D662C.30301@metu.edu.tr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "hdemir@metu.edu.tr" <hdemir@metu.edu.tr>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Too me personally case sensitivity is exactly the (default) behaviour 
that I would expect in *nix and also in iptables.

On 10/03/2013 02:42 PM, Husnu Demir wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> Today I found that mistakenly I have wrote VLAN5 instead of vlan5 for
> the interface name in iptables. And found out that capital letter is
> not same with small letters :) When I think as *nix user it is correct
> but somehow I didnot think about that. So CASE is important for iptables.
>
>
>
>
>
>
> Interesting.
>
> Best Regards,
>
> Husnu Demir.
> Network.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/
>
> iQEcBAEBAgAGBQJSTWYsAAoJEISpBAM51qlEtkAH/1xyHDvKHQFFgcja2BAqbYgc
> khv+/XHjeWomKSZQGiTwo4x4BPmS6nvQ9tuw8Q8i0u7MXZp9esZ+fneWoe+cwglO
> rtiHgsfRN/99lkVupQIuyf0FTm727jL3uQDIXqfMHCBZF+r6hbxZiZsFRZJ2mexG
> h0thG7G3B3OBfHPldSx0Ura6qmVkP6PQoRcwHtl2LwCO520AbXV1hYyIeXSYfqNR
> MB4IzGz4hpwpSkO4z3C3BYL3fDjJSSIqTYAfmsvdH5u7BomSK551TGIU8Rl1mjbP
> 1u3EfBQDW4L4hLxmIX8C2IAQOK9KxPb1CTYq1XfoYsFH+mK2uk88JI7C1/ITdHQ=
> =MWFJ
> -----END PGP SIGNATURE-----
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

