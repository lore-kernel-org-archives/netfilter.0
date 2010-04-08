From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: iptables vlan and 802.1p marking is possible?
Date: Thu, 08 Apr 2010 14:58:09 +0300
Message-ID: <1270727889.29223.5.camel@casper.meteor.dp.ua>
References: <j2j624cd18a1004080256ic9aca654k14babd170dcfce40@mail.gmail.com>
	 <v2y624cd18a1004080330z1d60613dv7050c31ab573b42e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <v2y624cd18a1004080330z1d60613dv7050c31ab573b42e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Alessandro Fachin <alessandro.fachin@gmail.com>
Cc: netfilter@vger.kernel.org

=F7 =FE=D4=D7, 08/04/2010 =D7 12:30 +0200, Alessandro Fachin =D0=C9=DB=C5=
=D4:=20
> Hi,
> is it possibile marking  with iptables the traffic coming from tagged
> port (802.1Q vlan)
> that is using PCP, the 3-bit field which refers to the IEEE 802.1p pr=
iority?

It seems you can mark vlan packet with ebtables using protocol 802_1Q
and --vlan-id, --vlan-prio matches, see man ebtables.

Then you might want to use those marks from iptables or directly from
tc.

> I'm trying to do this for keep the correct priority until traffic arr=
iveto tc.
> Thanks for reply.
> Regards.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

