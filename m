From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT rule
Date: Wed, 16 Jul 2008 19:25:49 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807161924150.32031@fbirervta.pbzchgretzou.qr>
References: <487E1DF3.1090203@hoecoop.org> <alpine.LNX.1.10.0807161850580.32031@fbirervta.pbzchgretzou.qr> <487E2DAD.9040806@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <487E2DAD.9040806@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Wednesday 2008-07-16 19:19, Grant Taylor wrote:

> On 07/16/08 11:54, Jan Engelhardt wrote:
>> iptables -t nat -A POSTROUTING -m policy --dir out --mode tunnel --tunnel-dst
>> <realip of vendor> -j NETMAP --to 192.168.101.0/24
>> iptables -t nat -A PREROUTING -m policy --dir in --mode tunnel
>> --tunnel-src <realip of vendor> -j NETMAP --to 192.168.10.0/24
>
> How does this take in to account that there is very likely an IP
> address conflict between the local side of the VPN and the remote
> side of the VPN?  I'm very much afraid that the local server will
> just try to talk to a local IP thinking that it is replying
> directly back to the original client.

Packets already destined for the tunnel (see first rule)
are not rerouted, because, well, it's POSTrouting.
