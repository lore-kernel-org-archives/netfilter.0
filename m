From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: force specific interface / late DNAT
Date: Mon, 11 Oct 2010 13:17:09 +0200
Message-ID: <4CB2F235.90208@plouf.fr.eu.org>
References: <20101011101013.66800@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20101011101013.66800@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

mad_stuff@gmx.de a =E9crit :
>=20
> I've some strange requirements for my setup: my box (2.6.24) holds a
> bunch of outgoing ppp-connections (ppp0-ppp15) but all of these use t=
he
> same IP subnet (192.168.1.0/24; 192.168.1.100 is my side, and
> 192.168.1.1 is the IP of the server on the other side; so in the end,
> I've got 16 ppp-devices with IP 192.168.1.100 belonging to completely
> different networks).
>=20
> Now I want to connect (SFTP using OpenSSH) to some servers (IP:
> 192.168.1.1 each) on the oposite sides, so I thought about NAT to mak=
e
> this mess a bit handier:

Is this one same server or different servers with the same address ?

> -> I had the following idea to distinguish the different connections
> for userspace programs: for each device pppX create an alias pppX:1 w=
ith
> IP 10.0.X.2/24 so that I can connect to 10.0.10.1 if I want to talk t=
o
> 192.168.0.1 connected via ppp10 and 10.0.9.1 if I want to use
> 192.168.0.1 connected via ppp9 etc.

Yo do not have to create IP aliases ; you can just add routes. This
saves the SNAT/MASQUERADE operation.

ip route add 10.0.X.1 dev pppX

> So I added two rules:=20
>=20
> iptables -t nat -A OUTPUT -o ppp9 -d 10.0.9.1 -j DNAT --to-destinatio=
n 192.168.0.1
> iptables -t nat -A POSTROUTING -o ppp9 -j MASQUERADE
>=20
> But this doesn't work since after applying the DNAT rule the routing
> decision is changed

You can use -j MARK in mangle/OUTPUT and advanced routing (ip rule add
fwmark) to force routing via the correct interface.
