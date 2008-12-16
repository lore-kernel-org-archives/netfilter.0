From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Iptables with Apache - virtualhosts by name
Date: Tue, 16 Dec 2008 16:26:24 +0100
Message-ID: <4947C8A0.5070606@freemail.hu>
References: <22552e810812160607m3a2d202dt82ded7d9425fce13@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <22552e810812160607m3a2d202dt82ded7d9425fce13@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Javi Legido <javi@legido.com>
Cc: Netfilter list <netfilter@vger.kernel.org>

Hi,

Javi Legido =EDrta:
> Hi.
>
> i have the following machines:
>
> [Router] <=3D> [Server]
>
> I have a Apache with virtual hosts by name working properly in the
> server. But when i 'turn on' iptables, it's impossible to connect to
> ANY page.
>
Is these rules are on your Server or on the Router?
I assume that these are the Router's rules because of the FORWARD part.=
=2E.
> iptables -S
>
> -P INPUT ACCEPT
> -P FORWARD ACCEPT
> -P OUTPUT ACCEPT
> -A INPUT -s public_ip_pc_132 -i eth0 -p tcp -m tcp --dport 22 -j ACCE=
PT
> -A INPUT -s public_ip_pc_132 -i eth0 -p tcp -m tcp --dport 443 -j ACC=
EPT
> -A INPUT -s 192.168.1.31/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEP=
T
> -A INPUT -s public_ip_pc_2/32 -i eth0 -p tcp -m tcp --dport 22 -j ACC=
EPT
> -A INPUT -s public_ip_pc_2/32 -i eth0 -p tcp -m tcp --dport 443 -j AC=
CEPT
> -A INPUT -s public_ip_pc_3/32 -i eth0 -p tcp -m tcp --dport 22 -j ACC=
EPT
> -A INPUT -s public_ip_pc_3/32 -i eth0 -p tcp -m tcp --dport 443 -j AC=
CEPT
> -A INPUT -s 192.168.1.30/32 -i eth0 -p tcp -m tcp --dport 22 -j ACCEP=
T
Why do you check the source addresses ???
eth0 is your WAN interface ???

And you should use the conntracking system...

> -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT
This line should have enabled the connection... So you have a different=
=20
problem...
> -A INPUT -i eth0 -p tcp -m tcp --sport 80 -j ACCEPT
sport ???? why???
> -A INPUT -i eth0 -p tcp -m tcp --dport 4080 -j ACCEPT
> -A INPUT -i eth0 -p udp -m udp --dport 4080 -j ACCEPT
> -A INPUT -i eth0 -p tcp -m tcp --dport 21 -j ACCEPT
> -A INPUT -i eth0 -p udp -m udp --dport 21 -j ACCEPT
> -A INPUT -i eth0 -p udp -m udp --sport 53 -j ACCEPT
> -A INPUT -i eth0 -p tcp -m tcp --sport 23 -j ACCEPT
> -A INPUT -i lo -j ACCEPT
I would ACCEPT all "lo" traffic first in my list...
> -A INPUT -j REJECT --reject-with icmp-port-unreachable
> -A FORWARD -p tcp -m tcp --dport 9999 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 6882 -j ACCEPT
> -A FORWARD -p udp -m udp --dport 5865 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 5865 -j ACCEPT
> -A FORWARD -p udp -m udp --dport 8443 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 8443 -j ACCEPT
> -A FORWARD -p udp -m udp --dport 4666 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 4662 -j ACCEPT
> -A FORWARD -j REJECT --reject-with icmp-port-unreachable
>  =20
So... If it is on the Router then please show the NAT part also...

iptables -S -t nat

If it is on the Server then why do you check the source addresses and=20
why do you have any FORWARDing ???


Swifty

