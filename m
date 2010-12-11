From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: xtables 1.31 compilation errors
Date: Sat, 11 Dec 2010 04:34:25 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012110407200.10546@obet.zrqbmnf.qr>
References: <4D02C8D5.6080805@googlemail.com> <alpine.LNX.2.01.1012110149030.30015@obet.zrqbmnf.qr> <4D02CDA1.6030408@googlemail.com> <4D02D510.9050700@googlemail.com> <4D02D827.5090208@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D02D827.5090208@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>


On Saturday 2010-12-11 02:47, Mr Dash Four wrote:
>>
>> ipset_iphash.c: In function =E2=80=98iphash_create_init=E2=80=99:
>> ipset_iphash.c:42: error: =E2=80=98IP_NF_SET_HASHSIZE=E2=80=99 undec=
lared (first use in this
>> function)
>> ipset_iphash.c:42: error: (Each undeclared identifier is reported on=
ly once
>> ipset_iphash.c:42: error: for each function it appears in.)
>
>In 1.30 the value of 1024 is directly used, instead of
>IP_NF_SET_HASHSIZE (which SHOULD have been
>CONFIG_IP_NF_SET_HASHSIZE!), so someone (Jozsef?) needs to fix this.

Don't point fingers when you don't know who to blame.
This is not something Jozsef caused.

>I am amazed nobody checks these things - how do you compile this
>code people?

Releases are checked for whether the kernel modules compile with all
kernel versions. Userspace compilation testing is limited to what I
run. The rest is done happily by people more familiar with specific
choices of distros. That is how the ecosystem works, and it usually
works.

[Not to mention again that the IP_NF_SET_HASHSIZE issue does not appear
in a released tarball. So while everybody tries to avoid git states
that do not compile=C2=A0=E2=80=94 it's a hindrance for git-bisect too=C2=
=A0=E2=80=94 slips
do happen.]

Of course, there are also commercial support options available if you
prefer more QA.
