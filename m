From: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>
Subject: Re: general question about DNAT-rule
Date: Thu, 28 Jun 2012 10:55:59 -0700
Message-ID: <CAJygYd29i6Rh+ZsVASsC7W267Srueas9DHNYGhLQgJhAd8iEXg@mail.gmail.com>
References: <515168F006F2D643952F8FFD24F2E073015AD663A6@sonne2.gw.bringe.net> <zarafa.4fec9938.2a62.2ad8418a26a48827@zarafa.cubewerk.int>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=ltTR1aB9f7eyRrwUpQyjgZnsE6GV0Qv7nSW0s7qESzc=;
        b=W0cHERutPfg7QWiq/y9KxUrTck69rRY3cV31sGP7Tzd6IiGDUQnuRu9j+omZKzydss
         KPPc9Wx7EDTRVn6qU8UB/+j+YpL2lscuZriskA2SQhFj1al5AZjkfYsqJz/K4V0G2D1o
         Qlp6Z1gWJxmqYwPKQm0V7AqZSqs4nW8OGlFO3BexPAsAltdpbYoMdcra5kPfZ8nnLBFr
         Nqe93SuMmqL21a+GM5Jgjx7n7BDjvzc61/SmcFmoGN2kVev8SF+q0PAx+1x5t1SNH2nz
         wSbb720JvqyClbX8A6NOBNHpsmFtIJD0zNcZhLjNdlYW3uniwUMG1WMc4TWlZLcxh3Ed
         GQuw==
In-Reply-To: <zarafa.4fec9938.2a62.2ad8418a26a48827@zarafa.cubewerk.int>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Stefan Bauer <stefan.bauer@cubewerk.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

unless you have NOTRACK in raw table to specific turned off connection
tracking for forwarding traffic, it be default still being tracked and
DNAT/SNAT auto match will still in effect.

On Thu, Jun 28, 2012 at 10:49 AM, Stefan Bauer <stefan.bauer@cubewerk.d=
e> wrote:
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: =C2=A0 =C2=A0Thomas B=C3=A4tzler <t.baetzler@bringe.com>
> Gesendet: =C2=A0 =C2=A0 =C2=A0 Do 28.06.2012 19:44
> Betreff: =C2=A0 =C2=A0 =C2=A0 =C2=A0AW: general question about DNAT-r=
ule
> An: =C2=A0 =C2=A0 netfilter@vger.kernel.org;
> CC: =C2=A0 =C2=A0 Stefan Bauer <stefan.bauer@cubewerk.de>;
> > Stefan Bauer asked:
> > > This is done internally right? hence i dont see such a rule in th=
e iptables
> > -t nat
> > > -vnL output?
> >
> > Have a look at /proc/net/ip_conntrack, or better yet, install the c=
onntrack
> > utility.
>
> Ok - so it is handled internal. Can i sum this up and keep in mind th=
e following?
>
> A single DNAT-rule is enough on a router to have bi-directional traff=
ic as the required "SNAT-magic"
> is automatically done.
>
> A DNAT and SNAT-rule is required on a device to forward packages to a=
nother device because answer packages will not flow through the first d=
evice as it is not in the middle like a router?
>
> thank you very much for clarification.
>
> Stefan
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
