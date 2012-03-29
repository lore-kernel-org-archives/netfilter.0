From: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Subject: Re: Recompile iptables
Date: Thu, 29 Mar 2012 01:24:40 -0700 (PDT)
Message-ID: <1333009480.60893.YahooMailNeo@web125606.mail.ne1.yahoo.com>
References: <1333004474.86926.YahooMailNeo@web125606.mail.ne1.yahoo.com> <1333006198.2741.14.camel@ns014530.dcyb.net> <alpine.LNX.2.01.1203291007010.812@frira.zrqbmnf.qr>
Reply-To: gopi bhimavarapu <gopimallikharjun@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1333009481; bh=npyHgI9LHC1wIXVcVmaZe9H831XteTJuHfzM3aqkVtQ=; h=X-YMail-OSG:Received:X-Mailer:References:Message-ID:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=3t12CZGwTDZK5EdcfuF5uzR1Vkj3oPzZJpBtOIOKmq8vFIGS90HThx4Z5o/Fy8rF2Wx4sP/QTRLHNzqlTPgdDTVrt+qgyLLHbrwtpMHkCjsvj8CdWD6FIUSCKIAf5/msvq4OZGviuHxoxrWMbtHsTiu1yu5TYVAiZpJ8efQ+VFs=
In-Reply-To: <alpine.LNX.2.01.1203291007010.812@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>, "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Rob/Jan

What I understand is iptables is now made completely independent of kso=
urce.
In such case, how can I get my new definition of ipt_entry to iptables.
Is it that, I have to make same changes in iptables/include directory a=
lso (ip_tables.h file).
When I make the same change, then I am not getting "Invalid Argument" e=
rror.


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
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at=C2=A0 http://vger.kernel.org/majordomo-info.html

