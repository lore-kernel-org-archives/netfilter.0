From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] logging protocols in inet
 family table require explicit protocol statement?
Date: Wed, 5 Feb 2020 15:01:49 +0000
Message-ID: <6a254067-bad5-4a72-25f3-a14ded823097@gmx.net>
References: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
 <20200205142935.GG26952@breakpoint.cc>
 <03b849bc-48f3-0e47-2d94-47b2a74f988a@gmx.net>
 <20200205144833.GH26952@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580914910;
        bh=qYmrM/oiKWi2h2bqHFqmX/vlM3jXQx80AwimOE9htjY=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=ANsJVVHwjg1HWuDQax540lCqbq7nsn/d3YTFsD3gnrTxCbHIGzHy/yiV7ZzpBx0Tv
         sLU54kgGVQs9iPtbdiCvGZqPlLFDByOUfUvet9bZ4rnaao2XAXiFxxeNBlognTG6AM
         5wjZNEuBPbNoVhnle35wAKXmIkVeXZMoqFR+h/qc=
In-Reply-To: <20200205144833.GH26952@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On 05/02/2020 14:48, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> On 05/02/2020 14:29, Florian Westphal wrote:
>>> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>>>> Having perused the WIKI [1] I tried to get protocol specific logging=
 going,
>>>> but ended up with
>>>>
>>>> * tcp log -> Error: syntax error, unexpected log
>>>> * icmpv6 log -> Error: syntax error, unexpected log
>>>>
>>>> Only with an explicit protocol statement logging works
>>>>
>>>> * ip protocol tcp log
>>>> * ip6 nexthdr=C2=A0 icmpv6 log
>>> You mean "log" doesn't work?  (no "tcp" prefix).
>> Yes, logging does not work with
>>
>> icmpv6 log
>>
>> and throws the error, whilst
>>
>> ip6 nexthdr icmpv6 log
>>
>> works and does not exhibit the error, similar with tcp | udp.
>>
>> For package filtering it is however not necessary to make such explici=
t ip
>> protocol | ip6 nexthdr statements. And since there is no mention of su=
ch
>> (explicit) requirement in the WIKI I raised the question here because =
I find
>> it inexplicable that filtering does work one way and logging another w=
ay.
> Not following. "log" is a single statement, it has no prefix keyword.
> Why would it be special?
>
> It works just like everyting else.
> If you want to log just tcp (regardless of ipv4 or ipv6), then use
> "meta l4proto tcp log"
>
> in the inet family.  "meta l4proto" gives next header protocol after
> the ip or ipv6 header.  In case of ipv6, it will skip extension headers=
,
> if any.

Citing an example from the WIKI

nft add rule filter input tcp dport 22 ct state new log prefix \"New SSH =

connection: \" accept

there is no "ip protocol" stipulated. And neither does it throw an error =

and it works as expected (described in the WIKI)

Trying something similar in the inet table

nft add rule inet filter input tcp log

throws

Error: syntax error, unexpected log

However,

* nft add rule inet filter input ip protocol tcp log
* nft add rule inet filter input ip6 nexthdr=C2=A0 icmpv6 log

neither throws an error. Hope that makes it clear.



