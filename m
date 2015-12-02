From: Bill <boober95@rogers.com>
Subject: Re: Connection tracking Cli and an ALG for DNS
Date: Wed, 2 Dec 2015 17:36:11 -0500
Message-ID: <201512021736.11255.boober95@rogers.com>
References: <201511041332.09522.boober95@rogers.com> <201511191352.03564.boober95@rogers.com> <565ED22F.7070903@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s2048; t=1449095772; bh=TSRwSQ1/sHVJVJAy++ynngAn5Tieuv8rRGCX3l61Wjw=; h=From:To:Subject:Date:Cc:References:In-Reply-To:From:Subject; b=fR97ydZT02U6iWkKYvAwS5iBe35OrRzVMoR9bt6EaqaDAUew04z3bt9+JVtkEExGFWYlYHM3q8+ANCyXZVMnQC1outMUafG+iHPAnNLX2hWfTmU1LrHbTiJ20Uv+2cFabj1F06Vw3ee/cPVoObVNGuksoQcBNA3UuzVAu9o7U3cBOb8qbVvIi0pk/czRTAE0oCx2/wFUCZWvrvtKu5zI9pRb+4YrnJP1zh1Lq6KuDqOLpbCGpif8CkwokasjoMhxoXvYz+It1jGvLmpMIE+2t/sb/vgv2cpfspmFonqOImpti47yx3oPYXoAw+K6x7ZNkYmRKLliWlscV+u5T9yUlQ==
In-Reply-To: <565ED22F.7070903@free.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Adel Belhouane <bugs.a.b@free.fr>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

No worries, your comments got me thinking more about my problem, which =
is=20
always a good thing, thanks again.

/bill


On Wednesday 02 December 2015 06:12, Adel Belhouane wrote:
> Le 19/11/2015 19:52, Bill a =E9crit :
> > For reference here is my diagram again:
> >>>> local host               dns/nat gateway              remote hos=
t
> >>>> 192.168.20.171      192.168.20.170                192.168.30.172
> >>>>                                192.168.30.170
> >>>> inside               ----->>> nat >>> ------          outside
> >
> > As you can see, DNAT would no do for my requirements since I'd have=
 to
> > add/delete iptables rules, which I supposed I could do, but doesn't=
 seem
> > te right approach.
> >
> > Now since my original posting I have been reading code and have man=
ged to
> > create an e'expect' connection by upgrading to the latest 4.4 kerne=
l.  In
> > this version I find the sample test 'create-expect' works.
> >
> > After succeeding with this I realize I may need to build a kernel m=
odule
> > for the expectation and have started looking at the kernel code for=
 this,
> > such as those for FTP etc.
>
> I didn't get before that the "ALG" part was essential. I read a summa=
ry
> here:
> https://www.juniper.net/documentation/en_US/junos12.1x47/topics/conce=
pt/sec
>urity-alg-dns-overview.html
>
> So I still don't get exactly what you are looking for (sorry), but I
> realize it's related to DNS data content, not just connections. Sorry=
 to
> have waisted your time with my replies and good luck with your projec=
t.
>
> > /bill
>
> regards,
> Adel BELHOUANE.
