From: Tom <tom@foscore.com>
Subject: Re: Fwd: proper ICMPv6 syntax for specific daddr
Date: Thu, 8 Sep 2022 11:43:01 -0400
Message-ID: <59f82048-3991-2c4e-515b-4bccb24cdb98@foscore.com>
References: <dea61421-4ce1-bb68-2a74-88b6f42c299e@foscore.com>
 <22a53086-4479-c142-6415-06e1e42ebeca@foscore.com> <YxoGhE3IGFzehyo0@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662651784;
        bh=rzhB1mtkIecbiA3xqwg/qiJF9Tdgu1FjK4FmtqvYa2s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=wdDj1GBpULCBseMRquRp7hvBKcQmSt/gK8B1tSv2yq0yviF2TTN3zO9fdF1yjNEZE
         nQT7PdH93+dtSwbnY5wOmEr500fFHhwXT5MSoMRyugtBhrdH6sCh4uP0WHGcgrgKnz
         AU2J9V6d3whNLwkobRBPpMxVKiuNxheuXxmjQlHg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foscore.com;
        s=deliv; t=1662651782;
        bh=rzhB1mtkIecbiA3xqwg/qiJF9Tdgu1FjK4FmtqvYa2s=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ALvw8GDXh5GJl3aePojmSHNha4WiSF5h8k2RJ0j4b9dK2/qCfn6oZAN4AJe7m2IwU
         GkpvBWJsZWGO/yR1Kn83vKtuIdiCT9SJv0K2mJ7maFl2SbQdyRfpi57Ou3cevCOUU4
         DzdVYBjNp+duWcwkYkd7oo69k0iKpwiWiYERpWTs=
Content-Language: en-US
In-Reply-To: <YxoGhE3IGFzehyo0@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On 2022-09-08 11:13, Pablo Neira Ayuso wrote:
> you removed the limit line in the set declaration ?

Yes, after I failed to get the right syntax to combine it with the ICMP type.

> If you would like to throttle icmpv6 echo-request, the::
> 
> table ip6 filter {
>          set ping6 {
>                  typeof ip6 daddr . icmpv6 type
>                  limit rate 5/second
>                  elements = { aaaa:43:a:83::2 . echo-request,
>                               aaaa:43:a:83::3 . echo-request,
>                               aaaa:43:a:83::4 . echo-request }
>          }
>          chain input {
>                  type filter hook input priority filter; policy drop;
>                  ip6 daddr . icmpv6 type @ping6 accept
>          }
> }

Thanks. I wouldn't have found that syntax in a quintillion years.

> Please, see the wiki for more examples on concatenations and sets/maps.

I've gone through it. As someone who's been programming and configuring computers for over forty years, I can tell you that the wiki documentation is not good. It seems to be written by and for nft developers.
