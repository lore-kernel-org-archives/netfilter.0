From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: AW: Atomic changes to IP sets
Date: Tue, 14 Apr 2015 11:29:04 +0300
Message-ID: <1429000144.10467.4.camel@hakkenden.ath.cx>
References: <ECC8F67CE961104EB2AFE8F7FD50F5D045F1E6@exchange2010.sirrix.de>
	 <ECC8F67CE961104EB2AFE8F7FD50F5D045F21A@exchange2010.sirrix.de>
	,<1428918287.10467.2.camel@hakkenden.ath.cx>
	 <ECC8F67CE961104EB2AFE8F7FD50F5D045F57D@exchange2010.sirrix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ECC8F67CE961104EB2AFE8F7FD50F5D045F57D@exchange2010.sirrix.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Anna Fischer <a.fischer@sirrix.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

=D0=92 =D0=92=D1=82, 14/04/2015 =D0=B2 05:36 +0000, Anna Fischer =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > Hi,
> >
> > I'm using ip sets in my iptables firwall rules. I don't just use th=
ose for firewalling, but also for packet mangling (marking). Now I'm qu=
ite frequently changing these sets and also the firewall rules. I know =
that I can atomically switch firewall rules by using iptables-restore. =
But how can I make changes to ip sets atomic? It seems to be as if pack=
ets are always passing the firewall whilst I do ipset commands. Current=
ly I flush all ip sets, and then rebuild them. I understand this will c=
ause problems because at times my ip sets are empty and so the firewall=
 does not behave how I want it to behave. But what is the correct way t=
o atomically update ip sets? I have seen that there is a command to swa=
p an ip set. So I would build up a new set, then swap it with the old o=
ne, and then delete the old one. Is that the right way of changing ip s=
ets? The other option would be to create a whole new set of ipsets and =
the a new set of iptables rules with these sets, and then I use iptable=
s-restore to atomically switch the full firewall table. This seems like=
 quite a bit of overkill though, doesn't it? Does anyone have an idea a=
bout how to best work with ip sets without building glitches into my fi=
rewall whilst reconfiguring ip sets?
> >
> > Thanks for any pointers.
>=20
> > Did you try ipset {save,restore}? This will pass all the commands i=
n one
> > transaction through netlink.
>=20
> I have tried ipset {save, restore} but it does not seem to work if I =
have a large set of commands to restore. Is there a limit on the number=
 of commands I can save/restore?
>=20
> Thanks, Anna

I don't know of such a limit. Quick test with adding 100000 addresess
through restore gives correct result here


