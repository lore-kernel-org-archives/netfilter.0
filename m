From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [iptables] Effect of negating multiple source or dest IPs (-s
 or -d)
Date: Tue, 8 Nov 2011 17:44:33 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111081740580.18080@frira.zrqbmnf.qr>
References: <j9bjgb$v1f$1@dough.gmane.org> <c202a761ac23061d639eebb1ec1f661e.squirrel@nmvrt01.netsim.ch> <j9bkr5$a5f$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j9bkr5$a5f$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2011-11-08 17:19, U.Mutlu wrote:

> sim@netmess.org wrote, On 2011-11-08 17:16:
>>> What's the effect of this rule on a multihomed box
>>> (the IPs below are just some examples, not real):
>>>
>>>    iptables -A INPUT ! -d 1.2.3.4,2.3.4.5 -p all -j DROP
>>>
>>
>> the newest version of iptables says:
>>
>> iptables v1.4.12.1: ! not allowed with multiple source or destination IP
>> addresses
>
> Oh, one wonders why they did so...

Because it leads to a confusing result.

	! -d a,b,c

could be reasonably interpreted as

	! -d a && ! -d b && ! -d c

but because using "," in -s/-d means a simple rule expansion, it 
actually generates an equivalent of

	! -d a || ! -d b || ! -d c
