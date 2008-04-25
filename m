From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Handling RoadWarrior VPN Traffic with IPtables
Date: Fri, 25 Apr 2008 17:11:13 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804251707000.6645@fbirervta.pbzchgretzou.qr>
References: <4811F356.9000404@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4811F356.9000404@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrique Netfilter <henrique.netfilter@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-04-25 17:05, Henrique Netfilter wrote:
>
> The l2tpd is encaspuled inside the ESP traffic of the IPSec tunnel,
> and when it reaches my external interface, it must be redirected to
> my internal interface (where the l2tpd daemon listens) to continue
> the connection. If I had a KLIPS kernel, I could easily just DNAT
> the incoming L2TP requisition on interface ipsec0 to my internal
> interface:
>
> iptables -t nat -A PREROUTING -i ipsecX -p udp --sport 1701 --dport
> 1701 -j DNAT --to-destination X.X.X.X <------ my internal interface
> IP
>
> But since my kernel is NETKEY, I can't, since there is  no ipsec
> interface, and I can't just DNAT the incoming traffic from my
> external to my internal interface for security reasons (since I
> want that only traffic coming from the IPSec tunnel to access the
> l2tpd daemon).

-i eth0 -m policy --dir in --pol ipsec
[--tunnel-src theirip] [--tunnel-dst yourip]

Should be able to accurately replace -i ipsecX. See the iptables
manpage. --tunnel-src, --tunnel-dst are just for ensuring that
you match exactly one tunnel, you can omit it if it satisfies you.
