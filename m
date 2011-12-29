From: Andrew Stone <andrew@stonie.net>
Subject: Re: NAT WAN IP to internal range?
Date: Fri, 30 Dec 2011 00:38:31 +1100
Message-ID: <CANSq30tgxHWZvrarzVp7R3JqzyfZyoQy23oLFoi7seNoPzc+Xg@mail.gmail.com>
References: <CANSq30tB6vk90gORs+bcLFvF3a8iwZcw8CbUpJFZJOH2YN-SXQ@mail.gmail.com>
	<1324458449.4269.49.camel@steve-pc>
	<CANSq30tNeT5AUD+Veq5qhxWgTXmqhy01Tyh5a1NYLSe1u4FXOA@mail.gmail.com>
	<4EFC46CE.8010202@atc.tcs.com>
	<4EFC49F3.2040009@atc.tcs.com>
	<CANSq30v-QabkFg3OYGqrRDJ_Jir5=eFiw43hjF7iA-aUeyTTRA@mail.gmail.com>
	<4EFC5066.5060709@atc.tcs.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4EFC5066.5060709@atc.tcs.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vigneswaran R <vignesh@atc.tcs.com>
Cc: netfilter@vger.kernel.org

Thanks Vignesh!

>iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o $WANIF -j SNAT --to-source a.b.c.241
>Here I am assuming that 192.168.1.0/24 is your internal network and you want to allow all the machines. If you want to allow only a few machines, put a comma separated "address[/mask]" list.

Solved it for me... in the end I used:
iptables -t nat -I POSTROUTING -s 192.168.1.96/27 -o ppp0 -j SNAT
--to-source a.b.c.241
and matched the range to my DHCP leases. (96 to 127)

Cheers,
Andrew
