From: "Mario Ohnewald" <mario.Ohnewald@gmx.de>
Subject: Re: NAT FROM public ip TO public ip
Date: Sun, 9 Jan 2005 23:17:51 +0100 (MET)
Message-ID: <16556.1105309071@www51.gmx.net>
References: <41DF9D4E.3040809@go-wlan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Igor Tsinman <igort@go-wlan.com>
Cc: netfilter@lists.netfilter.org

> Mario Ohnewald wrote:
>=20
> >On Thu, 2005-01-06 at 08:23, Igor Tsinman wrote:
> > =20
> >
> >>Mario Ohnewald wrote:
> >>>This is a real easy question, but i will explain it in detail so that
> you
> >>>know what i am on about ;)
> >>>
> >>>I have two internet boxes, both have only one nic.
> >>>Box A is my root box.
> >>>Box B is a ftp server (where i am not admin, but i have an ftp
> account).
> >>>
> >>>Both, Box A and B have a public ip address.
> >>>You can NOT access the ftp server from the outside.
> >>>ONLY Box A can connect to that ftp server (Box B).
> >>>
> >>>So i though i could simply nat a connection through my Box A, to Box B.
> >>>If i connect from the real bad world, to my Box A, port 2121. Box A
> could
> >>>forward/NAT that to the internal ftp box.
> >>>
> >>>I have tried it with this rule:
> >>>$IPT -t nat -A PREROUTING -i eth0 -p tcp -d 123.123.123.123 -m helper
> >>>--helper ftp-2121 -j DNAT --to-destination 123.123.123.111
> >>>
> >>>and
> >>>
> >>>modprobe ip_conntrack_ftp ports=3D21,2121
> >>>
> >>>
> >>>But it looks like its not working.
> >>>I did a tcpdump -i eth0 -n host 123.123.123.111
> >>>
> >>>
> >>>And no packages where transfered to the ftp box (123.123.123.111).
> >>>Any idea why? Am i going the right way at all?
> >>>
> >>>Thanks, Mario
> >>>
> >>>=20
> >>>
> >>>     =20
> >>>
> >>You have to add an additional rule:
> >>$IPT -A FORWARD -p tcp -i eth1 -d 23.123.123.123 --dport 2121 -j ACCEPT
> >>
> >>For this example, eth0 is external and eth1 is internal.
> >>   =20
> >>
> >
> >I only have one network card.
> >
> See  "DNAT forwarding on same interface":
> http://lists.netfilter.org/pipermail/netfilter/2002-July/036620.html


i have this rule now:
iptables -A PREROUTING -t nat -d host_A -p tcp --dport 2121 -j DNAT --to
host_B
iptables -A POSTROUTING -t nat -d host_B -p tcp --dport 2121 -j SNAT --to
host_A

when i try to redirect it to port 21 (see below), too. Then the packet gets
dropped somehow:
iptables -A PREROUTING -t nat -d host_A -p tcp --dport 2121 -j DNAT --to
host_B:21


What do i need to change in my rule, to redirect it to port 21 from 2121?

Cheers, Mario

--=20
+++ Sparen Sie mit GMX DSL +++ http://www.gmx.net/de/go/dsl
AKTION f=FCr Wechsler: DSL-Tarife ab 3,99 EUR/Monat + Startguthaben

