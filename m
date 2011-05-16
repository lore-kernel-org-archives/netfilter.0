From: Andrew Beverley <andy@andybev.com>
Subject: Re: Load Balance
Date: Mon, 16 May 2011 22:38:32 +0100
Message-ID: <1305581912.2041.15.camel@andybev-desktop>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
	 <1305480225.1708.2.camel@andybev>
	 <BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1305581914; bh=aqmCRdq4oHDUgdVjRoeD0kz2u9V5TodSnafnB
	SzpCOE=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=GUq1sp8a
	o0darSQ/2aHKTFDM9WuX5bVOeIvHJC0PYLsA1FBOam4xBWDE0Tj8sW+Qq4n82Vn1Zom
	S3uKfR2Xict2whFC0Hqzx1VWtvuBS8Vao8RHDYHFEP23Wz2nmncoFI9jatPKTg4IE0W
	mALsk5eq5H33bQgo+KYNiBWvrcz3w=
In-Reply-To: <BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: netfilter@vger.kernel.org

On Mon, 2011-05-16 at 17:24 -0300, Usu=C3=A1rio do Sistema wrote:
> >> Hello everyone, I'm deploy an test environment with load Balance i=
n my
> >> Firewall using equalize as follow below
> >>
> >> creating the load balance:
> >>
> >> ip route add default scope global equalize nexthop via 200.247.209=
=2E65
> >> weight 1  nexthop via 201.72.12.1 weight 1
> >>
> >
> > If you are using 2 completely separate ISPs, then you will need to =
do
> > more than just provide equal-weighted gateways. You will need to se=
nd
> > the packets for each connection over the same ISP. The website belo=
w
> > gives more information:
> >
> > http://www.sysresccd.org/Sysresccd-networking_en_Iptables-and-netfi=
lter-load-balancing-using-connmark
> >

<top posting fixed>

> well.... the link made available for you shows how to do load balance
> with connmark and statistic match module and it doesn't regard global
> equalize.
>=20
> so...I wonder there is diferent between them ?

Yes. The example at the link ensures that packets from the *same*
connection stream are always routed through the same ISP (hence the
reason for asking the question). If you don't do this, then each gatewa=
y
will only see half the packets for a connection stream, which although =
I
am not an expert, I guess is not a good thing.
=20
> with global equalize is very easy I only insert one line inside of th=
e
> script and all it's work! at least in my test environment it's
> working.

But is your test environment using one gateway with two routes?

> I want make an test as your how to but I'm using CentOS 5.6 and
> doesn't has libxt_statistic.so module because iptables version is
> 1.3.x

Use a different distro...

Andy
=20


