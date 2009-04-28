From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Limiting outbound connections and using the QUEUE target
Date: Tue, 28 Apr 2009 10:45:11 +0300
Message-ID: <1240904711.4256.16.camel@casper.meteor.dp.ua>
References: <625965.25951.qm@web45309.mail.sp1.yahoo.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <625965.25951.qm@web45309.mail.sp1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: samsonpablo@yahoo.com
Cc: netfilter@vger.kernel.org

=F7 =F0=CE=C4, 27/04/2009 =D7 16:00 -0700, samsonpablo@yahoo.com =D0=C9=
=DB=C5=D4:
> i'm using a linux host as a router to perform some security testing. =
The testing is typically towards tcp based services. Currently the rout=
er is setup like this, with my test traffic coming into the box on eth0=
, exiting on eth1:
>=20
> eth0 192.168.1.1/30
> eth1 10.1.0.1/23
>=20
> Due to policy from a networking group, I need to ensure that the numb=
er of established connections during my testing never exceeds 20 connec=
tions thru other devices that i may traverse beyond my linux router. I'=
m not as concerned with bandwidth as i am with state tables on downstre=
am devices i have no control over. It seems to me that this could be ac=
complished if i can ensure that established connections from eth1 do no=
t exceed 20 connections.
>=20
> So, after a really quick peek at iptables(8) i came up with:
>=20
> iptables -A OUTPUT -o eth1 -p tcp -m connlimit --connlimit-above 20 -=
j LOG --log-prefix "rl-queue: "
> iptables -A OUTPUT -o eth1 -p tcp -m connlimit --connlimit-above 20 -=
j QUEUE
>=20
> and maybe better using --syn:
>=20
> iptables -A OUTPUT -o eth1 -p tcp --syn -m connlimit --connlimit-abov=
e 20  -j LOG --log-prefix "rl-queue: "
> iptables -A OUTPUT -o eth1 -p tcp --syn -m connlimit --connlimit-abov=
e 20 -j QUEUE
>=20
> This definitely seems to be limiting traffic, but i'm not really sure=
 if it's what i'm after and if the QUEUE target is working like i think=
 it is (probably not). I guess my questions are:
>=20
> - does anyone have any suggestions on rules that will help me limit t=
he number of connections outbound
>=20
> - can the QUEUE target act as a fifo queue, or is it entirely depende=
nt on something in userspace to queue the packets up and send them back=
 to iptables when the rate limiting numbers have dropped below the thre=
shold?

-j QUEUE target queues packet to be reviewed by a userspace program
which then may filter some out and accept others by setting a verdict.
This achieves effect like "-j ACCEPT" or "-j DROP" set from userspace.
Other useful tasks may be done like accounting. -j QUEUE ensures that
packet won't go further until userspace verdict is set. It also has
buffer to collect packets to be reviewed by userspace, and when it is
full packets get dropped.

> I'm really concerned with the queuing aspect because i don't want pot=
entially important packets from a portscan to get dropped on my side an=
d an open port go undetected.

I don't know any way in which this could be done. Thing is that
connections are something which can live for a long time and even if
there would be a way to queue/pause new connection until the quota is
available the delay in many cases would cause client side to timeout.

Also, it's probably not that bad idea to drop new connection attemps
when there is no quota as those are being retried several times.

P.S. In your case -j QUEUE is useless, it really does -j DROP with a
delay due to buffer.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

