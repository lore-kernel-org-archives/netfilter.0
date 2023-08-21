From: Tony He <huangya90@gmail.com>
Subject: Re: Fwd: question about using conntrack to change the mark
Date: Mon, 21 Aug 2023 19:26:54 +0800
Message-ID: <CAAUX2SVPgu5Mp8DAhEGzW7Y3UB2k++_qaVeZ3NbHZu4Yfw4bkw@mail.gmail.com>
References: <CAAUX2SVTLxtpzsMnKWCpjRZwAKn391rm5T=y=oHPQ_T1w2UpBA@mail.gmail.com>
 <CAAUX2SXBVr5pG0vWvhkvrRLJv+ym6i34UrkUpRzS5FQHxh5ivg@mail.gmail.com> <ZOM8e8u+BK3jBNrE@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692617226; x=1693222026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++pPuxgU4qJv9VjwDNk1Iz4xgih/GZ6jURbA+WBPzvg=;
        b=R9RmVTXc6wKH2SNKbI8z7O3UwUloNhaiSCR40pReNwn2EtF6Wl+SnROGMKjQ5W8CR2
         deZIpJ8XlyypaBiIDa5i2M8SzRtVrv7CS9sR43PEav81MEdC99CbJuCXkrGwmf+nwxVl
         ZRD1BVT05b/l3+S9wPTm+18ut7NV7yS69m2Vs7O57d9J+L767QiKMcm4E0pv7kyzGdcj
         4jcPN1q8qsED6r8B/7wVVhsy5MXT4OXbv0wrQbbr+XGSYwetCgePah30Eczl1oz8Qtyx
         aTdqHaWoH1gntgX2eU/kH3EEIJhytX3Biw/IKgQ3NckPLuLEvrGpxhQnLKz3lG65foKj
         e0gg==
In-Reply-To: <ZOM8e8u+BK3jBNrE@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,


Pablo Neira Ayuso <pablo@netfilter.org> =E4=BA=8E2023=E5=B9=B48=E6=9C=8821=
=E6=97=A5=E5=91=A8=E4=B8=80 18:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Aug 21, 2023 at 03:44:54PM +0800, Tony He wrote:
> > Hi,
> >
> > I am using Openwrt. The version is:
> > root@OpenWrt:/# cat /etc/openwrt_release
> > DISTRIB_ID=3D'OpenWrt'
> > DISTRIB_RELEASE=3D'23.05.0-rc2'
> > DISTRIB_REVISION=3D'r23228-cd17d8df2a'
> > DISTRIB_TARGET=3D'ipq806x/generic'
> > DISTRIB_ARCH=3D'arm_cortex-a15_neon-vfpv4'
> > DISTRIB_DESCRIPTION=3D'OpenWrt 23.05.0-rc2 r23228-cd17d8df2a'
> > DISTRIB_TAINTS=3D''
> >
> > And kernel is:
> > root@OpenWrt:/# uname -a
> > Linux OpenWrt 5.15.118 #0 SMP Mon Jun 26 11:20:39 2023 armv7l GNU/Linux
> >
> >
> > Seems that I can not use command " conntrack -U -p tcp -m 1" to change =
the mark.
> > root@OpenWrt:/# conntrack  -L  -p tcp |grep mark=3D0 |wc -l
> > conntrack v1.4.7 (conntrack-tools): 302 flow entries have been shown.
> > 302
> > root@OpenWrt:/# conntrack -U -p tcp -m 1
> > Operation failed: Not supported
> > conntrack v1.4.7 (conntrack-tools): Operation failed: Not supported
>
> Please, try this patch:
>
> https://patchwork.ozlabs.org/project/netfilter-devel/patch/20230821101751=
.4083-1-pablo@netfilter.org/
This patch works when the conntrack sessions are not many. When there are a=
bout
300 sessions, another error "No buffer space available" is reported.

