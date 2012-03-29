From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Recompile iptables
Date: Thu, 29 Mar 2012 10:15:02 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1203291007010.812@frira.zrqbmnf.qr>
References: <1333004474.86926.YahooMailNeo@web125606.mail.ne1.yahoo.com> <1333006198.2741.14.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1333006198.2741.14.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, gopimallikharjun@yahoo.com

On Thursday 2012-03-29 09:29, Rob Sterenborg (lists) wrote:

>On Thu, 2012-03-29 at 00:01 -0700, gopi bhimavarapu wrote:
>> Hi
>>=20
>> I need to recompile the iptables userspace program using the include
>> files of my kernel. (which has specific improvements in ipt_entry st=
ructure).
>> I am using iptables-1.4.12.2 and ussing --with-ksource option and gi=
ving my
>> kernels include directory.
>> Even then, ipt_entry sturcture of iptables-1.4.12.2/include is getti=
ng precedence.
>> How can I force it to take my include files.

# Rob, don't strip Ccs.

Nah, the issue really is that ${kinclude_CPPFLAGS} comes after=20
-I${top_builddir}/include -I${top_srcdir}/include in=20
extensions/GNUmakefile.in near AM_CPPFLAGS=3D.

And as I try to find a reason (use case) why we even still have=20
--with-ksource=C2=A0=E2=80=94 iptables is completely independent of it=C2=
=A0=E2=80=94, I guess it=20
is so that one does not have to copy forth and back header files when=20
developing a *new, previously non-existing extension*. For that,=20
placement of ${kinclude_CPPFLAGS} at the end of line is sufficient.

Note that by changing ipt_entry, you are making yourself incompatible t=
o=20
everyone and everything.

>Besides, if you checked ./configure --help, it says that --with-ksourc=
e
>should point to '/lib/modules/CURRENT/source', not
>'/lib/modules/CURRENT/source/include' which is what you seem to have
>done.
