From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nftables: How to filter only ipv6 SSH traffic in an inet table?
Date: Wed, 7 Feb 2018 11:32:51 +1100
Message-ID: <20180207003251.GA2621@dimstar.local.net>
References: <20180206172809.f7a238e06cef71d52ec92ae0@bluenox07.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180206172809.f7a238e06cef71d52ec92ae0@bluenox07.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Tue, Feb 06, 2018 at 05:28:09PM +0100, Merlin B=FCge wrote:
> Hey all,
>
> I'm playing around with nftables and wonder how I could filter e.g.
> only ipv6 SSH traffic in an inet table?
>
> I've set up a basic inet filter table with the three chains input,
> forward and output.
>
> When I then do:
>
> "nft add rule inet filter input ip6 nexthdr tcp tcp dport ssh drop"
>
> ... "nft list ruleset" is showing my only "tcp dport ssh drop", so it
> seems the ipv6 bit got missed. I also tried:
>
> "nft add rule inet filter input meta nfproto ipv6 tcp dport ssh drop"
>
> ... but it yields to the same output.
>
> What am I doing wrong here?
>
> Note that I'm not wanting to actually drop IPv6 SSH traffic, I'm just
> trying to get used to nftables :)
>
> I'm using nftables v0.8.2 on an up-to-date archlinux.
>
> Any pointer appreciated!
>
> Thanks!
> --
> Merlin B=FCge <toni@bluenox07.de>

Hi Merlin,

Could you possibly post all of the output from nft list ruleset?

That would give us some context around the one-liner,

Cheers ... Duncan.
