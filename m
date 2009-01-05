From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Mon, 05 Jan 2009 15:37:41 +0100
Message-ID: <49621B35.7040706@unipex.it>
References: <664670418@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <664670418@web.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Roland_H=E4der?= <r.haeder@web.de>
Cc: netfilter@vger.kernel.org

Roland H=E4der wrote:
> 192.168.1.1 is my router, 192.168.1.1x are my clients, both have a=20
> "default gateway" set to 192.168.1.1 and /etc/resolve.conf has a=20
> nameserver entry pointing only to 192.168.1.1
>=20

Not right that "both" have the default gw to 192.168.1.1 Only the
clients on 192.168.1.0/24 have to. The router (the server where you are
writing the iptables rules) need another gw!

> I want to pass through from my LAN (eth1) to Internet (eth0/ppp0)=20
> regular things like Mail, Newsgroups and such things. So I need to=20
> masq my private network 192.168.1.0 on eth1 to the Internet. And this
>  is no longer working.
>=20

Seen the rules, this must work.
Try
IP -F -t nat
IP -F FORWARD
IP -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
IP -A FORWARD -i eth1 -m state --state NEW -j LOG --log-prefix "NEW FW"
IP -A FORWARD -i eth1 -j ACCEPT
IP -A POSTROUTING -o eth0 -m state --state NEW -j LOG --log-prefix "NEW=
 POR"
IP -A POSTROUTING -o eth0 -j MASQUERADE

> I want to route traffic from Internet on TCP/UDP port 31017 which is=20
> being used by Descent2-Rebirth to my client 192.168.1.17. I used=20
> PREROUTE and FORWARD for this.
>=20

=46or this into the above iptables.list there are no rules!
IP -A PREROUTING -i eth0 -p tcp --dport 30017 -j DNAT --to-destination=20
192.168.1.17

and add the forward one

> Like I wrote above it *has* worked, until I have upgraded the farly=20
> outdated kernel which should be done on regular basis. I guess you=20
> know why. :)
>=20

I don't know about this....

Michele

