From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Disabling conntrack on an interface
Date: Fri, 03 Jul 2009 01:46:00 +0200
Message-ID: <4A4D46B8.4070401@plouf.fr.eu.org>
References: <2d1f9a6b0907020810x49f483a9j855d373b776571c6@mail.gmail.com> <1246548394.17132.19.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1246548394.17132.19.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Thomas Jacob a =E9crit :
>=20
> I do not get any conntrack entries from mirrored ports when
> I am port mirroring packets onto a Linux interface that is up
> but has no configured addresses.

You could get some, under some conditions.

> As long as these packets are not addressed to your machine the netfil=
ter
> code never gets to see them, AFAIK.

The netfilter code, including conntrack, sees IPv4 packets on an=20
interface as soon as it is bound to the IPv4 stack. An interface does=20
not need to have an IP address to be bound to the IPv4 stack. Before=20
kernel 2.6.21, it just required that the interface had had an address i=
n=20
the past (even though it was later removed) ; "ifconfig <interface>=20
0.0.0.0" did the trick too. Since kernel 2.6.21, interfaces are=20
automatically bound to the IPv4 (and IPv6) stack when they are created.

However... if a packet is not addressed to the machine *and* the machin=
e=20
does not know what to do with it (e.g. IP forwarding is disabled or=20
there is no route to the destination), the packet will be dropped at th=
e=20
input routing stage after PREROUTING, thus the conntrack entry won't be=
=20
confirmed and will be deleted.
