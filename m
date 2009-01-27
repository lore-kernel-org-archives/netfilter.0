From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: DNAT on another interfaces' IP
Date: Tue, 27 Jan 2009 21:45:54 +0100
Message-ID: <20090127214554.51d68578@catlap>
References: <57b62e7d0901270638u75e23a92gf5f0e0c40cf61343@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <57b62e7d0901270638u75e23a92gf5f0e0c40cf61343@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?UTF-8?B?Qmxhxb4gQmHEjW5paw==?= <bacnik@gmail.com>
Cc: netfilter@vger.kernel.org

>Hello,

Hi,

>iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 22 -j DNAT
>--to-destination 192.168.2.2
>..
>If I ssh through eth0 (from 192.168.0.3) this gets me to 192.168.2.2
>as expected. But if I ssh through eth1 (from 192.168.1.3) to IP
>192.168.0.1,
>I connect to router, meaning there is no DNAT in effect. Is this the
>intended behaviour? If so, please explain why.

It's not intended behaviour. It should work the way you want unless
some other rules in nat/raw table prevent it. Please send the output of
following commands:
iptables -nvL -t raw
iptables -nvL -t nat

regards,
Marek Kierdelewicz
