From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: Problem with address forwarding
Date: Mon, 03 Dec 2007 17:20:31 +0200
Message-ID: <1196695232.2629.27.camel@localhost.localdomain>
References: <20071203125238.GN4452@jnamobiled.ite.pl>
	 <57523.217.166.60.19.1196689813.squirrel@ma.rtij.nl>
	 <47540EC9.6080303@plouf.fr.eu.org>
	 <20071203144439.GQ4452@jnamobiled.ite.pl>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071203144439.GQ4452@jnamobiled.ite.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jakub Nadolny <jakub.nadolny@carrywater.pl>
Cc: netfilter@vger.kernel.org

=F7 =F0=CE=C4, 03/12/2007 =D7 15:44 +0100, Jakub Nadolny =D0=C9=DB=C5=D4=
:
> On Mon, Dec 03, 2007 at 03:12:25PM +0100, Pascal Hambourg wrote:
> >> <citaat van=3D"Jakub Nadolny">
> >>> I try to do simple address:port forwarding and I can not get it
> >>> working. I want to have all traffic send to
> >>> some.internet.address:some_port to be forwarded to 192.168.155.12=
3:80.
> >>>
> >>> So I guess following rule should work fine:
> >>> iptables -t nat -A PREROUTING -p tcp -d some.internet.address --d=
port=20
> >>> 1234
> >>> -j DNAT --to 192.168.155.123:80
> >>>
> >>> But when afterthat I enter some.internet.address:1234 in firefox =
I can
> >>> not see webpage which is located at 192.168.155.123. It tries to =
connect
> >>> but there is no result.
> >>>
> >>> What could be the reason of that?
> >> If you are doing this from the same network the webserver is on, t=
his will
> >> not work. The return traffic is going straight back to the client =
instead
> >> of being 'Natted-back' by the firewall.
> >
> > That's when the DNAT is done on a router and the browser and the se=
rver are=20
> > on the same side of the router. The workaround is to SNAT the DNAT-=
ed=20
> > connection in the POSTROUTING chain as it is forwarded back to the =
LAN.=20
> > Take care to SNAT only connections from the local network, not thos=
e from=20
> > the internet because it hides the original source address.
> >
> > If you are not doing the port forwarding on a router but on the box=
 the web=20
> > browser is running on, the DNAT must be done in the OUTPUT chain in=
stead of=20
> > PREROUTING.
>=20
> Unfortunatelly result is the same when I try to connect from outside =
of
> local network.=20
>=20
> So my configuration is like that:
>=20
> web server      |        | server with NAT  |       |
> 192.168.155.123 |--------| 192.168.155.122  |-------| Internet
>                 |        | some.internet.ip |       |
>=20
> Whether I connect from my local network (192.168.155.*) or from outsi=
de
> result is the same.=20
> In web browser I enter IP address - not domain name.=20
>=20
> # iptables -t nat -L -n
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination        =20
> DNAT       tcp  --  0.0.0.0/0            some.internet.ip        tcp =
dpt:80 to:192.168.155.123:80=20
>=20
> To be sure I have temporarly turned off all other rules:
>=20
> # iptables -L -n
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination        =20
>=20
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination        =20
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination    =20
>=20
>=20
> Do you have some suggestions?

=46irst of all make some checks with tcpdump to see the packets. Do you
see them entering www-server? Leaving the router?

Make sure www-server's virtualhosts will accept domain you are
redirecting.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

