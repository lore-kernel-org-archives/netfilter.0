From: David Hajoglou <dhajoglou@stillsecure.com>
Subject: Re: Failed to compile libnetfilter_queeu 1.0.1 under Centos 6.2
Date: Fri, 29 Jun 2012 15:36:09 -0600
Message-ID: <CAFs09d65BuVHh58og-5dx2sFW=3yJBZ5gVrU=cPuwdOxbftZ7A@mail.gmail.com>
References: <CAFs09d4CPqyotppJCm4ZxYDxe6KGO5ZtTtSZztRDuXD55u5s3A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFs09d4CPqyotppJCm4ZxYDxe6KGO5ZtTtSZztRDuXD55u5s3A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I hope the message subject will make it to the appropriate thread, but
if not, I'm responding to
http://marc.info/?l=3Dnetfilter&m=3D132671646831409

In short, the original problem was linked to a missing
/usr/include/libnfnetlink/linux_nfnetlink.h

I too had the same problem but it was with an RRM of libnfnetlink form
the epel repo=A0http://dl.fedoraproject.org/pub/epel/6/x86_64/repoview/=
libnfnetlink-devel.html
 After getting a hold of the source rpm off that repo I found that
they're patching to remove both=A0linux_nfnetlink.h and
linux_nfnetlink_compat.h and instead, pointing=A0libnfnetlink.h at the
kernel header=A0nfnetlink.h.

I'm not sure if this is a good thing or bad thing as it impacted my
ability to build DAQ (for snort). =A0My install of=A0libnetfilter_queue
references=A0#include <libnfnetlink/linux_nfnetlink.h> which makes the
install of DAQ fail. =A0I could patch and rebuild libnetfilter_queue or
I could rebuild libnfnetlink, or I could make some hacky edits here
and there. =A0It is friday and beer drinking might just be in order for
these fixes so no telling what I might attempt :)

Thanks,
-hojo
