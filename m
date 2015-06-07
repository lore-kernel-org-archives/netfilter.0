From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Due to Connection Tracking multiple DNAT rules for GRE packets
 do not get hit
Date: Sun, 07 Jun 2015 14:37:39 +0200
Message-ID: <55743B13.8050507@plouf.fr.eu.org>
References: <CAJpBj-gvfN9z6eCBdjYdFQUsE5N1eZcF5ARmAUDcqA1KKhT8nQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJpBj-gvfN9z6eCBdjYdFQUsE5N1eZcF5ARmAUDcqA1KKhT8nQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Karan <digitalkaran@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

Karan a =E9crit :
>=20
> I am trying to do simple round robin load balancing of GRE packets
> using iptables 'statistic' extension. I have multiple rules in
> sequence that DNAT the packets to specific IPs. But the problem is as
> soon as first GRE packet is received and DNATted, connection tracking
> makes an entry for it and all the subsequent GRE packets get DNATted
> to the same IP. What's more surprising is that, if I see the counters
> of the DNAT rule entry, its value stays at one. This implies that all
> subsequent packets are getting DNATted because of connection tracking
> and not because of DNAT rule.

Nothing surprising here. This is how stateful NAT are expected to work.
The purpose it to apply the same NAT mapping to all packets belonging t=
o
the same connection. And the GRE connection tracking considers that
packets with the same source and destination address and GRE key belong
to the same connection because this is what is expected most of the tim=
es.

> My intentions are to DNAT GRE packets in a round robin fashion betwee=
n
> 15.0.0.2 and 15.0.0.3.

I'm curious, what do you want to forward packets belonging to the same
GRE connection to different hosts ?

> If I keep on
> flushing DNAT GRE connecton using conntrack command line, the things
> seem to work, BUT is it the only possible SOLUTION ?

This is an awfully ugly hack.

> Please SUGGEST what am i MISSING

See above.

> and how I can ACHIEVE my goals.

You may use packet marking and advanced routing to do the forwarding.
Assuming that 15.0.0.2 and 15.0.0.3 are connected directly to the
forwarding host :

iptables -t nat -A PREROUTING -p GRE -d 172.16.96.173 \
-m statistic --mode nth --every 2 --packet 0 -j MARK --set-mark 2

iptables -t nat -A PREROUTING -p GRE -d 172.16.96.173 \
-m statistic --mode nth --every 1 --packet 0 -j MARK --set-mark 3
# note : statistic not needed here

ip rule add fwmark 2 table 102
ip rule add fwmark 3 table 103

ip route add default via 15.0.0.2 table 102
ip route add default via 15.0.0.3 table 103

On 15.0.0.2 and 15.0.0.3, you add a DNAT or REDIRECT rule :

iptables -t nat -A PREROUTING -p GRE -d 172.16.96.173 -j REDIRECT
