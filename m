From: =?UTF-8?Q?Kadlecsik_J=C3=B3zsef?= <kadlec@blackhole.kfki.hu>
Subject: Re: ipset bitmap:port question
Date: Thu, 14 Nov 2019 13:53:00 +0100 (CET)
Message-ID: <alpine.DEB.2.20.1911141344360.7498@blackhole.kfki.hu>
References: <ba4fb013-93a0-3f63-0fd6-a4ee557893af@lechevalier.se> <CAK6Qs9k7MD++kEHiZ+ZEunz7SyCNGeEqB3r2iZFTh_hZUQT6tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="110363376-1783608823-1573735980=:7498"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:references
        :message-id:in-reply-to:from:from:date:date:received:received
        :received; s=20151130; t=1573735980; x=1575550381; bh=hDs0RBQ/Ca
        /cZ68bLf8iEhRxcoTY9GJHPaaEfDc8RA8=; b=ngfgZR38LNFzaxlgXXOMSRqis4
        zzklA5rdFNvqtJuW9uV+oMxefCf0sDYpvw7T4BYSTuPnsQTI1OXrqEF+yPzTSonx
        VZPQtllAX+lsv/VxlTuzFIy0XHsdC5G5jo2HgRkoEDP/iAwM1vfDyQnJn2bHK0uX
        G5tLpOUc9ry1Q1Bgs=
In-Reply-To: <CAK6Qs9k7MD++kEHiZ+ZEunz7SyCNGeEqB3r2iZFTh_hZUQT6tQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?UTF-8?Q?=C4=B0brahim_Ercan?= <ibrahim.metu@gmail.com>
Cc: A L <mail@lechevalier.se>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110363376-1783608823-1573735980=:7498
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi,

On Thu, 14 Nov 2019, =C4=B0brahim Ercan wrote:

> I'm also wondering why port numbers are not interpreted with protocol on=
=20
> bitmap:port while hash kind sets are. I'd would glad to hear from a=20
> netfilter developer.

The bitmap family is the earliest and the types kept their original=20
functionality (apart from the extensions). In the case of the hash types=20
it was easy to add the protocol number to the port while in the bitmap=20
case it'd be not so simple.

Best regards,
Jozsef

> On Thu, Nov 14, 2019 at 4:25 AM A L <mail@lechevalier.se> wrote:
> >
> > Hello,
> >
> > I'm trying to understand if ipset "bitmap:port" should support protocol
> > or not. Based on the name"bitmap:port" it should only store one value
> > per row, and not tuple like "bitmap:ip,mac" does. However the examples
> > in the manual suggests it should?
> >
> >  ...
>=20

-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110363376-1783608823-1573735980=:7498--
