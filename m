From: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Subject: Re: Recompile iptables
Date: Thu, 29 Mar 2012 04:31:37 -0700 (PDT)
Message-ID: <1333020697.52159.YahooMailNeo@web125604.mail.ne1.yahoo.com>
References: <1333004474.86926.YahooMailNeo@web125606.mail.ne1.yahoo.com> <1333006198.2741.14.camel@ns014530.dcyb.net> <alpine.LNX.2.01.1203291007010.812@frira.zrqbmnf.qr>
Reply-To: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1333020697; bh=D8qeIanoRJ4N1me7ExW/xpILyZetahQlLcmA8HYeGp0=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=LArKh6yPU/qOJLZz5S3R6BAfosJtWWZajIUAR2p/0djh3fS3IchoZSiCZErqK4QaZK99AtasOrI43BL919M3jspYJ/G+vEW2+O5XFKBrg9RoZ6PPijrMT5L/OpuPmE093ySm1KdW5QR4L1XpCYQeBqTh1N1FhssyifemVt1rYpU=
In-Reply-To: <alpine.LNX.2.01.1203291007010.812@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>, "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi

So, If we had made any changes ipt_entry structure in our existing kern=
el,
If
 we want the change to be percolated to iptables-1.4.12.2, then we have=
=20
to make corresponding changes in ipt_entry structure of ip_tables.h of=20
iptables-1.4.12.2/include directory. (Apply it as a patch).
So that both iptables and kernel are in sync.
Simply
 by using -with-ksource option would not suffice. As in the include=20
path, build_dir/include path comes first and then kernel source include=
=20
path.
Please correct me If I am wrong.

Regards,
Gopi



----- Original Message -----
=46rom: Jan Engelhardt <jengelh@medozas.de>
To: Rob Sterenborg (lists) <lists@sterenborg.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>; gopimallik=
harjun@yahoo.com
Sent: Thursday, March 29, 2012 1:45 PM
Subject: Re: Recompile iptables

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

