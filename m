From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Is it possible to queue same packet into two IMQ interfaces
	sequentially?
Date: Wed, 06 Jan 2010 23:25:30 +0200
Message-ID: <1262813130.13763.20.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

Hi, need help with shaping in complex setup.

Is it possible to queue same packet into two IMQ interfaces
sequentially, so that the packet got queued into imq1, then into imq2?

I know it's possible to do so by putting it in imq1 in PREROUTING and i=
n
imq2 in POSTROUTING, but one IMQ device in PREROUTING (imq0) and one IM=
Q
device in POSTROUTING (imq1) already occupied for another task.

I have complex HTB channel division between 7 interfaces/vlans/bridge
made on top of IMQ for both PREROUTING and POSTROUTING. Problem is that
I also need to rate limit some traffic independently of the rest
shaping.

In previous setup there were 2 routers, one did HTB channel division an=
d
other did rate limits by "tc filter police rate", now I'm left with onl=
y
one router. I was mistakenly(?) thought that I can chain IMQs so that
same traffic first come to say imq1 then imq2. Are there other ways to
combine HTB channel division with independant rate limits?

I can't do rate limit in existing PREROUTING/POSTROUTING (imq0/imq1)
classes, because those contain trees with classes for all directions fo=
r
incomming/outgoing. So I would have to insert several "tc filter police
rate" for each direction putting underlimit traffic to apropriate class
and drop overlimit, but this way I'll get say 256kbit/s to Internet +
256kbit/s to Servers + 256kbit/s to Router itself which is not what
really needed. There should be one limit to all directions.

I also can't do that in normal way at egress in each interface b/c each
rate limit should be across multiple interfaces.

Is there any other solution for this task using only one linux router?

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

