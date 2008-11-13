From: TheOldFellow <theoldfellow@gmail.com>
Subject: Re: www.adobe.com
Date: Thu, 13 Nov 2008 12:00:30 +0000
Message-ID: <20081113120030.1f039cb6@gmail.com>
References: <20081113075231.50345b2c@gmail.com>
	<491BFB25.3000800@plouf.fr.eu.org>
	<20081113105205.7496faf5@gmail.com>
	<491C0DD8.6080103@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Thu, 13 Nov 2008 12:22:00 +0100
Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:

> TheOldFellow a =C3=A9crit :
> >=20
> > 10:45:28.932756 IP (tos 0x0, ttl 53, id 25304, offset 0, flags [non=
e], proto TCP (6), length 44)
> >     192.150.18.101.80 > 192.168.1.2.2901:  tcp 24 [bad hdr length 0=
 - too short, < 20]
> [...]
> > Allowing all input doesn't change a thing.
>=20
> I thought so. The TCP header of the first reply packet from the serve=
r=20
> seems to be malformed, so even though iptables accepted it, the TCP=20
> stack would discard it.
>=20
> The problem may lie in your router, your network interface card or it=
s=20
> driver. Anyway it does not seem to be related to netfilter/iptables, =
as=20
> tcpdump sees the packet as malformed before it enters the netfilter=20
> code. Can you try with another router, machine, kernel or network=20
> interface ?

Yes, but it will take time to arrange.  It's very strange that it only
occurs on that range if IP addresses, which are also very similar to
the 192.168.0.0/16 private address range.  I wonder if this would
improve if I changed the address range used on the ADSL router -
firewall to, say, 172.20.1.0.  If it's software/firmware in the router
or NIC that might avoid it.

It's good to know that it isn't my netfilter, as I could not see the
logic in it!  Hardware/firmware seems much more probable.

Anyway, thanks for all your help, I'll report back when I find out more=
=2E

Regards,

R.


