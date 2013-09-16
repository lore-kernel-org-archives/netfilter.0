From: Manu <traqueur@club-internet.fr>
Subject: Re: PREROUTING to a non local subnet
Date: Mon, 16 Sep 2013 09:26:48 +0200
Message-ID: <5236B2B8.9090006@club-internet.fr>
References: <522DDC72.4000402@club-internet.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <522DDC72.4000402@club-internet.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello

Nobody knows if it possible ?


Le 09/09/2013 16:34, Manu a =E9crit :
> Hello
>
> I'm running iptable v1.4.7 on a linux with two NIC.
> One has adress 192.168.1.31 (the lan)
> The other has a public IP. Let's say 180.180.180.180
>
> On the lan, I have a VPN which join two network : 192.168.1.0 and=20
> 192.168.2.0
>
> I'm trying to forward 5900 port (vnc) to a computer which is on the=20
> second subnet with adress 192.168.2.100
> iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT=20
> --to-destination 192.168.2.100:5900
> iptables -A FORWARD -p tcp -d 192.168.2.100--dport 5900 -j ACCEPT
> and it doesn't work
>
> I've tried the same on the local network with adress 192.168.1.99
> iptables -A PREROUTING -t nat -p tcp  -i eth1 --dport 5900 -j DNAT=20
> --to-destination 192.168.1.99:5900
> iptables -A FORWARD -p tcp -d 192.168.1.99--dport 5900 -j ACCEPT
> and it's working like a charm
>
> I've done my test with another computer with public adress=20
> 200.200.200.200
>
> I've done a netstat one the two computers
> on 192.168.2.100 i've seen he's talking to 180.180.180.180 (<-- my=20
> server running iptable)
> on 192.168.1.99 i've seen he's talking to 200.200.200.200 (<-- the=20
> computer on internet which i'm running my test from)
>
> thanks for your attention
> --=20
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
