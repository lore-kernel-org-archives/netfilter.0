From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables v0.9.2 | kernel 4.19.93] logging protocols in inet
 family table require explicit protocol statement?
Date: Wed, 5 Feb 2020 16:13:50 +0000
Message-ID: <9fbdca2d-2ebd-a558-7d09-7ceb102ac19d@gmx.net>
References: <7f4e6968-d2c8-7b14-0d42-137c7f7d7f85@gmx.net>
 <20200205142935.GG26952@breakpoint.cc>
 <03b849bc-48f3-0e47-2d94-47b2a74f988a@gmx.net>
 <20200205144833.GH26952@breakpoint.cc>
 <6a254067-bad5-4a72-25f3-a14ded823097@gmx.net>
 <20200205153734.GI26952@breakpoint.cc>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580919231;
        bh=Xb5KcAVwHmfoupeN94P7THW1qPBOyodCQXRWsuxLMUk=;
        h=X-UI-Sender-Class:Reply-To:Subject:To:Cc:References:From:Date:
         In-Reply-To;
        b=cm9imP8GJO5qukQzhyPFoPiVGTnKcmmdYEvCgtBp3HNBkgQOdAWCshCfstjc9NrAR
         Lytyh+7XMNZGNETxjqWGNpig78Z2paLHrPzmbxUDD2ubDsscGgA8yH73Lw2e3XR7mX
         aKyzzQrX2NH8MRuJ7U5AFGnOfUoKqeCHCOJMEWbA=
In-Reply-To: <20200205153734.GI26952@breakpoint.cc>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Florian Westphal <fw@strlen.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 05/02/2020 15:37, Florian Westphal wrote:
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
>> Citing an example from the WIKI
>>
>> nft add rule filter input tcp dport 22 ct state new log prefix \"New S=
SH
>> connection: \" accept
>>
>> there is no "ip protocol" stipulated. And neither does it throw an err=
or and
>> it works as expected (described in the WIKI)
> Why would there?
> tcp dport eq 22
> ct state eq new
> log prefix \"New SSH ...\"
> accept
>
> See?
> 4 statements, first two statements are equality tests,
> 3rd statement is log, 4th is the verdict.
>
>> Trying something similar in the inet table
>>
>> nft add rule inet filter input tcp log
>>
>> throws
>>
>> Error: syntax error, unexpected log
> Of course, because this is not similar at all.
> This is
> tcp
> log
>
> "tcp" isn't a statement.  What should it mean?

Well, it was supposed to mean to log tcp traffic without being specific=20
on the header fields.

It dawns to me (belatedly) however that it either needs to be stipulated =

as layer protocol (preceding) or else to be expanded (trailing) with a=20
header field match in order to be considered a valid statement for the=20
nft parser. Suppose been trying to keep the code as light/shorthand as=20
possible.

Thanks for the input/pointer.

Not directly related to the subject but curious about concentrating log=20
flags, level and prefix, is this valid syntax (within context of course):=


log flags all level debug prefix

or does it require

log flags all log level debug log prefix

>
>> * nft add rule inet filter input ip protocol tcp log
>> * nft add rule inet filter input ip6 nexthdr=C2=A0 icmpv6 log
>>
>> neither throws an error. Hope that makes it clear.
> Why would it?  Its valid.
>
> ip protocol =3D=3D tcp
> log
>
> ip6 nexthdr =3D=3D icmpv6
> log
>
> both are two valid statements.
>
> It might help if you would explain what you are trying to do.


