From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: raw table and NOTRACK target
Date: Fri, 26 Jun 2009 15:52:20 +0300
Message-ID: <1246020740.3985.11.camel@casper.meteor.dp.ua>
References: <20090625130555.GB9856@openoffice.lt>
	 <1246000121.3985.5.camel@casper.meteor.dp.ua>
	 <20090626074317.GA11753@openoffice.lt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090626074317.GA11753@openoffice.lt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Ramunas Vabolis <ramuva@openoffice.lt>
Cc: netfilter@vger.kernel.org

=F7 =F0=D4=CE, 26/06/2009 =D7 10:43 +0300, Ramunas Vabolis =D0=C9=DB=C5=
=D4:
> > >=20
> > Pay attention to order. As far as I understood your rule order is l=
ike
> > this:
> >=20
> > -t raw -A PREROUTING -j NOTRACK
> > -t raw -A PREROUTING -p tcp -s host.ip --dport 80 -j RETURN
> > -t raw -A PREROUTING -p tcp -d host.ip --sport 80 -j RETURN
> <skipped>
> Thank you for pointing this out, but I already well aware of that.
> That's why I'm using -I to prepend rules to begining of the chain.
>=20
> The first rule is hit - I can verify that with iptables -t raw -vxnL.
> But it seems if packet is RETURNed of ACCEPTed in raw chain it is
> removed from further processing (I'm running tcpdump on my router and=
 I
> see packet entering in local interface but it does not appear in my
> outgoing interface).=20
>=20
> So exact steps to replicate the behaviour:
>=20
> iptables -t raw -A PREROUTING -p tcp -s real.ip --dport 80 -j RETURN
> iptables -t raw -A PREROUTING -p tcp -d real.ip --sport 80 -j RETURN
> iptables -t raw -A PREROUTING -j NOTRACK
>=20
> running lynx http://any.host.com from real.ip
>=20
> running tcpdump on inner interface:
> tcpdump -i ethlocal -n host real.ip and port 80=20
>=20
> does show connection attempts while=20
> tcpdump -i ethoutside -n host real.ip and port 80=20
> is silent.
>=20
> iptables -t raw -vxnL shows that first rule is hit couple times, the
> second rule is never hit.

If I've got it right you are trying to do DNAT. The problem was that
everything was not being traced by conntrack, this is what you've
already fixed.

Next, as you've told in further message nothing block that traffic in -=
t
filter, that's good.

Next, show as the actual DNAT rules and check the counters encrease as
you trying to connect.

You can also check whether the connection is actually being tracked by
analizing output of "conntrack -L" or "conntrack -E".

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

