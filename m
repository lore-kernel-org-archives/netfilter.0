From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: unregister_netdevice: waiting for tun1 to become free.
Date: Thu, 16 Apr 2009 02:36:48 +0300
Message-ID: <1239838608.4307.26.camel@casper.meteor.dp.ua>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

Hi there.

I'm finally got chance to setup advanced IMQ shaping on my router. As
far as I can see shaping works as expected. BUT, there is a problem to
reboot/shutdown router, it gets flooded by this message, and there is n=
o
way to correctly shutdown, only hard poweroff:

unregister_netdevice: waiting for tun1 to become free. Usage count =3D =
2
unregister_netdevice: waiting for tun1 to become free. Usage count =3D =
2
unregister_netdevice: waiting for tun1 to become free. Usage count =3D =
2
unregister_netdevice: waiting for tun1 to become free. Usage count =3D =
2

Google shows there were problems like this on 2.6.8 with CBQ, which is
belived to be fixed long ago. But, also, I don't use CBQ.

About my system:

Debian Etch with custom kernel

# uname -a
Linux router 2.6.18.set+ipm+cond+conl+time+esfq+imq02 #1 SMP Tue Feb 24
18:53:56 EET 2009 i686 GNU/Linux

this is Etch kernel rebuild with support for ipmark, condition,
connlimit, time, esfq, imq.

patch-o-matic-ng-20080929
esfq-2.6.19.2
iptables-1.3.6-imq.diff
linux-2.6.18-imq.diff

I've prepared and installed this kernel/iptables/iproute few months ago=
,
there were no problems. imq, esfq was not used until today.

I use 2 imq devices, one for PREROUTING shaping at input and one for
POSTROUTING shaping at output.

Shaping is done with HTB and ESFQ. Input classifiers are -j MARK + tc
fwmark, output classifiers are just -j CLASSIFY.

What I'm doing wrong?

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

