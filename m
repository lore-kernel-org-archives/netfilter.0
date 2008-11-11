From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: FTP-server on non-standard port behind DNAT, client behind SNAT
Date: Tue, 11 Nov 2008 14:16:37 +0200
Message-ID: <1226405797.16116.19.camel@casper.meteor.dp.ua>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

I have proftpd-server with virtual hosts running on 21 and 3421 ports.
Both are masquerading to the public IP of a gateway/nat.

Gateway/nat running:
ip_conntrack_ftp ports=3D21,3421
ip_nat_ftp ports=3D21,3421

Using a client behind the SNAT I can connect to 21 and get directory
listing in passive mode, can connect to 3421 but CAN'T get directory
listing in passive mode.

Seems like ip_conntrack_ftp/ip_nat_ftp doesn't spy 3421 port. What can
be wrong? How to debug?

Directory listing on 21 goes well:

ftp> pass
Passive mode on.
ftp> ls
227 Entering Passive Mode (xxx,xxx,xxx,xxx,236,99).
150 Opening ASCII mode data connection for file list
[directory listings]
226 Transfer complete.
ftp>

When trying to get directory listing on 3421 I get:

ftp> pas
Passive mode on.
ftp> ls
227 Entering Passive Mode (xxx,xxx,xxx,xxx,157,8).
ftp: connect: Connection refused
ftp>

where xxx,xxx,xxx,xxx: public IP of gateway/nat of a FTP server.

Gateway/nat running Debian etch, recompiled standard kernel 2.6.18 with
some patches from patch-o-matic-ng and imq.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

