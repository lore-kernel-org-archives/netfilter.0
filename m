From: Tony He <huangya90@gmail.com>
Subject: Re: Fwd: question about using conntrack to change the mark
Date: Tue, 22 Aug 2023 18:09:07 +0800
Message-ID: <CAAUX2SUxjrweJ0-Fd9Taz97xTAqPYZhGfg2nMuEfMCHe7TDwUw@mail.gmail.com>
References: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
 <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com>
 <ZOM8e8u+BK3jBNrE@calendula> <CAAUX2SVPgu5Mp8DAhEGzW7Y3UB2k++_qaVeZ3NbHZu4Yfw4bkw@mail.gmail.com>
 <ZONSYn2VHXlbRHX8@calendula> <CAAUX2SWXrkXKM_mNuc-4Sg7QTmPVt8JjE6GwWqSarmqFW1d46w@mail.gmail.com>
 <ZOR2+GwyMzPrECmd@calendula> <CAAUX2SUve335kp+RhWi6AxGZz0YXi9ArtJPswvTgNKv_qrQMLQ@mail.gmail.com>
 <ZOSHLPD0hiCW32ZS@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692698958; x=1693303758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ly0egp5VOcl3X+G6C0uwCQCFwcvwj/i+N4fbduYPoGw=;
        b=NWeOxL7sdUHim41x0czQkYP2xf8hpV3xAE1Lp/J33zXAUgqlpkAQmlpmnhWi8BKTxb
         TbyVeGkkynMMnq5+kdgpZkGv6QGoNRrfVGP1Y8OInKWkgIaeAq5y28FQAOfOMD/PxuYk
         ZF3tVcAkGQS7zlnlo/RTz/VDG1wF5lbKJs7QyfQ2J+RikG/7C1qv8VwSkNx3PL7GFDr5
         dwYBLo4+iTsc+1GKULvcy2wpJM7YCwhgGDyVp/a/UJc+4TgQVVxTqNMYmcJe4hLAtEK0
         nzoWkkcsMIb2jqvFKj3mO6vtBzgAUEKMM8/GM8F/VsZinOBZPd0IDC685JnaWhy/SScR
         zVtw==
In-Reply-To: <ZOSHLPD0hiCW32ZS@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

OK, thanks for clarifying. Below mail causes the misunderstanding.

> > I need to add option "-f ipv4", but not all entries can be updated
> > successfully. "Protocol error" is reported.
>
> EPROTO means netlink sequence numbers are not fine, which might refer
> to another userspace bug.
>
> I made another patch, error handling was not robust in the -U case (no
> exit_error was used, instead printf).
>
> Also try this patch on of the previous patch.
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821102739=
.4893-1-pablo@netfilter.org/

Pablo Neira Ayuso <pablo@netfilter.org> =E4=BA=8E2023=E5=B9=B48=E6=9C=8822=
=E6=97=A5=E5=91=A8=E4=BA=8C 18:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Aug 22, 2023 at 05:46:06PM +0800, Tony He wrote:
> > Pablo Neira Ayuso <pablo@netfilter.org> =E4=BA=8E2023=E5=B9=B48=E6=9C=
=8822=E6=97=A5=E5=91=A8=E4=BA=8C 16:51=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Tue, Aug 22, 2023 at 10:11:00AM +0800, Tony He wrote:
> > > [...]
> > > > I confirm this issue have been fixed. I even tried about 1000 flow =
entries.
> > > > root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
> > > > conntrack v1.4.7 (conntrack-tools): 1024 flow entries have been sho=
wn.
> > > > 1024
> > > > root@OpenWrt:~# ./conntrack -U -p tcp  -m 1
> > > > tcp      6 7423 ESTABLISHED src=3D192.168.1.30 dst=3D10.40.9.83
> > > > sport=3D53786 dport=3D80 packets=3D2 bytes=3D112 src=3D10.40.9.83
> > > > dst=3D10.40.9.165 sport=3D80 dport=3D53786 packets=3D1 bytes=3D60 [=
ASSURED]
> > > > mark=3D1 use=3D2
> > > > tcp      6 103 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=
=3D57656
> > > > dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.1=
65 sport=3D80
> > > > dport=3D57656 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
> > > > tcp      6 103 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=
=3D57000
> > > > dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.1=
65 sport=3D80
> > > > dport=3D57000 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
> > > > tcp      6 103 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=
=3D55730
> > > > dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.1=
65 sport=3D80
> > > > dport=3D55730 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
> > > > ......
> > > > conntrack v1.4.7 (conntrack-tools): 1023 flow entries have been upd=
ated.
> > > >
> > > > After above issue is fixed, I can not reproduce "-f ipv4" issue. Se=
ems
> > > > that we don't need patch
> > > >
> > > > https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821=
102739.4893-1-pablo@netfilter.org/
> > >
> > > This is also required because conntrack -U/-D dumps the table from th=
e
> > > kernel, then it iterates over the list of entries. If the entry
> > > expires, -U/-D will hit ENOENT, which should be ignored. This is
> > > another regressions from 1.4.6.
> >
> > Sorry, I still don't quite understand. I mean if we don't add [1] and
> > [2] , I can reproduce "Protocol error".
> > However, after adding above [1] and [2], I can not reproduce "Protocol
> > error" even though [3] is not added.
> > Is [3] used to fix "Protocol error"? If yes, why it can not be
> > reproduced by me? My test env is not changed.
> >
> > [1] https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821=
101751.4083-1-pablo@netfilter.org/
> > [2] https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821=
120105.29538-1-pablo@netfilter.org/
> > [3] https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821=
102739.4893-1-pablo@netfilter.org/
>
> [1] and [2] are sufficient to fix the problems that you reported.
>
> [3] is a different issue that you did not report that I found while
> reviewing this code.
