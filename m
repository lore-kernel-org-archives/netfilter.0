From: =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Subject: Re: [nftables] log flood protection?
Date: Fri, 25 Sep 2020 09:03:00 +0000
Message-ID: <af22d090-64f7-a6d0-b13f-6b7284e2d0c4@gmx.net>
Reply-To: vtol@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1601024579;
        bh=uDOOw4htvsmysKLsPvlqtIuUxJC4U6Yv1/1mOpzaa30=;
        h=X-UI-Sender-Class:Reply-To:To:From:Subject:Date;
        b=c/LKcr0NBDSPXhgZVZUaHNMQY3NQDH/ITlXs0wQY3tOU8TBTA4GfCAW4UgQqinHeD
         E8XWsLt7sAMz2qb8720qV2OQAX0B6gMSFQiSAuURSeBG1P/VSHki+MXiSA98Tb1rNz
         wXyJ/r8NVvHmpK1gOwh27dhhdswpOzSY5U8jISrY=
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

It is not clear whether the limit statement applies to logging (as in=20
the given example) or is being interpreted in a wider context, which=20
actually reads:

update @foo { ip4 saddr timeout 10s limit rate over 14000/second burst=20
200 packets } log flags all prefix "foo DROP: " limit rate 1/second drop;=


 From my understanding that should evaluate the 'rate over 14000/second=20
burst 200 packets' for a period of '10 seconds' and then limit the log=20
output to '1 line/packet per 1 second'.

But that is not what is happening and more than 1 line/packet per second =

gets buffered in the log.


On 25/09/2020 10:48, david@hajes.org wrote:
> Because you use general limit. I use per IP limit. Try iptables transla=
te to nft. Someone explained that it floods log because one IP matches an=
d rest goes to log. Unsure exactly.
>
> I used this article
>
> https://making.pusher.com/per-ip-rate-limiting-with-iptables/
>
> On Sep 25, 2020 10:31, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gm=
x.net> wrote:
>> kernel 5.9.0-rc6 armv7l | nft 0.9.6
>> _____
>>
>> Trying to limit log entries as a preventive measure for log flooding w=
ith
>>
>> log flags all prefix "foo DROP: " limit rate 1/second
>>
>> however that does not work, i.e. the specified rate is not observed an=
d
>> more than 1 line / packet per sec is being printed.
>>
>> Unless missed it there is nothing in the wiki or man about it, man
>> (section LIMIT STATEMENT) only stating:
>>
>>> It can be used in combination with the log statement to give limited
>> logging
>>
>> but unfortunately no syntax sample.
>>
>> How to implement log flooding protection?
>>


