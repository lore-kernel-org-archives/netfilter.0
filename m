From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: xtables 1.31 compilation errors
Date: Sat, 11 Dec 2010 01:34:08 +0000
Message-ID: <4D02D510.9050700@googlemail.com>
References: <4D02C8D5.6080805@googlemail.com> <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr> <4D02CDA1.6030408@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=I02dHGmaWrml2jbVltD1R8kk+G3sIL5d7pUL63Cmmr8=;
        b=D6+YPzDL1r/OgpAJBFw2oWIPLKDIuJZAJvnpg2/vAkIt9C5fTjXbs5+YREQZ0J9sFL
         IFjmCQdYkYJfEPlokv03ifadSgn5mrWNIkpdnZpQPNY187Po4SkPCqEaw4o7gAI4r+4+
         uBSm4OtTOvX1VDLSM7T5dStLaZjyTLP+MKSMs=
In-Reply-To: <4D02CDA1.6030408@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


>>
>> Hooray. Another victim to ALIGN. The problem is not xtables-addons,
>> though. (Please complain to your distro if they have not updated
>> linux-glibc-devel yet.)
>> Further info:
>> http://www.google.de/search?q=3DALIGN+xtables+kernel
>> http://bugs.gentoo.org/325257
> Erm, I am not sure! I have no problems compiling 1.30 and XT_ALIGN is=
=20
> used there. For reference:
>
> uname -r =3D 2.6.34.7-61.fc13.x86_64
> rpm -q glibc-devel =3D 2.12.1-4 (for both x86_64 and i686 as I am doi=
ng=20
> cross compilation a lot)
>
> So, is there something wrong with the above versions, which needs to=20
> be fixed?
=46urther to the above: The 'problematic' line, which SHOULD be include=
d=20
in libxt_gradm.c is:
#include "compat_user.h" (it actually states in the header file=20
"linux-glibc-devel 2.6.34 header screwup", so at least someone admits t=
o=20
a screw up for once!)

With this however, the problems are NOT fixed, I am getting this furthe=
r=20
down the line:

ipset_iphash.c: In function =91iphash_create_init=92:
ipset_iphash.c:42: error: =91IP_NF_SET_HASHSIZE=92 undeclared (first us=
e in=20
this function)
ipset_iphash.c:42: error: (Each undeclared identifier is reported only =
once
ipset_iphash.c:42: error: for each function it appears in.)
make[5]: *** [libipset_iphash.oo] Error 1
make[5]: *** Waiting for unfinished jobs....
make[5]: Leaving directory=20
`/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions/ipset'
make[4]: *** [user-all-local] Error 2
make[4]: *** Waiting for unfinished jobs....
make[4]: Leaving directory=20
`/home/zeek/rpmbuild/BUILD/xtables-addons-1.31/extensions/ipset'

