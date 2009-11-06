From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: [HELP] forward ppp0 to eth1
Date: Fri, 06 Nov 2009 16:59:11 +0100
Message-ID: <4AF447CF.9050209@freemail.hu>
References: <fe4bdfcf0911050532h5a954b63s43f01a7eff0b4aa9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fe4bdfcf0911050532h5a954b63s43f01a7eff0b4aa9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Sandy Sumitro <sandysumitro@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

Sandy Sumitro =EDrta:
> iptables -F INPUT
> iptables -F OUTPUT
> iptables -F FORWARD
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> iptables -t nat -F
> iptables -t nat -A PREROUTING -i ppp0 -j DNAT --to-destination 192.16=
8.1.252
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> iptables -t nat -A POSTROUTING -s 192.168.1.252 -o ppp0 -j MASQUERADE
>
>  =20
Seems good... Except the last rule is not going to get hit by any=20
packet... :D

> PS: i have set /proc/sys/net/ipv4/ip_forward to 1
> (echo 1 > /proc/sys/net/ipv4/ip_forward)
>
>  =20
Good... :D

1. Check the default gateway setting on the DMZ (1.252)
2. Check the routing on gateway (1.251)
3. Setup a firewall on DMZ too !!!

Swifty
