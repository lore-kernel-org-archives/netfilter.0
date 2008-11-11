From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: FTP-server on non-standard port behind DNAT, client behind SNAT
Date: Tue, 11 Nov 2008 17:54:24 +0200
Message-ID: <1226418864.16116.25.camel@casper.meteor.dp.ua>
References: <1226405797.16116.19.camel@casper.meteor.dp.ua>
	 <4919A1C4.6080207@plouf.fr.eu.org>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4919A1C4.6080207@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=92=D1=82=D0=BE, 11/11/2008 =D0=B2 16:16 +0100, Pascal Hambou=
rg =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hello,
>=20
> Pokotilenko Kostik a =C3=A9crit :
> > I have proftpd-server with virtual hosts running on 21 and 3421 por=
ts.
> > Both are masquerading to the public IP of a gateway/nat.
> >=20
> > Gateway/nat running:
> > ip_conntrack_ftp ports=3D21,3421
> > ip_nat_ftp ports=3D21,3421
> >=20
> > Using a client behind the SNAT I can connect to 21 and get director=
y
> > listing in passive mode, can connect to 3421 but CAN'T get director=
y
> > listing in passive mode.
> >=20
> > Seems like ip_conntrack_ftp/ip_nat_ftp doesn't spy 3421 port. What =
can
> > be wrong? How to debug?
> >=20
> > Directory listing on 21 goes well:
> >=20
> > ftp> pass
> > Passive mode on.
> > ftp> ls
> > 227 Entering Passive Mode (xxx,xxx,xxx,xxx,236,99).
> > 150 Opening ASCII mode data connection for file list
> > [directory listings]
> > 226 Transfer complete.
> > ftp>
> >=20
> > When trying to get directory listing on 3421 I get:
> >=20
> > ftp> pas
> > Passive mode on.
> > ftp> ls
> > 227 Entering Passive Mode (xxx,xxx,xxx,xxx,157,8).
> > ftp: connect: Connection refused
> > ftp>
> >=20
> > where xxx,xxx,xxx,xxx: public IP of gateway/nat of a FTP server.
>=20
> AFAIK, the public address in the reply to the PASV command means that=
=20
> ip_conntrack_ftp and ip_nat_ftp monitors the control connection on po=
rt=20
> 3421 too, unless the server itself advertised the public address.

The server advertise the public address itself, it's proftpd with this
option:
<VirtualHost yyy.yyy.yyy.yyy>
  ...
  MasqueradeAddress xxx,xxx,xxx,xxx
  ...
</VirtualHost>

where yyy.yyy.yyy.yyy: privat IP.

> Could=20
> it be the client-side SNAT which rejects the data connection ?

No, all outgoing connection are allowed. Moreover on port 21 data
connection port is within same range, so this is not the case.

--=20
=D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=B5=D0=BD=D0=BA=D0=BE =D0=9A=
=D0=BE=D1=81=D1=82=D0=B8=D0=BA <casper@meteor.dp.ua>

