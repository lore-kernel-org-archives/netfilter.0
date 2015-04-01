From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: connmark and nat
Date: Wed, 01 Apr 2015 23:58:42 +0200
Message-ID: <551C6A12.6020404@plouf.fr.eu.org>
References: <551A484A.7050208@belkam.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <551A484A.7050208@belkam.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dmitry Melekhov <dm@belkam.com>
Cc: netfilter@vger.kernel.org

Dmitry Melekhov a =E9crit :
>=20
> I'm trying to do DNAT/SNAT on the same host with connmark and can't g=
et=20
> it working.
>=20
> My host has static ip 192.168.22.252 and it can get address=20
> 192.168.22.99 from VRRP, so bind doesn't listen on 192.168.22.99,

Why not ?

> but if host got this address it has to answer on it the same as on=20
> 192.168.22.252.
>=20
> So , if traffic goes to 192.168.22.99 port 53 udp, I need to redirect=
 it=20
> to 192.168.22.252:53,

Not if you can have BIND to listen on 192.168.22.99 when your host gets
the address.

> and if it was to 192.168.22.99 host need to reply from this address.

This is automatic with stateful destination NAT (DNAT).

> DNAT part works:
>=20
> #mark
> iptables -t mangle -A PREROUTING -d 192.168.22.99 -p udp --dport 53 -=
j=20
> CONNMARK --set-mark 0x100
>=20
> #restore mark inside connection
> iptables -t mangle -A PREROUTING -d 192.168.22.99 -p udp --dport 53 -=
j=20
> CONNMARK --restore-mark
>=20
> #do NAT
> iptables -t nat -A PREROUTING -m mark --mark 0x100 -j DNAT=20
> --to-destination 192.168.22.252

What a complicated setup. Why not just this :

iptables -t nat -A PREROUTING -d 192.168.22.99 -p udp --dport 53 \
  -j DNAT --to-destination 192.168.22.252

> But SNAT doesn't:
>=20
> #restore mark
> iptables -A POSTROUTING -t mangle -j CONNMARK --restore-mark
>=20
> #do nat
> iptables -t nat -A POSTROUTING -m mark --mark 0x100 -j SNAT --to-sour=
ce=20
> 192.168.22.99
>=20
> I see that no packets hit rule:

Of course not. Stateful NAT automatically takes care of reply packets
and replaces addresses as expected by the original sender. Only the
first packet of a new connection goes throught the chains of the nat ta=
ble.
