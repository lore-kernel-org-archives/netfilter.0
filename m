From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Failed to compile libnetfilter_queeu 1.0.1 under Centos 6.2
Date: Fri, 29 Jun 2012 23:51:52 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206292342540.6785@frira.zrqbmnf.qr>
References: <CAFs09d4CPqyotppJCm4ZxYDxe6KGO5ZtTtSZztRDuXD55u5s3A@mail.gmail.com> <CAFs09d65BuVHh58og-5dx2sFW=3yJBZ5gVrU=cPuwdOxbftZ7A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFs09d65BuVHh58og-5dx2sFW=3yJBZ5gVrU=cPuwdOxbftZ7A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: David Hajoglou <dhajoglou@stillsecure.com>
Cc: netfilter@vger.kernel.org

On Friday 2012-06-29 23:36, David Hajoglou wrote:

>I hope the message subject will make it to the appropriate thread, but
>if not, I'm responding to
>http://marc.info/?l=3Dnetfilter&m=3D132671646831409

This post references dl.medozas.de, which has been replaced by=20
dl.inai.de in the meantime.

>In short, the original problem was linked to a missing
>/usr/include/libnfnetlink/linux_nfnetlink.h

libnetfilter_queue provides its own copies of certain headers exactly=20
because they may not be present (or present and too old) in=20
/usr/include.

>I too had the same problem but it was with an RRM of libnfnetlink form
>the epel repo
>http://dl.fedoraproject.org/pub/epel/6/x86_64/repoview/libnfnetlink-de=
vel.html
> After getting a hold of the source rpm off that repo I found that
>they're patching to remove both=C2=A0linux_nfnetlink.h and
>linux_nfnetlink_compat.h and instead, pointing=C2=A0libnfnetlink.h at =
the
>kernel header=C2=A0nfnetlink.h.

epel bugs to epel people.

>I'm not sure if this is a good thing or bad thing as it impacted my
>ability to build DAQ (for snort). =C2=A0My install of=C2=A0libnetfilte=
r_queue
>references=C2=A0#include <libnfnetlink/linux_nfnetlink.h> which makes =
the
>install of DAQ fail.

An original libnetfilter_queue also has that line -- commented out.

#include <libnfnetlink/libnfnetlink.h>
// #include <libnfnetlink/liunx_nfnetlink.h>

#include <libnetfilter_queue/linux_nfnetlink_queue.h>

>=C2=A0I could patch and rebuild libnetfilter_queue or
>I could rebuild libnfnetlink, or I could make some hacky edits here
>and there. =C2=A0It is friday and beer drinking might just be in order=
 for
>these fixes so no telling what I might attempt :)

You could grab libnetfilter_queue - or for that matter the entire stack=
=20
- from dl.inai.de/repos/CentOS_6 and see if that works.
