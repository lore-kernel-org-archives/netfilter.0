From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: Re: [ANNOUNCE] Release conntrack-tools 0.9.7
Date: Thu, 05 Jun 2008 14:45:20 +0200
Message-ID: <4847DFE0.8070404@zensoluciones.com>
References: <48418100.2080305@netfilter.org> <4845DF38.4020708@zensoluciones.com> <48470CCC.2080702@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48470CCC.2080702@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, Patrick McHardy <kaber@trash.net>

Pablo Neira Ayuso escribi=C3=B3:
> S=C2=8E=C3=A9bastien Cramatte wrote:
>  =20
>> Hi
>>
>> I'm trying to rebuild  conntrack-tools packages under debian lenny.
>> I'm "git" newbie  ! when  I clone "libnetfilter_conntrack.git" it
>> download  the 0.0.30 version and I need 0.0.94 ...
>> How can I told git to checkout a specific "tag" ?  I've searched in
>> manual  but  I don't found what I need...
>>    =20
>
> I get the lastest version (0.0.94) with git version 1.5.5.3 so I cann=
ot
> figure out what is going wrong. Patrick, any idea?
>
>  =20
Hello

As I told you before I'm a newbie using "git".  I've executed this comm=
and

git clone git://git.netfilter.org/libnetfilter_conntrack.git

If I open debian/changelog   I can see  0.0.30  so when I do =20
dpkg-buildpackage  it has  version 0.0.30
but might be that code is  0.0.94  and  just is required to update some=
=20
debian packages files ?

Regards


