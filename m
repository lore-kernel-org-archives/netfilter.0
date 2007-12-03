From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Problem with address forwarding
Date: Mon, 03 Dec 2007 16:08:13 +0200
Message-ID: <1196690893.2629.23.camel@localhost.localdomain>
References: <20071203125238.GN4452@jnamobiled.ite.pl>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071203125238.GN4452@jnamobiled.ite.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jakub Nadolny <jakub.nadolny@carrywater.pl>
Cc: netfilter@vger.kernel.org

=F7 =F0=CE=C4, 03/12/2007 =D7 13:52 +0100, Jakub Nadolny =D0=C9=DB=C5=D4=
:
> Hi,
>=20
> I try to do simple address:port forwarding and I can not get it
> working. I want to have all traffic send to some.internet.address:som=
e_port=20
> to be forwarded to 192.168.155.123:80.
>=20
> So I guess following rule should work fine:
> iptables -t nat -A PREROUTING -p tcp -d some.internet.address --dport=
 1234 -j DNAT --to 192.168.155.123:80
>=20
> But when afterthat I enter some.internet.address:1234 in firefox I ca=
n
> not see webpage which is located at 192.168.155.123. It tries to conn=
ect
> but there is no result.
>=20
> What could be the reason of that?

Some rules in the FILTER table could block that traffic. There also
routing problems may occur.

You can make sure this is the case by explicitelly allowing such traffi=
c
by:

iptables -I FORWARD 1 -p tcp -d 192.168.155.123 -j ACCEPT
iptables -I FORWARD 2 -p tcp -s 192.168.155.123 -j ACCEPT

Also if you are talking about http traffic there is one thing to know.
HTTP 1.1 transmits domain part of the URL in the request which makes
host-based virtual hosting possible. That means if there is a site name=
d
sometime.com and it has ip 1.2.3.4, and you redirected connections to
1.2.3.4:80 to 1.2.3.5:80 on the router, server 1.2.3.5 will get those
packets, but it's www-server will see that requests are for site
somesite.com and if there is no virtualhost for somesite.com and no
default virtualhost www-server may show you nothing.

You can see whether the packets reach the www-server by looking at the
www-server logs or running tcpdump on it.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

