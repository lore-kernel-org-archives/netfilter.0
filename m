From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: raw table and NOTRACK target
Date: Fri, 26 Jun 2009 10:08:41 +0300
Message-ID: <1246000121.3985.5.camel@casper.meteor.dp.ua>
References: <20090625130555.GB9856@openoffice.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090625130555.GB9856@openoffice.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Ramunas Vabolis <ramuva@openoffice.lt>
Cc: netfilter@vger.kernel.org

=F7 =FE=D4=D7, 25/06/2009 =D7 16:05 +0300, Ramunas Vabolis =D0=C9=DB=C5=
=D4:
> 	Hello there,
>=20
> I'm looking after a pretty busy router. Right now everyting in
> PREROUTING chain is joined to NOTRACK.:
>=20
> /sbin/iptables -t raw -A PREROUTING -j NOTRACK
> I need to intercept and redirect tcp http sessions. But right now I'm
> stuck while trying to add exceptions to NOTRACK.
>=20
> I've tried adding one test on local IP (real one) and use RETURN targ=
et:
> /sbin/iptables -t raw -I PREROUTING -p tcp -s host.ip --dport 80 -j R=
ETURN
> /sbin/iptables -t raw -I PREROUTING -p tcp -d host.ip --sport 80 -j R=
ETURN
>=20
> Does not work. (Tried -j ACCEPT too). Tried creating another chain, j=
ump
> from PREROUTING to that chain and RETURN or ACCEPT in there. Same thi=
ng.
> iptables -vxnL shows increase only in first rule

Pay attention to order. As far as I understood your rule order is like
this:

-t raw -A PREROUTING -j NOTRACK
-t raw -A PREROUTING -p tcp -s host.ip --dport 80 -j RETURN
-t raw -A PREROUTING -p tcp -d host.ip --sport 80 -j RETURN

first rule matches any packet setting an action of NOTRACK. You should =
change the order to be like this:

-t raw -A PREROUTING -p tcp -s host.ip --dport 80 -j RETURN
-t raw -A PREROUTING -p tcp -d host.ip --sport 80 -j RETURN
-t raw -A PREROUTING -j NOTRACK

assuming you already have this rule:

/sbin/iptables -t raw -A PREROUTING -j NOTRACK

then you should add rest to the top (at posision 1) by:

/sbin/iptables -t raw -I PREROUTING 1 -p tcp -s host.ip --dport 80 -j R=
ETURN
/sbin/iptables -t raw -I PREROUTING 1 -p tcp -d host.ip --sport 80 -j R=
ETURN

> I add any of these rules, tcpdump shows that packet arrives to
> inner interface, but does not travel to outgoing one.=20
>=20
> I'm using Debian Lenny with stock packets (kernel icluding).=20
>=20
> What am I missing or doing wrong? From what I gather packets are=20
> discarded at raw table.=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

