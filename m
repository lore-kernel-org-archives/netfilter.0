From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: ebtables mac update
Date: Tue, 29 Jun 2010 13:43:25 +0300
Message-ID: <1277808205.3791.17.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

Hi,

We have two building with local networks connected by Zyxel Prestige 84=
1
and 841C VDSL-modems. They work in transparent bridge mode.

On one end 841 is connected directly to a switch. On other 841C
connected to a linux router wich is also connected to a switch, and
those interfaces bridged.

There is a problem, when a computer is being moved from one building to
another it stops seeing other end of the bridge until modems are
rebooted.

I was thinking the problem is in modems' part, but in Zyxel support I'v=
e
been told they are just dumn transparent bridges and doesn't behave lik=
e
that.

So, the only device left that may cause such problem is linux
router/bridge.

Is there any kind of behaviour of linux bridge (ebtables) that may caus=
e
such problem?

P.S. there is no ebtables rules at all, no iptables related rules.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

