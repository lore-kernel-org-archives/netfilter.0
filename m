From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: FORWARD chain and Interfaces
Date: Sat, 21 May 2011 13:23:49 +0200
Message-ID: <4DD7A0C5.1040200@plouf.fr.eu.org>
References: <1305958205.10779.1454356989@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305958205.10779.1454356989@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@buglecreek.com
Cc: netfilter@vger.kernel.org

Hello,

netfilter@buglecreek.com a =E9crit :
> I have a firewall router box that I'm trying to write a ruleset for t=
hat
> accepts/blocks traffic from Network A to Network B.  I'm testing the
> rules on 3 virtual machines and will eventually deploy to production
> hardware:
>=20
> Net A Machine Eth0 <-> Eth0 Firewall/Router Eth1 <-> Eth0 Net B Machi=
ne
>       192.168.99.1     192.168.99.2   10.10.10.1     10.10.10.2
>=20
> I have the the following rules on the Firewall/Router as a test befor=
e I
> write rules with http, ssh etc:
>=20
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -p icmp --icmp-type echo-request =
-s
> 192.168.99.0/24 -d 10.10.10.0/24 -m state --state NEW -j ACCEPT
> iptables -A FORWARD -p icmp --icmp-type echo-request -m state --state
> NEW -j LOG --log-prefix "ICMP: "
>=20
> When I ping from 192.168.99.1 to 10.10.10.2 it does not work.  The lo=
g
> rule logs the packet as IN=3DETH1 OUT=3DETH1.


Can you describe the virtual network architecture ?
Are all the three machines above virtual guests on a same physical host
or is one of them the physical host ?

Also, can you provide the routing table on the firewall/router as
reported by route -n or ip route ?
