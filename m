From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: ipv6 rule icmp bug maybe
Date: Sun, 07 Apr 2013 11:15:12 +0200
Message-ID: <51613920.7010203@plouf.fr.eu.org>
References: <CAMD-=VJU3PesmF7P4c0nQuk1Nw_XdoUf559h8tXfbEGXEv=2dQ@mail.gmail.com>	<5293489.MPThhE2Fke@alaris> <CAMD-=VJ7md+MEqtCcAdw9YgzuvoK_cPVy3KFcoPz8RwB_=52pQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMD-=VJ7md+MEqtCcAdw9YgzuvoK_cPVy3KFcoPz8RwB_=52pQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Nick Edwards a =E9crit :
>=20
> /usr/sbin/ip6tables -A INPUT -s fe80::/10 -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -d ff00::/8 -j ACCEPT
>=20
> /usr/sbin/iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT
> /usr/sbin/iptables -A INPUT -s 178.x.x.x/24 -j ACCEPT
> /usr/sbin/ip6tables -A INPUT -s 2001:c01d:c01d:beef::0/64 -j ACCEPT
>=20
> /usr/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j A=
CCEPT
> /usr/sbin/ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j =
ACCEPT

If the network interface is of ethernet type, you should allow ICMPv6
types neighbour solicitation and neighbour advertisement. They replace
ARP requests and replies for IPv6.

> however, when I come from the ipv6 range, I can ssh in, but I can not=
 ping it.

What do you mean by "can not ping" ? What happens exactly ? Have you
done a packet capture on both ends to see what happens at the network
layer ?
