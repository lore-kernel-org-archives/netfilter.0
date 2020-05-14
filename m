From: =?UTF-8?B?0IbQstCw0L0g0KnQtdGA0LHQtdC5?= <ivan@intraffic.ua>
Subject: Re: Dynamic list for net's
Date: Thu, 14 May 2020 13:48:58 +0300
Message-ID: <CAPLRfGKERnTUD0KfPSVm91jHhv_LpzFXqvYf+7XmJxScce6j6g@mail.gmail.com>
References: <CAPLRfGJXvrwpROcjAsxb-7=dASRO1j0h+UbwKUDhXi1zXV48_g@mail.gmail.com>
 <c5b80a94-21d8-b672-f9c4-3d99b95164fe@plushkava.net> <CAPLRfG+RCkQ=g5qQN=GrjoHzUxDK78F4=4ZwQ9qQqm2gTJfcQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intraffic-ua.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=335fvq3CGtaXHG57w4ka4vd9MJ01/nzAmVs3stQKW4U=;
        b=XMSPjlsQVn8v1N8YNUKgys+uqQAxaAY13vFVqnKAA95SYfwqiB7sGJzZmSyPEDAxkU
         EY7MyFk6h2un4A6IbyYJDFJwNg9q+K+YlDszVvUiw+Qnwy1btcUQxUDWSX0oGoUina1/
         qzYoCKZIZ/zeWT4Adke/JrYXi8tzsEo7IXbn2lBqmsESjeKgsMNNUpmlWIRJFPU3RRva
         0bUVWp1p4M34815NNhws06a0OPeicRgh9jvYBCWzNAKXToXnQ/AUdFBV5111RbNGPL1G
         U9jbUwMB1W/5y50ZNibuvx8fvujMy3kuCnABw8Ar28RiuuRquE/GriVfNkoDVRvP+OmG
         ofOA==
In-Reply-To: <CAPLRfG+RCkQ=g5qQN=GrjoHzUxDK78F4=4ZwQ9qQqm2gTJfcQQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: kfm@plushkava.net
Cc: netfilter@vger.kernel.org

Hi again.

How can flush "sets" ?

i get this message when try it:
# nft flush set ip filter ua_ix_list
<cmdline>:1:1-31: Error: Could not process rule: Invalid argument
flush set ip filter ua_ix_list
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

But:
# nft list set ip filter ua_ix_list
table ip filter {
        set ua_ix_list {
                type ipv4_addr
                flags interval
        }
}



Install version:
nftables v0.7 (Scrooge McDuck)

Thanks

=D1=81=D1=80, 13 =D0=BC=D0=B0=D1=8F 2020 =D0=B3. =D0=B2 21:59, =D0=86=D0=B2=
=D0=B0=D0=BD =D0=A9=D0=B5=D1=80=D0=B1=D0=B5=D0=B9 <ivan@intraffic.ua>:
>
> Yes, that's what I want
> Thank you very much.
>
>
>
> =D1=81=D1=80, 13 =D0=BC=D0=B0=D1=8F 2020 =D0=B3. =D0=B2 21:39, <kfm@plush=
kava.net>:
> >
> > On 13/05/2020 18:40, =D0=86=D0=B2=D0=B0=D0=BD =D0=A9=D0=B5=D1=80=D0=B1=
=D0=B5=D0=B9 wrote:
> > > Hi all
> > >
> > > I have question about "SET"
> > >
> > > I read this block on manpage:
> > >>
> > >> Using anonymous sets to accept particular subnets and ports.
> > >>
> > >>
> > >> nft add rule filter input ip saddr { 10.0.0.0/8, 192.168.0.0/16 } tc=
p dport { 22, 443 } accept
> > >>
> > >> Named sets are sets that need to be defined first before they can be=
 referenced in rules. Unlike anonymous sets, elements can be added to or re=
moved from a named set at any time. Sets are referenced from rules using an=
 @ prefixed to the sets name.
> > >>
> > >> Using named sets to accept addresses and ports.
> > >>
> > >>
> > >> nft add rule filter input ip saddr @allowed_hosts tcp dport @allowed=
_ports accept
> > >
> > >
> > > But i can't use network how elements in set. because only ipv4_addr o=
r
> > > ipv6_addr types are supported.
> >
> > For named sets, ensure that the "interval" flag is present. See the
> > discussion that occurred in the following bug:
> >
> > https://bugzilla.netfilter.org/show_bug.cgi?id=3D1380
> >
> > --
> > Kerin Millar
