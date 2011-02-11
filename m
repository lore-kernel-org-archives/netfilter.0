From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: OUTPUT SNAT
Date: Fri, 11 Feb 2011 18:20:00 +0100
Message-ID: <4D556FC0.3050503@plouf.fr.eu.org>
References: <AANLkTimBv5i=wHBW=_QCUkbkW32UA5bH1T2Le=2Hd_Ez@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimBv5i=wHBW=_QCUkbkW32UA5bH1T2Le=2Hd_Ez@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Ryan Whelan a =E9crit :
> I have a linux router with a WAN/VPN interface (tun0) and a LAN/Bridg=
e
> (br0).  The SVI address on the bridge is 172.21.0.1 / 28.  The Linux
> machine doesn't do any masquerading so all the traffic from machines
> connected to the br0 interface contains its original address.  All
> traffic from the Linux router itself, sent over the VPN has a source
> address of the tun0, of course.  Is it possible to to SNAT all traffi=
c
> sent over the VPN to have a source ip of the bridge SVI?
>=20
> Something like: `iptables -t nat -A OUTPUT -o tun0 -j SNAT --to 172.2=
1.0.1`

You can use SNAT only in nat/POSTROUTING.

> `iptables -t nat -A POSTROUTING -o tun0 -j SNAT --to 172.21.0.1`
> works, but it will also masquerade all traffic forwarded from the
> bridge (br0) interface.
>=20
> Is this possible with netfilter? or even possible with linux?

Sure. You can either
- exclude packets from the address of tun0 : ! -s <tun0_address>
- match only packets from the bridge subnet : -s 172.21.0.0/28

If you want to SNAT packets based on the input interface regardless of
the source address, you can mark packets :

iptables -t mangle -A FORWARD -i br0 -o tun0 -j MARK --set-mark 1
iptables -t nat -A POSTROUTING -o tun0 -m mark --mark 1 \
  -j SNAT --to 172.21.0.1
