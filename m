From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: xtable addons compilation issue
Date: Wed, 8 Aug 2012 20:05:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208082004060.4912@frira.zrqbmnf.qr>
References: <CAE1WnGesmmXXt7SvcoMmP1KosVVBU0FRjeTa9j1SvT6w+JFSZw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGesmmXXt7SvcoMmP1KosVVBU0FRjeTa9j1SvT6w+JFSZw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>


On Tuesday 2012-08-07 10:38, rahul shrivastava wrote:

>Hi,
>i  am cross compiling xtable addons for powerpc
>kernel version: 2.6.35
>
>getting following error during make
>
>
>./configure CC=3D"/home/QorIQ-p1010-SDK/v1.01/freescale-2010.09/bin/po=
werpc-linux-gnu-gcc"
>--with-kbuild=3D/home/Linux/Normal-Linux/linux-2.6.35_vrbp
>--host=3Dpowerpc-linux-gnu
>
>make[3]: Entering directory
>`/home/Nat_branch/code_base_6.12.0/onsite_verification_clone_13May/Cas=
sidian_RBP_dev/Linux/Normal-Linux/linux-2.6.35_vrbp'
>  CC [M]  /home/Nat_branch/xtables_addons/xtables-addons-1.45/extensio=
ns/compat_xtables.o
>/home/Nat_branch/xtables_addons/xtables-addons-1.45/extensions/compat_=
xtables.c:1:0:
>error: code model =C3=A2kernel=C3=A2 not supported in the 32 bit mode
>/home/Nat_branch/xtables_addons/xtables-addons-1.45/extensions/compat_=
xtables.c:1:0:
>sorry, unimplemented: 64-bit mode not compiled in

Your compiler was built for powerpc, but your kernel is powerpc64.
This is not a xtables-addons problem.