Works when sessions are not many:
root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
conntrack v1.4.7 (conntrack-tools): 204 flow entries have been shown.
204
root@OpenWrt:~# ./conntrack -U -p tcp -m 1
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58130
dport=3D80 packets=3D11 bytes=3D742 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58130 packets=3D12 bytes=3D19626 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58858
dport=3D80 packets=3D10 bytes=3D654 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58858 packets=3D9 bytes=3D15765 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59750
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59750 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59644
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59644 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58312
dport=3D80 packets=3D9 bytes=3D602 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58312 packets=3D12 bytes=3D23161 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57910
dport=3D80 packets=3D11 bytes=3D754 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D57910 packets=3D13 bytes=3D22574 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58276
dport=3D80 packets=3D11 bytes=3D778 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58276 packets=3D12 bytes=3D19626 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59336
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59336 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59238
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59238 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59514
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59514 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59104
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59104 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58170
dport=3D80 packets=3D9 bytes=3D602 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58170 packets=3D12 bytes=3D19626 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58502
dport=3D80 packets=3D9 bytes=3D554 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58502 packets=3D8 bytes=3D11369 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59744
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59744 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58556
dport=3D80 packets=3D11 bytes=3D730 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58556 packets=3D12 bytes=3D18817 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59464
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59464 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59232
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59232 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58806
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58806 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59716
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59716 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59550
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59550 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59240
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59240 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57942
dport=3D80 packets=3D9 bytes=3D578 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D57942 packets=3D11 bytes=3D16678 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58292
dport=3D80 packets=3D10 bytes=3D642 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58292 packets=3D10 bytes=3D15817 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59190
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59190 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57876
dport=3D80 packets=3D10 bytes=3D618 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D57876 packets=3D11 bytes=3D15230 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59540
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59540 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58626
dport=3D80 packets=3D11 bytes=3D730 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58626 packets=3D11 bytes=3D18765 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59016
dport=3D80 packets=3D8 bytes=3D514 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59016 packets=3D7 bytes=3D12126 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59630
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59630 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58584
dport=3D80 packets=3D10 bytes=3D666 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58584 packets=3D11 bytes=3D17317 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58458
dport=3D80 packets=3D11 bytes=3D730 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58458 packets=3D11 bytes=3D17317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59604
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59604 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59252
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59252 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59598
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59598 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58810
dport=3D80 packets=3D4 bytes=3D216 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58810 packets=3D3 bytes=3D172 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58196
dport=3D80 packets=3D11 bytes=3D750 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58196 packets=3D11 bytes=3D17317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57922
dport=3D80 packets=3D13 bytes=3D870 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D57922 packets=3D12 bytes=3D16730 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58844
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58844 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57944
dport=3D80 packets=3D12 bytes=3D798 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D57944 packets=3D13 bytes=3D19039 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59192
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59192 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58236
dport=3D80 packets=3D9 bytes=3D602 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58236 packets=3D9 bytes=3D14317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59350
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59350 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58450
dport=3D80 packets=3D10 bytes=3D666 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58450 packets=3D9 bytes=3D14317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58992
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58992 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59570
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59570 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57916
dport=3D80 packets=3D10 bytes=3D666 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D57916 packets=3D15 bytes=3D28470 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58716
dport=3D80 packets=3D10 bytes=3D666 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58716 packets=3D9 bytes=3D14317 [ASSURED] mark=3D1 use=3D2
tcp      6 110 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58652
dport=3D80 packets=3D13 bytes=3D874 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58652 packets=3D11 bytes=3D15869 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59266
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59266 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D57852
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D57852 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59280
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59280 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 111 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58476
dport=3D80 packets=3D11 bytes=3D746 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58476 packets=3D9 bytes=3D12869 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59296
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59296 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58028
dport=3D80 packets=3D10 bytes=3D650 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58028 packets=3D12 bytes=3D15921 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59396
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59396 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58404
dport=3D80 packets=3D10 bytes=3D674 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58404 packets=3D14 bytes=3D21817 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59704
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59704 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58316
dport=3D80 packets=3D11 bytes=3D778 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58316 packets=3D13 bytes=3D21126 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58432
dport=3D80 packets=3D9 bytes=3D566 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58432 packets=3D10 bytes=3D15817 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59410
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59410 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58188
dport=3D80 packets=3D11 bytes=3D726 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58188 packets=3D13 bytes=3D15973 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58392
dport=3D80 packets=3D9 bytes=3D590 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58392 packets=3D11 bytes=3D18126 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59114
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59114 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58890
dport=3D80 packets=3D11 bytes=3D734 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58890 packets=3D11 bytes=3D18126 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58548
dport=3D80 packets=3D9 bytes=3D590 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D58548 packets=3D9 bytes=3D12869 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59068
dport=3D80 packets=3D11 bytes=3D762 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D59068 packets=3D11 bytes=3D18765 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D58358
dport=3D80 packets=3D10 bytes=3D666 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D58358 packets=3D11 bytes=3D21661 [ASSURED] mark=3D1 use=3D2
tcp      6 99 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D59020
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D59020 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
conntrack v1.4.7 (conntrack-tools): 203 flow entries have been updated.

