From: Patrick McHardy <kaber@trash.net>
Subject: Re: [ANNOUNCE] Release conntrack-tools 0.9.7
Date: Thu, 05 Jun 2008 15:42:27 +0200
Message-ID: <4847ED43.1090908@trash.net>
References: <48418100.2080305@netfilter.org> <4845DF38.4020708@zensoluciones.com> <48470CCC.2080702@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48470CCC.2080702@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= <scramatte@zensoluciones.com>, netfilter@vger.kernel.org

Pablo Neira Ayuso wrote:
> S=C2=8E=C3=A9bastien Cramatte wrote:
>> Hi
>>
>> I'm trying to rebuild  conntrack-tools packages under debian lenny.
>> I'm "git" newbie  ! when  I clone "libnetfilter_conntrack.git" it
>> download  the 0.0.30 version and I need 0.0.94 ...
>> How can I told git to checkout a specific "tag" ?  I've searched in
>> manual  but  I don't found what I need...
>=20
> I get the lastest version (0.0.94) with git version 1.5.5.3 so I cann=
ot
> figure out what is going wrong. Patrick, any idea?

Try "git-checkout <revision/tag>"

By default it uses HEAD.
