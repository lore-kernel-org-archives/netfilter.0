From: Andrew Stone <andrew@stonie.net>
Subject: Re: NAT WAN IP to internal range?
Date: Thu, 29 Dec 2011 20:42:24 +1100
Message-ID: <CANSq30tNeT5AUD+Veq5qhxWgTXmqhy01Tyh5a1NYLSe1u4FXOA@mail.gmail.com>
References: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com>
	<1324458449.4269.49.camel@steve-pc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1324458449.4269.49.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Hi Andy,

> Have you tried configuring the interface using iproute2 instead?
>
> Something like:
>
> ip address add a.b.c.241/29 dev $WANIF broadcast a.b.c.247

Thanks for your advice... but still no dice... ?

I now have:

ip address add a.b.c.240/29 dev ppp0 broadcast a.b.c.247

iptables -t nat -I PREROUTING -d a.b.c.241 -j DNAT --to-destination 192.168.1.69
iptables -t nat -I POSTROUTING -s 192.168.1.69 -j SNAT --to-source a.b.c.241

iptables -t nat -A PREROUTING -d a.b.c.242 -j DNAT --to-destination
192.168.1.100-192.168.1.150
iptables -t nat -A POSTROUTING -s 192.168.1.100-192.168.1.150 -j SNAT
--to-source a.b.c.242


The .69 machine correctly has .241 ... however the machines located in
the range do not have .242 ?

Is this is correct way to specify a nat range with iptables?

Cheers,
Andrew.
