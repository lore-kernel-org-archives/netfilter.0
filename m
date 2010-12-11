From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: xtables 1.31 compilation errors
Date: Sat, 11 Dec 2010 01:47:19 +0000
Message-ID: <4D02D827.5090208@googlemail.com>
References: <4D02C8D5.6080805@googlemail.com> <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr> <4D02CDA1.6030408@googlemail.com> <4D02D510.9050700@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=z9e7Zwjmd945/X/EApxAH2wJb2gEU9/vD+Bdap6J8I8=;
        b=vYGv8CpMBIZkfRfeiExDArV1ZdDGtwfR0hFfJOxQEdMCbU57+tlOBUQbHCpafYa0ui
         i20aDdOAl0HB+i4oCMasXQXxloTPQwa/02mC8EB6M14zMFSE/5BQbuGQZeWj2lSvyUxI
         dHtN0i4ALQCrPRS9UKcZYK9k8hppmGXgIOee4=
In-Reply-To: <4D02D510.9050700@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


> Further to the above: The 'problematic' line, which SHOULD be include=
d=20
> in libxt_gradm.c is:
> #include "compat_user.h" (it actually states in the header file=20
> "linux-glibc-devel 2.6.34 header screwup", so at least someone admits=
=20
> to a screw up for once!)
>
> With this however, the problems are NOT fixed, I am getting this=20
> further down the line:
>
> ipset_iphash.c: In function =91iphash_create_init=92:
> ipset_iphash.c:42: error: =91IP_NF_SET_HASHSIZE=92 undeclared (first =
use=20
> in this function)
> ipset_iphash.c:42: error: (Each undeclared identifier is reported onl=
y=20
> once
> ipset_iphash.c:42: error: for each function it appears in.)
> make[5]: *** [libipset_iphash.oo] Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[5]: Leaving directory=20
> `/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions/ipset'
> make[4]: *** [user-all-local] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory=20
> `/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions/ipset'
=2E..Also, IP_NF_SET_HASHSIZE is in ipset_ipportiphash.c,=20
ipset_ipporthash.c and ipset_nethash.c, in neither of which=20
IP_NF_SET_HASHSIZE is defined, apparently!

There is a definition of CONFIG_IP_NF_SET_HASHSIZE in ip_set.h which is=
=20
set to 1024.

In 1.30 the value of 1024 is directly used, instead of=20
IP_NF_SET_HASHSIZE (which SHOULD have been CONFIG_IP_NF_SET_HASHSIZE!),=
=20
so someone (Jozsef?) needs to fix this.

I am amazed nobody checks these things - how do you compile this code=20
people?
