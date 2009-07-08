From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to do a "double" NAT ?
Date: Wed, 08 Jul 2009 22:00:28 +0200
Message-ID: <4A54FADC.4070808@plouf.fr.eu.org>
References: <9948385e0907071348g3aa24b91of296401ff38e3eea@mail.gmail.com>	 <1247012313.8471.18.camel@casper.meteor.dp.ua> <9948385e0907080423x56f22f3dl96ec79df62525103@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9948385e0907080423x56f22f3dl96ec79df62525103@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?David_Bala=B8ic?= <xerces9@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

David Bala=B8ic a =E9crit :
>=20
> iptables -A FORWARD -i ppp0 -o vlan1 -j ACCEPT

This rule is too permissive. You should restrict it to source address=20
1.2.3.4 and to destination address 192.168.1.254 and TCP port 80.

> # 1.2.3.4 is the remote IP I only allow access
> iptables -t nat -A prerouting_rule -i ppp0 -p tcp -s 1.2.3.4 --dport
> 8085 -j DNAT --to 192.168.1.254:80
>=20
> iptables -t nat -A POSTROUTING -o vlan1 -p tcp -d 192.168.1.254
> --dport 80 -j SNAT --to-source 192.168.1.1

