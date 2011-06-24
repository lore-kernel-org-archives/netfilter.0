From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Help on how to limit a NAT port forward to just a range of IP
 addresses
Date: Fri, 24 Jun 2011 21:52:05 +0200
Message-ID: <4E04EAE5.5000201@plouf.fr.eu.org>
References: <3afccf8e-e575-4203-962a-0079da9fae75@riccagroup.com> <ec9c4a4d-00e6-4ff2-b81d-7b88c1d128c1@riccagroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ec9c4a4d-00e6-4ff2-b81d-7b88c1d128c1@riccagroup.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Mitchell <mmitchell@riccagroup.com>
Cc: netfilter@vger.kernel.org

Hello,

Mark Mitchell a =E9crit :
> I have the following ruleson my firewall (Edgewater Networks Hardware=
)
> that do a global port forward of port 11211 to an internal host.
> What I am trying to figure out is how to limit this port forward to
> just a couple ranges of IP addresses.
>=20
> Outside IP : 173.49.xx.xxx  (xx for privacy reasons)
> Internal IP : 192.168.1.22
>=20
> iptables -I FORWARD 10 -i eth1 -d 192.168.1.22 -p tcp --dport 11211 -=
j ACCEPT
> iptables -A PREROUTING -t nat -p tcp --dport 11211 -d 173.49.xx.xxx -=
j DNAT --to 192.168.1.22:11211
> iptables -A POSTROUTING -t nat -p tcp -s 192.168.1.22 --dport 11211 -=
j SNAT --to 173.49.xx.xxx
> iptables -t nat -A POSTROUTING -p tcp -d 192.168.1.22 --dport 11211 -=
s 192.168.1.0/24 -j SNAT --to 192.168.1.1
>=20
> I tried adding the rule after the FORWARD command but it did not
> change anything. I could still hit the port from any IP address.
>=20
> iptables -A INPUT -p tcp --dport 11211 -d 173.49.xx.xxx -m iprange --=
src-range 74.205.xx.x-74.205.xx.x -j ACCEPT=20

Why in the INPUT chain ? Forwarded packets don't go through that chain.
The source address restriction should be added to the first rule in the
above ruleset :

iptables -I FORWARD 10 -i eth1 -d 192.168.1.22 -p tcp --dport 11211 \
  -m iprange --src-range 74.205.xx.x-74.205.xx.x -j ACCEPT
