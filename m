From: Sam James <sam@gentoo.org>
Subject: Re: [ANNOUNCE] ipset 7.18 released
Date: Wed, 20 Sep 2023 14:03:18 +0100
Message-ID: <21CF8732-712C-463C-9DA7-A40DA6A1A9B8@gentoo.org>
References: <20230920125056.GA25778@breakpoint.cc>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20230920125056.GA25778@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Florian Westphal <fw@strlen.de>
Cc: Jan Engelhardt <jengelh@inai.de>, Jozsef Kadlecsik <kadlec@netfilter.org>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org



> On 20 Sep 2023, at 13:51, Florian Westphal <fw@strlen.de> wrote:
>=20
> =EF=BB=BFJan Engelhardt <jengelh@inai.de> wrote:
>=20
> You might want to CC author of that change.
>=20
Yeah, happy to fix my error - although being polite wouldn't go amiss.

>>> On Wednesday 2023-09-20 13:20, Jan Engelhardt wrote:
>>> On Tuesday 2023-09-19 20:26, Jozsef Kadlecsik wrote:
>>>>=20
>>>> I'm happy to announce ipset 7.18, which brings a few fixes, backports,=
=20
>>>> tests suite fixes and json output support.
>>>=20
>>> The installation of the pkgconfig file is now broken.
>>>=20
>>>> - lib/Makefile.am: fix pkgconfig dir (Sam James)
>>>=20
>>> Aaaaagh.. that change completely broke installation and must be reverte=
d.
>>=20
>> commit 326932be0c4f47756f9809cad5a103ac310f700d
>> Author: Sam James <sam@gentoo.org>
>> Date:   Sat Jan 28 19:23:54 2023 +0100
>>=20
>>    lib/Makefile.am: fix pkgconfig dir
>>=20
>>    Signed-off-by: Sam James <sam@gentoo.org>
>>    Signed-off-by: Jozsef Kadlecsik <kadlec@netfilter.org>
>>=20
>> Can I just take a moment to vent about this some more.
>> The change is, in the words of another Linux developer, utter garbage.
>> ${libdir} contains ${prefix} and did so for eternities.
>>=20
>> The commit message is utter garbage too, because it does not
>> even try to make an argument to even _have_ the change in the
>> first place. Allowing such an underdocumented change is a
>> failure in the review process itself.
