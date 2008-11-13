From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: www.adobe.com
Date: Thu, 13 Nov 2008 10:59:31 +0200
Message-ID: <1226566771.29859.7.camel@casper.meteor.dp.ua>
References: <20081113075231.50345b2c@gmail.com>
	 <1226565204.29859.3.camel@casper.meteor.dp.ua>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1226565204.29859.3.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: TheOldFellow <theoldfellow@gmail.com>
Cc: netfilter@vger.kernel.org

=F7 =FE=D4=D7, 13/11/2008 =D7 10:33 +0200, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=
=CF =EB=CF=D3=D4=C9=CB =D0=C9=DB=C5=D4:
> =F7 =FE=D4=D7, 13/11/2008 =D7 07:52 +0000, TheOldFellow =D0=C9=DB=C5=D4=
:
> > My firewall works well, except that I can't get any kind of access =
to
> > www.adobe.com.
> >=20
> > This is typical:
> >=20
> > # ping www.adobe.com
> > PING www.wip3.adobe.com (192.150.18.101): 56 data bytes
> > 64 bytes from 192.150.18.101: icmp_seq=3D0 ttl=3D243 time=3D194.939=
 ms
> > 64 bytes from 192.150.18.101: icmp_seq=3D1 ttl=3D243 time=3D193.576=
 ms
> > 64 bytes from 192.150.18.101: icmp_seq=3D2 ttl=3D243 time=3D194.612=
 ms
> > 64 bytes from 192.150.18.101: icmp_seq=3D3 ttl=3D243 time=3D194.844=
 ms
> > --- www.wip3.adobe.com ping statistics ---
> > 4 packets transmitted, 4 packets received, 0% packet loss
> > round-trip min/avg/max/stddev =3D 193.576/194.493/194.939/0.542 ms
> >=20
> > so far so good...
> >=20
> > # wget http://www.adobe.com/index.html
> > --07:45:04--  http://www.adobe.com/index.html
> >            =3D> `index.html'
> > Resolving www.adobe.com... 192.150.18.101
> > Connecting to www.adobe.com|192.150.18.101|:80...=20
> >=20
> > it just times out - browsers are the same.
> >=20
> > Looking at the log shows the following warnings:
> >=20
> > IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:=
74:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 =
PREC=3D0x00 TTL=3D53 ID=3D9637 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20
> > IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:=
74:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 =
PREC=3D0x00 TTL=3D53 ID=3D45688 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20
> > IPTABLES:INPUT IN=3Dnet OUT=3D MAC=3D00:a0:c9:43:8f:77:00:90:96:f7:=
74:42:08:00 SRC=3D192.150.18.101 DST=3D192.168.1.2 LEN=3D44 TOS=3D0x00 =
PREC=3D0x00 TTL=3D53 ID=3D37819 PROTO=3DTCP SPT=3D80 DPT=3D3723 WINDOW=3D=
20498 RES=3D0x00 URGP=3D0=20
>=20
> It does seem strange for www.adobe.com to have privat IP 192.150.18.1=
01
> which is also as I can see the IP of your box. You are pinging your
> local box but there are no web server on your box as I see. Either yo=
u
> edited addresses wrong or your DNS server (or /etc/hosts) has wrong
> record for www.adobe.com.

Sorry, I got it wrong, 192.150.18.101 is not privat, it's really addres=
s
of www.adobe.com

About your logs, if you use -j LOG -j DROP scheme, just find the
blocking rule.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

