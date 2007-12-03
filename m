From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: Problem with address forwarding
Date: Mon, 03 Dec 2007 17:19:41 +0200
Message-ID: <op.t2rl63cgrtqp7s@hagumi.home>
References: <20071203125238.GN4452@jnamobiled.ite.pl> <57523.217.166.60.19.1196689813.squirrel@ma.rtij.nl> <47540EC9.6080303@plouf.fr.eu.org> <20071203144439.GQ4452@jnamobiled.ite.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071203144439.GQ4452@jnamobiled.ite.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	delsp=yes"
To: netfilter@vger.kernel.org

Do you have MASQUERADE rule on POSTROUTING chain? Is ip_forward set to =
1? =20
Is web server's default route set to 192.168.155.122?

Jakub Nadolny <jakub.nadolny@carrywater.pl> kirjoitti Mon, 03 Dec 2007 =
=20
16:44:39 +0200:
>
> Unfortunatelly result is the same when I try to connect from outside =
of
> local network.
>
> So my configuration is like that:
>
> web server      |        | server with NAT  |       |
> 192.168.155.123 |--------| 192.168.155.122  |-------| Internet
>                 |        | some.internet.ip |       |
>
> Whether I connect from my local network (192.168.155.*) or from outsi=
de
> result is the same.
> In web browser I enter IP address - not domain name.
>
> # iptables -t nat -L -n
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       tcp  --  0.0.0.0/0            some.internet.ip        tcp =
=20
> dpt:80 to:192.168.155.123:80
>
> To be sure I have temporarly turned off all other rules:
>
> # iptables -L -n
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>
>
> Do you have some suggestions?
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
K=E4yt=F6ss=E4 Operan vallankumouksellinen s=E4hk=F6postiohjelma: =20
http://www.opera.com/mail/
