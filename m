From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: xtables 1.31 compilation errors
Date: Sun, 12 Dec 2010 14:50:26 +0000
Message-ID: <4D04E132.7020408@googlemail.com>
References: <4D02C8D5.6080805@googlemail.com> <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr> <4D02CDA1.6030408@googlemail.com> <4D02D510.9050700@googlemail.com> <4D02D827.5090208@googlemail.com> <alpine.LNX.2.01.1012110407200.10546@obet.zrqbmnf.qr> <4D03806F.6050107@googlemail.com> <alpine.LNX.2.01.1012111737310.17765@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=JXgJzdkth2qV3avHOmP2cqncSEuPU+1JtvZxHkseWWE=;
        b=FEFdtlf5uYazJ2DuxX0oJGHO+BPwJXZSQIynhkjIaMJlqxfZ+JHB9F2KhBzGy7IOOR
         2A+U0m3D64dpFEm3uWiVj6Kt/FZyME5bHaAwFJGLhJrp9r/2qFKLvQSX6Y1SYbXzw36j
         QI45ZsNmOA/v8yUfT2iWMXcHVsFM3IFVn1+Ik=
In-Reply-To: <alpine.LNX.2.01.1012111737310.17765@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


>>> Of course, there are also commercial support options available if y=
ou
>>> prefer more QA.
>>>      =20
>> So, in order to get xtables to at least compile I have to get a
>> commercial support?! Really?! I dread the day you take over from
>> Patrick McHardy then - I really do!
>>    =20
>
> You mix up the Xtables core with Xtables-addons. The latter had the
> compile issue, but Patrick has nothing to do with Xtables-addons.
>  =20
You know exactly what I meant, so don't try to wriggle out of it.

> N.B.: To bring you up to date with the beer-free software: if someone
> feels a project needs more attention, they are to invest in it. If
> they do not come forward with patches, the public assumes they have
> other capabilities, and so, as a running gag, money spending is
> proposed.
>  =20
Save your beer-free-software teachings for someone else - you are in no=
=20
position to try and educate me!

I've spotted 2 bugs in the current git tree of xtables (one of which wa=
s=20
in the *released* version of ipset) and I asked for help on how to=20
resolve them. In the meantime I did find a solution, which I posted ear=
lier.

You tried to send me down blind alleys and basically acting smart a**e=20
instead of providing a solution - the aforementioned bug with ALIGN=20
wasn't something new to you - you already knew what the problem was and=
,=20
most importantly, how to fix it, though you did not consider it=20
necessary to let me know that, but to point me to google search and som=
e=20
obscure bug submission on gentoo instead.

>>> Releases are checked for whether the kernel modules compile with
>>> all kernel versions. Userspace compilation testing is limited to
>>> what I run. The rest is done happily by people more familiar with
>>> specific choices of distros. That is how the ecosystem works, and
>>> it usually works.
>>>      =20
>> The key word being 'usually' I presume, eh? Don't tell me you were
>> able to compile this code, because I won't believe you. I have
>> downloaded xtables with the *released* version of ipset (which
>> happens to be 4.5)
>>    =20
>
> I was meaning: a _released_ version _of xtables-addons_.
>  =20
The bug with IP_NF_SET_HASHSIZE was in the released version if ipset an=
d=20
not xtables and that is what I meant with my previous post.

> Yes, I know about the current git HEAD state. Happened to slip on
> compiling state 5bcdf7f. Big deal =E2=80=94 Errare humanum est.
>  =20
I have no issue with errors being present in the git source tree - no=20
software is ever perfect. I, however, have issues with you asking for=20
'commercial support' (i.e. begging for money) in order to get a code=20
which simply compiles and also sending me down blind alleys when you=20
knew how to fix the problem I requested help for.

> Fixed now..
>  =20
So, wouldn't it have been easier for you to just point out how to fix=20
this as soon as I posted about this bug, instead of harping on about=20
commercial support, google search, gentoo bug submission and the=20
difference between xtables and xtables-addons?!
