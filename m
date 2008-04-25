From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: intended behavior of REDIRECT
Date: Fri, 25 Apr 2008 17:25:06 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804251724070.6645@fbirervta.pbzchgretzou.qr>
References: <4804EF83.7080004@yahoo.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4804EF83.7080004@yahoo.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Luke Elliott <lukester_null@yahoo.co.uk>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-15 20:10, Luke Elliott wrote:
>
> iptables -t nat -A PREROUTING -p tcp --dport 9002 -j REDIRECT --to-ports
> 9003-9004
>
> I'd like to balance connections to port 9002 across the two servers on ports
> 9003 and 9004. Using the --random (or --random 1 with iptables 1.3.8...) option
> works, but what should the non-random rule actually do?

I'd rather use the two rules:
1. -m statistic --mode nth --every 2 -j REDIRECT --to-port 9003 +
2. (unconditional)                   -j REDIRECT --to-port 9004

Which will reliably RR over the ports.

