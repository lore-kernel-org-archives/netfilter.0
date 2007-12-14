From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: RE: Network Communication Issues
Date: Fri, 14 Dec 2007 10:23:40 +0200
Message-ID: <1197620620.2970.2.camel@localhost.localdomain>
References: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main>
	 <4760800B.7040601@riverviewtech.net>
	 <003e01c83db1$25d10460$fe02a8c0@brammo.main>
	 <47617846.5090101@riverviewtech.net>
	 <004001c83db7$cd376bd0$fe02a8c0@brammo.main>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004001c83db7$cd376bd0$fe02a8c0@brammo.main>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jacob Lear <jlear@brammo.com>
Cc: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

=F7 =FE=D4=D7, 13/12/2007 =D7 10:41 -0800, Jacob Lear =D0=C9=DB=C5=D4:

> I don't think that's the problem... based on what I've read online, W=
indows
> doesn't like having more than 1 Default Gateway -- it confuses it (bi=
g
> shocker there huh?). I tried it that way at first and it was complain=
ing
> when I tried to save the TCP/IP properties. I don't think the routing=
 was
> working right either... I seem to recall some issues.

Because that way windows will get two default gateways, which it thinks
is not correct. You can add only one default gateway (via TCP/IP
properties), and if you need more you can add one non-default with a
comamnd "route add...".=20

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

