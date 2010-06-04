From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: It's possible mark or classify packets per gateway in a multihop
  route ?
Date: Fri, 4 Jun 2010 11:38:37 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006041137160.29899@obet.zrqbmnf.qr>
References: <AANLkTinfTnSYngEUs3B7TTSTXt3cq9OHmIXEZEZNEDJB@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinfTnSYngEUs3B7TTSTXt3cq9OHmIXEZEZNEDJB@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Victor Carceler <vcarceler@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2010-06-04 10:49, Victor Carceler wrote:
>
>I have multiple DSL routers, all of them in the same subnet
>(192.168.100.0/24) and reacheable by eth0. I use a multihop default
>route and I want to shape traffic with limits per gateway. So, it's
>possible to mark or classify packets once it's known with router will
>be routed through ? wich extension/selector should I use ?

 -m realm

>-------
>ip route show
>
>192.168.100.0/24 dev eth0  proto kernel  scope link  src 192.168.100.5
>192.168.10.0/24 dev eth1  proto kernel  scope link  src 192.168.10.30
>169.254.0.0/16 dev eth0  scope link
>127.0.0.0/8 dev lo  scope link
>default
>	nexthop via 192.168.100.2  dev eth0 weight 1
>	nexthop via 192.168.100.3  dev eth0 weight 1

make that
	nexthop via 192.168.100.2  dev eth0 weight 1 realm 1
	nexthop via 192.168.100.3  dev eth0 weight 1 realm 2

so that you have realm values to match against.
