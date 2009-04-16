From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: need help on *nat filter for multiple source IP
Date: Thu, 16 Apr 2009 11:23:16 +0200
Message-ID: <49E6F904.6050202@chello.at>
References: <5a7ba2310904122005k6606f6falba0b74b118f42090@mail.gmail.com>	 <49E2C80C.1030406@chello.at>	 <5a7ba2310904151200m29b7c633g5f5326f00bc825b1@mail.gmail.com>	 <49E64AC5.4050400@chello.at> <5a7ba2310904160138i57b8867ct9c4a2130e6ffebe1@mail.gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5a7ba2310904160138i57b8867ct9c4a2130e6ffebe1@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: no doubt <hell.no.doubt@gmail.com>

no doubt wrote:
> Hello Mart,
> Yeah, I just tweak around your config.
>
> Here they are..
>
> iptables -t nat -n MY80FWD
> iptables -A PREROUTING -s 192.168.4.20/32 -i eth2 -p tcp -m tcp
> --dport 80 -j MY80FWD
> iptables -A PREROUTING -s 192.168.4.10/32 -i eth2 -p tcp -m tcp
> --dport 80 -j MY80FWD
> iptables -A PREROUTING -s 192.168.4.100/32 -i eth2 -p tcp -m tcp
> --dport 80 -j MY80FWD
> iptables -A MY80FWD -p tcp -j DNAT --to-destination 192.168.3.10:80
>
> iptables -A POSTROUTING -o ppp+ -j MASQUERADE
>
>
> --khairul

Hello,

well, this is funny then.
Your original request was:

[quote]

I would like to achieve that for all IP's in 192.168.4.0/24 that are
accessing outside internet address port 80, will be directed to
192.168.3.10 port 80 EXCEPT for few IPs namely 192.168.4.10,
192.168.4.100 and 192.168.4.20


There must have been some 'unfiltered' mental connection between us :-)
Because I was misunderstanding your post, just the way you were actually 
intending, but somehow not expressing correctly.
Just too funny :-)
You should have asked some like that:

I'd like to redirect http traffic for only 3 host of my subnet, while 
the rest...

Well, maybe I then would have misread your posting and the result would 
not have been the desired one.
lol :-)

Have a nice day

Mart
