From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: [iptables] Effect of negating multiple source or dest IPs (-s
 or -d)
Date: Tue, 08 Nov 2011 17:19:48 +0100
Message-ID: <j9bkr5$a5f$1@dough.gmane.org>
References: <j9bjgb$v1f$1@dough.gmane.org> <c202a761ac23061d639eebb1ec1f661e.squirrel@nmvrt01.netsim.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c202a761ac23061d639eebb1ec1f661e.squirrel@nmvrt01.netsim.ch>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

sim@netmess.org wrote, On 2011-11-08 17:16:
>> What's the effect of this rule on a multihomed box
>> (the IPs below are just some examples, not real):
>>
>>     iptables -A INPUT ! -d 1.2.3.4,2.3.4.5 -p all -j DROP
>>
>
> the newest version of iptables says:
>
> iptables v1.4.12.1: ! not allowed with multiple source or destination IP
> addresses

Oh, one wonders why they did so...

> As it will be transformed in to two rules anyway, I'd recommend to
> directly write n rules for that.

But in my above case then this can't work, or can it?

