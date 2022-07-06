From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: Bug in the wiki
Date: Wed, 6 Jul 2022 06:22:43 -0400
Message-ID: <16130a18-e4c1-a1b7-1414-7025389efca0@fhmtech.com>
References: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
 <600cead8-acad-0be6-bfe4-33cee996ccd9@fhmtech.com>
 <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID; bh=lU009F6sC325yvoMy1d7yjImWUocbyik/e21I9Vpxc8=;
        b=QWs9qPXOs4n+t6Ixvtl6rR4K6Andw89m2rLWdL11Da8XBINUXvvcnGAL+4C/FJ+/afeyo0VG6ucvsDXBvUy7QAPGp7CwwtxmhtUpU9dsMs+n245bdOIxlgab8LJiGGi+s95UaQwoTGHb4NbQuX8uVi6ILJgKSZa40SMHHrNeH/0=;
Content-Language: en-US
In-Reply-To: <CAEXMXLRqUgFmME_8OKpAWRog3dqRCG+veHbJsZPKh9xOZ98D=Q@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Nuno_Gon=c3=a7alves?= <nunojpg@gmail.com>
Cc: netfilter@vger.kernel.org

On 2022/07/06 06:09, Nuno Gon=C3=A7alves wrote:
> On Wed, Jul 6, 2022 at 10:59 AM Frank Myhr <fmyhr@fhmtech.com> wrote:
>> Hi Nuno,
>>
>> The icmp and icmpv6 rules you refer to are in regular chains, both
>> called by base chain "inbound" that has policy drop and no other icmp /
>> icmp6 rules. Therefore there is no need for the additional "drop" rules
>> that you suggest; packets arriving faster than the limit rates will be
>> dropped by the calling base chain's default policy.
>>
>> Best regards,
>> Frank
>=20
> I think ct (conntrack) will track it after the first accept and so the
> rate limit becomes ignored.
>=20
> This is what happens in reality. My understanding is that it's a bug
> in this configuration. If the configuration is correct then it would
> be bug (I'm on 5.18.9).

To be clear: you're testing this example ruleset and seeing unlimited=20
echo requests being allowed in despite the limit rule?


> Can you give me a hint why you think ct wouldn't accept it forever
> after the first accept?

I'm going to have to defer to others with in-depth knowledge of ct. I=20
suspect that if all of your echo requests come from the same source ip=20
address, *maybe* the limit is ineffective as you suggest. I'd be very=20
surprised if echo requests from multiple ip addresses are also immune to=20
the limit.

Best regards,
Frank
