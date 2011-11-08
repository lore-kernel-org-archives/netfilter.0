From: sim@netmess.org
Subject: Re: [iptables] Effect of negating multiple source or dest IPs (-s or
 -d)
Date: Tue, 8 Nov 2011 17:16:54 +0100
Message-ID: <c202a761ac23061d639eebb1ec1f661e.squirrel@nmvrt01.netsim.ch>
References: <j9bjgb$v1f$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j9bjgb$v1f$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

> What's the effect of this rule on a multihomed box
> (the IPs below are just some examples, not real):
>
>    iptables -A INPUT ! -d 1.2.3.4,2.3.4.5 -p all -j DROP
>

the newest version of iptables says:

iptables v1.4.12.1: ! not allowed with multiple source or destination IP
addresses

As it will be transformed in to two rules anyway, I'd recommend to
directly write n rules for that.

Simon

