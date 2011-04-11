From: Andrew Beverley <andy@andybev.com>
Subject: Re: load balanced between tunnel VPN and an Normal Link Internet
Date: Mon, 11 Apr 2011 20:21:09 +0100
Message-ID: <1302549669.1551.20.camel@andybev>
References: <BANLkTimW+nay6YkXxWnHtP6GKv6Eopac7w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302549700; bh=drQYl1f5HnwC58e3we69CERygoC3sV48Bokyo
	dBJIxs=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=ZFxhZl5A
	LuVJS9IscjlGL5KWhYx8Y1VGEBRRsHquC655mJKRJxlkjqQF0eFwjVsDVFoJPu0RJje
	xhmbe3FLRfpEVhcD0UHuC1Nj/Pvifn8VgWxnutPSZZPQVVWGcMWRenZlwblixK8E++P
	6JXgMDQlOWwJ5b+l2m4Norubj69s0=
In-Reply-To: <BANLkTimW+nay6YkXxWnHtP6GKv6Eopac7w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Usu=E1rio?= do Sistema <maiconlp@ig.com.br>
Cc: netfilter@vger.kernel.org

On Sun, 2011-04-10 at 15:55 -0300, Usu=C3=A1rio do Sistema wrote:
> Hello everyone, I'm new in this maillist and I would like receive hel=
p
> about my problem......
>=20

Welcome.

>=20
> I have a Firewall ( with fwbuider - Red-Hat 5.6 ) in my branch office
> connected to my head office by openvpn. I'm with a problem when flow
> data is to destination port 80 from my branch office to my head
> office.
>=20
> in my branch office firewall has 3 device Ethernet:
>=20
> eth0 - inside network 192.100.100.0/24
> eth1 - wan 1 VPN
> eth2 - wan 2 only for Internet Traffic
>=20
> I'm marking all traffic for port 80 go out upon wan 2 - eth2.

Why are you doing this? The default route should do this for you.

>  but,
> it's a problem because when an user tries access an service at the
> port 80 in my head office it isen't work!
>=20
> the firewall toward to eth2 insted to VPN the traffic from inside
> network to my head office when destinatio is port 80.  I've try solve
> this with rule below but it isen't work.occur the same problem.
>=20
> my head office inside network is 128.2.0.0/16 where I have my web
> servers at the port 80.
>=20
> rules created in firewall branch office
>=20
> /sbin/iptables -t mangle -A PREROUTING -s 0/0 -d ! 128.2.0.0/16 -p tc=
p
> --dport 80 -j MARK --set-mark 1
> ip rule del fwmark 1
> ip route flush table internet
> ip rule add fwmark 1 table internet prio 20
> ip route add default via 200.108.139.1 table internet ( it's eth2 )
> ip route flush cache

You shouldn't need to do any of the above. If you had your routing
tables correct, then any traffic for your head office network should go
out on the VPN (eth1) and all other traffic (default) should go out on
eth2.

> part from my route main table
>=20
> 128.2.0.0       192.168.200.101 255.255.0.0     UG    0      0       =
 0 tun0
> 169.254.0.0     0.0.0.0         255.255.0.0     U     0      0       =
 0 eth3
> 0.0.0.0         190.128.173.97  0.0.0.0         UG    0      0
> 0 eth1 > where is my VPN
>=20

If think it would help if you could post a diagram of your setup (with
IP addresses) and your full routing table. I don't fully understand tha=
t
table above. For example, what is 192.168.200.101, what is eth3, and
what is 190.128.173.97? I assume that 200.108.139.1 is your public IP
address?

>=20
> any Tip ?? I wish that packages from inside networ 192.100.100.0/24 t=
o
> 128.2.0.0/16 port 80 go out for tun0 insted by eth2

Surely you want *any* traffic to 128.2.0.0/16 to go to tun0?

Andy


