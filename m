From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: raw table and NOTRACK target
Date: Fri, 26 Jun 2009 16:31:24 +0300
Message-ID: <1246023084.3985.17.camel@casper.meteor.dp.ua>
References: <20090625130555.GB9856@openoffice.lt>
	 <1246000121.3985.5.camel@casper.meteor.dp.ua>
	 <20090626074317.GA11753@openoffice.lt>
	 <1246020740.3985.11.camel@casper.meteor.dp.ua>
	 <20090626130944.GA18792@openoffice.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090626130944.GA18792@openoffice.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Ramunas Vabolis <ramuva@openoffice.lt>
Cc: netfilter@vger.kernel.org

=F7 =F0=D4=CE, 26/06/2009 =D7 16:09 +0300, Ramunas Vabolis =D0=C9=DB=C5=
=D4:
> Hello again,=20
>=20
> > If I've got it right you are trying to do DNAT. The problem was tha=
t
> > everything was not being traced by conntrack, this is what you've
> > already fixed.
> 	Yes, I'm trying to do some DNAT, but still got a long way to go.
> =20
> > Next, as you've told in further message nothing block that traffic =
in -t
> > filter, that's good.
> >=20
> > Next, show as the actual DNAT rules and check the counters encrease=
 as
> > you trying to connect.
> >=20
> > You can also check whether the connection is actually being tracked=
 by
> > analizing output of "conntrack -L" or "conntrack -E"
> =09
> 	The problem is that I'm stuck at step.1 - excluding items from
> NOTRACK. As soon as I add rules with RETURN in raw table, packets are
> dropped somewhere. To reproduce:
>=20
> I've got a host, which connects with lynx to any website.
>=20
> In router there no DROP rules in FORWARD and single line in raw table=
:
> /sbin/iptables -t raw -A PREROUTING -j NOTRACK
>=20
> Host connects to any remote host port 80.
>=20
> As soon as I add two lines with -j RETURN in raw table (so the entrie=
s=20
> are tracked) I experience the same effect as I've added -j DROP:=20
>=20
> /sbin/iptables -t raw -I PREROUTING -p tcp -s host.ip --dport 80 -j R=
ETURN
> /sbin/iptables -t raw -I PREROUTING -p tcp -d host.ip --sport 80 -j R=
ETURN
>=20
> are acting as I've made these rules:
>=20
> /sbin/iptables -t raw -I PREROUTING -p tcp -s host.ip --dport 80 -j D=
ROP
> /sbin/iptables -t raw -I PREROUTING -p tcp -d host.ip --sport 80 -j D=
ROP
>=20
> I've tried replacing RETURN with ACCEPT with same results. As soon as=
 I
> remove those 2 rules, host.ip can connect to remote 80 port.=20

Is host.ip the host from which you are trying to run lynx?

This is strange behaviour, but it seems that problems occur when you ar=
e
trying to use conntack. Maybe conntrack modules are not loaded or some
rules in -t nat are acting like this. Does the nat table have rules? Ca=
n
you show it (iptables-save -t nat)? Show output of "lsmod | grep conn".

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

