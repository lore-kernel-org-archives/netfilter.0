From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Port forwarding on host interface
Date: Wed, 23 Sep 2009 16:09:36 +0200
Message-ID: <4ABA2C20.30800@plouf.fr.eu.org>
References: <4ABA00DD.70205@tootai.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ABA00DD.70205@tootai.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Daniel Huhardeaux a =E9crit :
>=20
> I would like to redirect an external port to another port on the same=
=20
> machine.

REDIRECT is your friend.

> I read on some documents that the kernel doesn't allow DNAT to=20
> 127.0.0.1 so I ended up with following setup:

This is not exactly right. NAT allows any address you like, but the
kernel routing prohibits packets with an address in the loopback range
on a non-loopback interface, regardless of NAT. It might be worth
mentionning that the routing decision occurs after the PREROUTING chain
and does not know about the original destination address. However DNAT
to 127.x.y.z works fine in the OUTPUT chain because the packets are
rerouted through the loopback interface and don't leave the host.

> let's say I want to redirect 59000 port on my 1.2.3.4 public IP to 59=
00=20
> port on the same public IP *but a direct connection to 5900 port on t=
he=20
> public IP* is forbidden. At this time my packets are marked for iprou=
te2=20
> (2 ISP), mark 201 (isp1) or 202 (Isp2).
>=20
> Has someone a tip for me?

You can drop packets to port 5900 in the mangle table before the nat
table. Or you can mark them in the mangle table and drop or reject them
later in the filter table (preferred).

> Is it true that forwarding to 127.0.0.1 can't be done?

If you mean IP forwarding, yes, for the same reason as above because IP
forwarding involves non-loopback interfaces. Note that what you want to
do is not IP forwarding.

If you mean what is commonly called "port forwarding" which is a form o=
f
destination NAT, you can use loopback addresses as long as packets don'=
t
leave or enter the host. As I wrote above, DNAT to 127.x.y.z works fine
in the OUTPUT chain.
