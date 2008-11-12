From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: FTP-server on non-standard port behind DNAT, client behind SNAT
Date: Wed, 12 Nov 2008 11:09:06 +0200
Message-ID: <1226480946.6370.1.camel@casper.meteor.dp.ua>
References: <1226405797.16116.19.camel@casper.meteor.dp.ua>
	 <4919A1C4.6080207@plouf.fr.eu.org>
	 <1226418864.16116.25.camel@casper.meteor.dp.ua>
	 <4919D9E5.2090603@plouf.fr.eu.org>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4919D9E5.2090603@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=92=D1=82=D0=BE, 11/11/2008 =D0=B2 20:15 +0100, Pascal Hambou=
rg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Pokotilenko Kostik a =C3=A9crit :
> >=20
> > The server advertise the public address itself, it's proftpd with t=
his
> > option:
> > <VirtualHost yyy.yyy.yyy.yyy>
> >   ...
> >   MasqueradeAddress xxx,xxx,xxx,xxx
> >   ...
> > </VirtualHost>
> >=20
> > where yyy.yyy.yyy.yyy: privat IP.
>=20
> Couldn't this disrupt the FTP connection tracking which expects to se=
e=20
> the private address ? This option should not be required, as ip_nat_f=
tp=20
> is able to translate addresses in the control flow.

You are extremely right :) That was the case, removing MasqueradeAddres=
s
made it work!

I was unable to find the information on how does conntrack_ftp/nat_ftp
work, otherwise I=20
would found out the right way.

Thanks alot, you saved my time.

P.S. Sorry, previous post acidently went privat

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

