From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FTP-server on non-standard port behind DNAT, client behind SNAT
Date: Tue, 11 Nov 2008 16:16:20 +0100
Message-ID: <4919A1C4.6080207@plouf.fr.eu.org>
References: <1226405797.16116.19.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1226405797.16116.19.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Pokotilenko Kostik a =E9crit :
> I have proftpd-server with virtual hosts running on 21 and 3421 ports=
=2E
> Both are masquerading to the public IP of a gateway/nat.
>=20
> Gateway/nat running:
> ip_conntrack_ftp ports=3D21,3421
> ip_nat_ftp ports=3D21,3421
>=20
> Using a client behind the SNAT I can connect to 21 and get directory
> listing in passive mode, can connect to 3421 but CAN'T get directory
> listing in passive mode.
>=20
> Seems like ip_conntrack_ftp/ip_nat_ftp doesn't spy 3421 port. What ca=
n
> be wrong? How to debug?
>=20
> Directory listing on 21 goes well:
>=20
> ftp> pass
> Passive mode on.
> ftp> ls
> 227 Entering Passive Mode (xxx,xxx,xxx,xxx,236,99).
> 150 Opening ASCII mode data connection for file list
> [directory listings]
> 226 Transfer complete.
> ftp>
>=20
> When trying to get directory listing on 3421 I get:
>=20
> ftp> pas
> Passive mode on.
> ftp> ls
> 227 Entering Passive Mode (xxx,xxx,xxx,xxx,157,8).
> ftp: connect: Connection refused
> ftp>
>=20
> where xxx,xxx,xxx,xxx: public IP of gateway/nat of a FTP server.

AFAIK, the public address in the reply to the PASV command means that=20
ip_conntrack_ftp and ip_nat_ftp monitors the control connection on port=
=20
3421 too, unless the server itself advertised the public address. Could=
=20
it be the client-side SNAT which rejects the data connection ?
