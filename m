From: Aidas Kasparas <a.kasparas@gmc.lt>
Subject: Re: Capturing a C Class range dynamically into an ipset table within
 iptables. Possible?&#8207;
Date: Fri, 15 Jun 2012 05:52:21 +0300
Message-ID: <4FDAA365.7040007@gmc.lt>
References: <20120614163444.7wwufjwdc0ok4osc@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120614163444.7wwufjwdc0ok4osc@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?Sm9zw6kgUGFibG8gUMOpcmV6?= <josepablo@correo.co.cr>
Cc: netfilter@vger.kernel.org

On 2012.06.15 01:34, Jos=C3=A9 Pablo P=C3=A9rez wrote:
> Currently with ipset iam able to send to a table the inidivual (/32)
> source IP of a connection...
>=20
> I need a way to send to iptables the C Class to an ipset .
>=20
> In other words I need the historical list of last 30 min of C class
> ranges that have requested my server.
>=20
> I need this preferably done without something outside of iptables (su=
ch
> as a daemon).
>=20

just use parameter netmask 24 while creating ipset and you're done.

test:~# ipset create test hash:ip timeout 60 netmask 24
test:~# ipset add test 127.0.1.2
test:~# ipset add test 127.3.4.5
test:~# ipset list test
Name: test
Type: hash:ip
Header: family inet hashsize 1024 maxelem 65536 netmask 24 timeout 60
Size in memory: 16632
References: 0
Members:
127.0.1.0 timeout 50
127.3.4.0 timeout 55
test:~# ipset test test 127.0.1.1
127.0.1.1 is in set test.
test:~#



--=20
Aidas Kasparas
