From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: VPN client from behind a firewall
Date: Mon, 16 Jun 2008 17:21:45 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806161720190.6620@fbirervta.pbzchgretzou.qr>
References: <90d975d30806160444t7c9bbf21if9b0062e2e72ac56@mail.gmail.com> <48565817.2040600@infolibre.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48565817.2040600@infolibre.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mathieu <mathieu@infolibre.net>
Cc: netfilter@vger.kernel.org


On Monday 2008-06-16 14:09, mathieu wrote:

> Hi,
>
> 	You need to authorize traffic and masquerade/SNAT connections and allow
> forwarding.
>
> Authorize :
>
> iptables -A FORWARD -i eth1 -p udp -d $VPN_SERVER_IP -s $INTERNAL_CLIENT_IP
> --dport 500 -m state NEW, ESTABLISHED -j ACCEPT
>
> iptables -A FORWARD -i eth0 -p udp -s $VPN_SERVER_IP -d $INTERNAL_CLIENT_IP
> --sport 500 -m state ESTABLISHED -j ACCEPT
>
> SNAT (change internal adress by a public one) :

But only if you have a NAT. A firewall is not a NAT, and vice-versa.

As such -p udp 500 and -p esp will be needed for a firewall;
and only -p udp 4500 for a NAT.

