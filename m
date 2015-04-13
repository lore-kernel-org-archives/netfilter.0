From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: Atomic changes to IP sets
Date: Mon, 13 Apr 2015 12:44:47 +0300
Message-ID: <1428918287.10467.2.camel@hakkenden.ath.cx>
References: <ECC8F67CE961104EB2AFE8F7FD50F5D045F1E6@exchange2010.sirrix.de>
	 <ECC8F67CE961104EB2AFE8F7FD50F5D045F21A@exchange2010.sirrix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ECC8F67CE961104EB2AFE8F7FD50F5D045F21A@exchange2010.sirrix.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Anna Fischer <a.fischer@sirrix.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

=D0=92 =D0=9F=D0=BD, 13/04/2015 =D0=B2 08:23 +0000, Anna Fischer =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> Hi,
>=20
> I'm using ip sets in my iptables firwall rules. I don't just use thos=
e for firewalling, but also for packet mangling (marking). Now I'm quit=
e frequently changing these sets and also the firewall rules. I know th=
at I can atomically switch firewall rules by using iptables-restore. Bu=
t how can I make changes to ip sets atomic? It seems to be as if packet=
s are always passing the firewall whilst I do ipset commands. Currently=
 I flush all ip sets, and then rebuild them. I understand this will cau=
se problems because at times my ip sets are empty and so the firewall d=
oes not behave how I want it to behave. But what is the correct way to =
atomically update ip sets? I have seen that there is a command to swap =
an ip set. So I would build up a new set, then swap it with the old one=
, and then delete the old one. Is that the right way of changing ip set=
s? The other option would be to create a whole new set of ipsets and th=
e a new set of iptables rules with these sets, and then I use iptables-=
restore to atomically switch the full firewall table. This seems like q=
uite a bit of overkill though, doesn't it? Does anyone have an idea abo=
ut how to best work with ip sets without building glitches into my fire=
wall whilst reconfiguring ip sets?
>=20
> Thanks for any pointers.

Did you try ipset {save,restore}? This will pass all the commands in on=
e
transaction through netlink.

> Anna
>=20
>=20
>=20
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


