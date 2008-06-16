From: mathieu <mathieu@infolibre.net>
Subject: Re: VPN client from behind a firewall
Date: Mon, 16 Jun 2008 14:09:59 +0200
Message-ID: <48565817.2040600@infolibre.net>
References: <90d975d30806160444t7c9bbf21if9b0062e2e72ac56@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <90d975d30806160444t7c9bbf21if9b0062e2e72ac56@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

	You need to authorize traffic and masquerade/SNAT connections and allo=
w=20
forwarding.

Authorize :

iptables -A FORWARD -i eth1 -p udp -d $VPN_SERVER_IP -s=20
$INTERNAL_CLIENT_IP --dport 500 -m state NEW, ESTABLISHED -j ACCEPT

iptables -A FORWARD -i eth0 -p udp -s $VPN_SERVER_IP -d=20
$INTERNAL_CLIENT_IP --sport 500 -m state ESTABLISHED -j ACCEPT

SNAT (change internal adress by a public one) :

iptables -t nat -A POSTROUTING -o eth0 -p udp -d $VPN_SERVER_IP --dport=
=20
  500 -j SNAT --to-source $PUB_IP

It's look like udp port 4500 and 10000 are also used. And Client must b=
e=20
a SecureNat one (i can't confirm, i'm not using cisco VPN).

Regards,

m.e.

Gergely Buday a =E9crit :
> Dear All,
>=20
> I would like to use a Cisco VPN client from behind my CentOS server,
> which has an iptables firewall. The network topology is as follows:
> eth0 is towards the ISP, eth1 heads the local clients. Up to now I
> used
>=20
> http://tldp.org/HOWTO/IP-Masquerade-HOWTO/firewall-examples.html#RC.F=
IREWALL-IPTABLES
>=20
> but this clearly needs extension. What I know is that I should allow
> the IPSec port (500) to be open. What else, and how? I'm not very
> familiar with iptables, so some pointers would be more than welcome.
>=20
> Best Wishes
>=20
> - Gergely
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

