From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Statistic module
Date: Wed, 28 Jan 2009 10:14:47 +0100
Message-ID: <49802207.3080904@plouf.fr.eu.org>
References: <004e01c980e0$470aa780$d51ff680$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <004e01c980e0$470aa780$d51ff680$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Barry A Rich a =E9crit :
> I'm working with an embedded system with the 2.6.19.2 kernel. I'd pre=
fer not
> to upgrade the kernel at this time, but need features of the latest v=
ersions
> of iproute and iptables.

Usually the new features are actually in the kernel. Iptables and=20
iproute are just upgraded to be able to use them.

> I built iptables-1.4.1.1 and iproute2-2.6.26 for
> this kernel. Everything seems to work except the following:
>=20
> iptables -t mangle -A PREROUTING -p udp --sport 6970 -m statistic --m=
ode nth
> --every 2 --packet 0 -j MARK --set-mark 1
>=20
> It produces:
>=20
> iptables: No chain/target/match by that name
>=20
> I think it is not finding the statistic module.

The 'statistic' match was added in version 2.6.18 of the kernel. Maybe=20
you didn't enable the related option (NETFILTER_XT_MATCH_STATISTIC) whe=
n=20
configuring and building your kernel. Check your config file.
