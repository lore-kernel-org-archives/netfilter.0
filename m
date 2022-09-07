From: Tom <tom@foscore.com>
Subject: Re: proper ICMPv6 syntax for specific daddr
Date: Wed, 7 Sep 2022 11:13:16 -0400
Message-ID: <c085f09c-298a-0c85-8e34-515d43531137@foscore.com>
References: <dc512913-d28a-9224-ad5a-e68828975766@foscore.com>
 <YxitNE+Csp6f9n/N@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662563600;
        bh=BxU/HkfFYSJ8ZGz7Ax/fmBnOSqz5CN2W30iqfpsiz3Q=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=uau7uq509bWRg383cW76GfLs/Uu6QqwpYQyXElCN1bCoH+UkghlqWHKodxMmYNyLd
         mCD02wfV0nr8qJJnZ01RXJ35WUGK32SxIYH96WugaL9c1OIWbBzvAJhOVL57JPbcJD
         UqwsrHN+2OMkHpgQC/C+9+NjAubm5VSfx2R+8u2A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662563597;
        bh=BxU/HkfFYSJ8ZGz7Ax/fmBnOSqz5CN2W30iqfpsiz3Q=;
        h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
        b=bgEg5FWIEh+w7bgPkenZAzJM2FpFQkCabteY3dFlIVBVxyjsqI4ChnBtSDUzeQrND
         iWKqbxvdcB4C7ZPxuN0b3Mpfuqm28/gY55YZ/YuwXoPeQZQUWsuuIk9AW9b9DpkqzD
         L0xV4mJv0oUbl+xXr258ObvZtva9ruXLb63xxUvg=
Content-Language: en-US
In-Reply-To: <YxitNE+Csp6f9n/N@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 2022-09-07 10:39, Pablo Neira Ayuso wrote:
> Please, don't use "ip6 nexthdr", this strictly means "check for the
> IPv6 nexthdr field of the IPv6 header", which is not what you might
> need. See:
> https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers#Matching_IPv6_headers
> Instead, use "meta l4proto" which already parses the IPv6 extension
> headers up to the layer 4 header.

OK thanks. WillCo.

> Better use concatenations and sets:
> table ip6 x {
>          set y {
>                  typeof ip6 daddr . meta l4proto
>                  limit rate 5/second
>                  elements = { aaaa:43:a:83::5 . icmpv6 limit rate 5/second,
>                               aaaa:43:a:83::6 . icmpv6 limit rate 5/second }
>          }
>          chain m {
>                  type filter hook prerouting priority filter; policy drop;
>                  ip6 daddr . meta l4proto @y accept
>          }
> }

Worked like a charm. Thanks again.

> Probably, nft -o/--optimize might offer more of these transformations
> in the future.

Good to know!
