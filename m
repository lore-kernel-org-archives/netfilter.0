From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] icmp type rate limiting - cumulative for the daddr or
 selectively per saddr?
Date: Tue, 29 Sep 2020 16:13:00 +0000
Message-ID: <49153cdf-da9d-c560-d46d-78b61f3783ec@gmx.net>
References: <407b6fc3-1986-6453-9f68-a066b3ad1974@gmx.net>
 <20200929144627.GB20140@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601395989;
        bh=F0AKw/1ID6FABYuqQE2g2kwCH7Sn/rWTQEmyfaNZb0w=;
        h=X-UI-Sender-Class:Reply-To:To:Cc:References:From:Subject:Date:
         In-Reply-To;
        b=dqG1h20JgSyRp3EYn2kkh+J5qOCbIXVnO5YsTmaNDGqQam468dps8mNPc7/02fqd/
         +e0XpO5DD1rh5/CHkyU3EBVd6WW5tP4wiO4HmTpJYhNi6FlosZD7ClW11tt3RzrdZL
         UjlYeKn7DeVSVqvfwEH9KwTzpjeo7ZWeda66H3TI=
In-Reply-To: <20200929144627.GB20140@breakpoint.cc>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: Florian Westphal <fw@strlen.de>

On 29/09/2020 16:46, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchi=
ngs is
>> not clear whether the 'limit rate' stanza applies as:
>>
>> * cummulutive limit (from any/all saddr) for the daddr within the give=
n
>> period
> Its always the same, limit has no internal state other than the rate
> bucket.
>
> In all these examples the limit applies for every packet that makes
> it to the limit expression.
>
> So, f.e.:
> nft add rule filter input icmp type echo-request limit rate 10/second
> accept
>
> applies the limit to each icmp echo request.
>
Thank you for the clarification.