Many conntions:
root@OpenWrt:~# ./conntrack -L -p tcp |wc -l
conntrack v1.4.7 (conntrack-tools): 313 flow entries have been shown.
313
root@OpenWrt:~# ./conntrack -U -p tcp -m 1
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44998
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44998 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45460
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45460 packets=3D8 bytes=3D11369 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46376
dport=3D80 packets=3D10 bytes=3D670 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D46376 packets=3D8 bytes=3D15713 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44002
dport=3D80 packets=3D11 bytes=3D694 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44002 packets=3D12 bytes=3D18178 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44250
dport=3D80 packets=3D10 bytes=3D630 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44250 packets=3D11 bytes=3D20213 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44056
dport=3D80 packets=3D11 bytes=3D750 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44056 packets=3D11 bytes=3D18765 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44642
dport=3D80 packets=3D10 bytes=3D650 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44642 packets=3D11 bytes=3D19574 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45632
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45632 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 97 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43932
dport=3D80 packets=3D11 bytes=3D714 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D43932 packets=3D16 bytes=3D24178 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45228
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45228 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 97 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44246
dport=3D80 packets=3D11 bytes=3D778 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44246 packets=3D13 bytes=3D21765 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45010
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45010 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46366
dport=3D80 packets=3D11 bytes=3D738 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D46366 packets=3D10 bytes=3D19522 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44192
dport=3D80 packets=3D10 bytes=3D654 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44192 packets=3D12 bytes=3D19626 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44964
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44964 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45686
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45686 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46008
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46008 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45666
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45666 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46262
dport=3D80 packets=3D12 bytes=3D834 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D46262 packets=3D12 bytes=3D21074 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45560
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45560 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44124
dport=3D80 packets=3D12 bytes=3D818 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44124 packets=3D11 bytes=3D18765 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44816
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44816 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45022
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45022 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43922
dport=3D80 packets=3D10 bytes=3D690 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D43922 packets=3D12 bytes=3D21074 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44154
dport=3D80 packets=3D10 bytes=3D654 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44154 packets=3D9 bytes=3D12869 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46130
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46130 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44908
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44908 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 97 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43858
dport=3D80 packets=3D9 bytes=3D602 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D43858 packets=3D11 bytes=3D20213 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45680
dport=3D80 packets=3D11 bytes=3D706 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D45680 packets=3D10 bytes=3D17265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45078
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45078 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 98 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44360
dport=3D80 packets=3D10 bytes=3D666 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44360 packets=3D10 bytes=3D14369 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46050
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46050 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45752
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45752 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44164
dport=3D80 packets=3D13 bytes=3D930 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44164 packets=3D15 bytes=3D23317 [ASSURED] mark=3D1 use=3D2
tcp      6 97 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43914
dport=3D80 packets=3D12 bytes=3D830 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D43914 packets=3D13 bytes=3D18869 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46330
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46330 packets=3D8 bytes=3D11369 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45120
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45120 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44584
dport=3D80 packets=3D10 bytes=3D630 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44584 packets=3D10 bytes=3D15178 [ASSURED] mark=3D1 use=3D2
tcp      6 98 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44476
dport=3D80 packets=3D11 bytes=3D738 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44476 packets=3D11 bytes=3D15869 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45546
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45546 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46278
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46278 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43790
dport=3D80 packets=3D10 bytes=3D690 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D43790 packets=3D14 bytes=3D22626 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44984
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44984 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44968
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44968 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 101 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44560
dport=3D80 packets=3D4 bytes=3D216 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44560 packets=3D2 bytes=3D112 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43758
dport=3D80 packets=3D11 bytes=3D746 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D43758 packets=3D15 bytes=3D27022 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44798
dport=3D80 packets=3D12 bytes=3D806 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44798 packets=3D10 bytes=3D18713 [ASSURED] mark=3D1 use=3D2
tcp      6 101 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46422
dport=3D80 packets=3D4 bytes=3D216 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46422 packets=3D2 bytes=3D112 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46206
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46206 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 101 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44432
dport=3D80 packets=3D11 bytes=3D730 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44432 packets=3D10 bytes=3D15817 [ASSURED] mark=3D1 use=3D2
tcp      6 97 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43948
dport=3D80 packets=3D9 bytes=3D566 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D43948 packets=3D10 bytes=3D14539 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44906
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44906 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 98 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44274
dport=3D80 packets=3D10 bytes=3D666 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44274 packets=3D9 bytes=3D14317 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45172
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45172 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 101 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46194
dport=3D80 packets=3D4 bytes=3D216 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46194 packets=3D3 bytes=3D172 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45454
dport=3D80 packets=3D6 bytes=3D398 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45454 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 101 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44614
dport=3D80 packets=3D4 bytes=3D216 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44614 packets=3D3 bytes=3D172 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43906
dport=3D80 packets=3D11 bytes=3D742 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D43906 packets=3D11 bytes=3D18765 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44680
dport=3D80 packets=3D11 bytes=3D734 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44680 packets=3D10 bytes=3D18074 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45690
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45690 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44726
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44726 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45094
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45094 packets=3D7 bytes=3D11317 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43844
dport=3D80 packets=3D8 bytes=3D526 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D43844 packets=3D8 bytes=3D14265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D46344
dport=3D80 packets=3D9 bytes=3D602 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D46344 packets=3D8 bytes=3D12817 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45712
dport=3D80 packets=3D8 bytes=3D502 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45712 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44682
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D44682 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D43918
dport=3D80 packets=3D11 bytes=3D762 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D43918 packets=3D13 bytes=3D21765 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D44048
dport=3D80 packets=3D10 bytes=3D682 src=3D10.40.9.83 dst=3D10.40.9.165 spor=
t=3D80
dport=3D44048 packets=3D12 bytes=3D19626 [ASSURED] mark=3D1 use=3D2
tcp      6 96 TIME_WAIT src=3D192.168.1.30 dst=3D10.40.9.83 sport=3D45714
dport=3D80 packets=3D7 bytes=3D450 src=3D10.40.9.83 dst=3D10.40.9.165 sport=
=3D80
dport=3D45714 packets=3D6 bytes=3D11265 [ASSURED] mark=3D1 use=3D2
conntrack v1.4.7 (conntrack-tools): Operation failed: No buffer space avail=
able

>
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
I will test this patch after above issue is fixed.
>
> Thanks for reporting.

Tony
