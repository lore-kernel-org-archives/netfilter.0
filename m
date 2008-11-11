From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FTP-server on non-standard port behind DNAT, client behind SNAT
Date: Tue, 11 Nov 2008 20:15:49 +0100
Message-ID: <4919D9E5.2090603@plouf.fr.eu.org>
References: <1226405797.16116.19.camel@casper.meteor.dp.ua>	 <4919A1C4.6080207@plouf.fr.eu.org> <1226418864.16116.25.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1226418864.16116.25.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pokotilenko Kostik a =E9crit :
>=20
> The server advertise the public address itself, it's proftpd with thi=
s
> option:
> <VirtualHost yyy.yyy.yyy.yyy>
>   ...
>   MasqueradeAddress xxx,xxx,xxx,xxx
>   ...
> </VirtualHost>
>=20
> where yyy.yyy.yyy.yyy: privat IP.

Couldn't this disrupt the FTP connection tracking which expects to see=20
the private address ? This option should not be required, as ip_nat_ftp=
=20
is able to translate addresses in the control flow.
