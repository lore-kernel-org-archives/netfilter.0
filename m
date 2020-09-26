From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] sets update concatenation?
Date: Sat, 26 Sep 2020 18:44:00 +0000
Message-ID: <3fcc0be7-b4f8-c17e-96bb-8cef53f375c5@gmx.net>
References: <a629ba84-7c4e-3663-3516-9176d3223965@gmx.net>
 <20200926182145.GA3628@salvia>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601145872;
        bh=LpgbU+QBcA6IZmsG+i0RdxYdEMe7mkhU6pxlJnngp9Y=;
        h=X-UI-Sender-Class:Reply-To:To:References:From:Subject:Date:
         In-Reply-To;
        b=PgjoFaXU9ylZsAQ9FD5nI0eCDH7Qo4f/X2L69Sig1pItqx0u7qvy7KNUdJe/c7qQS
         RHtpdzjfs8hKRQFnmEHaFlfWDPPj7wRkM3do4/C6RiIIWt00QvPoXLSbbUjE4GEoKY
         tOApJuH6Nj5Ftb7u2NOCd1X1mDD6uzPsd53cijm0=
In-Reply-To: <20200926182145.GA3628@salvia>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 26/09/2020 20:21, Pablo Neira Ayuso wrote:
> On Fri, Sep 25, 2020 at 07:10:00PM +0000, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=
=E2=84=A0 wrote:
>> Been trying to concatenate sets update:
>>
>> tcp dport @b_t update @b_sa4 { ip saddr } drop;
>> tcp dport @b_t update @b_sa6 { ip6 saddr } drop;
>>
>> with:
>>
>> tcp dport @b_t update @b_sa4 . @b_sa4 { ip saddr . ip6 saddr } drop;
> What's the intention here?
>
>> but that did not work out. Is somehow possible to concatenate sets upd=
ate?
> Yes, you can do:
>
> tcp dport @b_t update @b_sa4 { ip saddr . ip6 saddr } drop
>
> You can update one single set at a time. Not sure what you expect from
> this concatenating sets instead of keys.

The two mentioned sets are dynamic, learning ip | ip6 saddrs from hits=20
on tcp dport.

The intended concatenation was to put it into one rule instead of two,=20
like if ip saddr then update element in set @b_sa4 and if ip6 saddr then =

update element in set @b_sa6 respectively.



