From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: nf_conntrack_pptp with multiple clients
Date: Mon, 04 Jan 2010 17:51:46 +0100
Message-ID: <4B421CA2.7040906@plouf.fr.eu.org>
References: <bae225f1001040731pd85f180ye7be8c8e1165301d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bae225f1001040731pd85f180ye7be8c8e1165301d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: ml ml <mliebherr99@googlemail.com>
Cc: netfilter@vger.kernel.org

Hello,

ml ml a =E9crit :
>=20
> i have two firewall (both doing nat) and multiple pptp clients like t=
his:
>=20
> Windows PPTP Server <---LinuxFW1---> <----LinuxFW2----> Windows PPTP
> Client1 and Windows PPTP Client1
>=20
> However, with my normal setup i cant get the PPTP VPN working. It
> hangs on User/Password verification.
> If i POSTROUTE GRE/1723 to my PPTP clients then it works.

POSTROUTE ?

> I think thats where the nf_conntrack_pptp comes in handy...however i
> cant get it working. It also hangs on User/Password verification.

If you use NAT then I guess you need nf_nat_pptp too.
