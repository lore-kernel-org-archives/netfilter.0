From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [iptables] Effect of negating multiple source or dest IPs (-s
 or -d)
Date: Tue, 8 Nov 2011 20:23:02 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1111082021550.17284@frira.zrqbmnf.qr>
References: <j9bjgb$v1f$1@dough.gmane.org> <c202a761ac23061d639eebb1ec1f661e.squirrel@nmvrt01.netsim.ch> <j9bkr5$a5f$1@dough.gmane.org> <alpine.LNX.2.01.1111081740580.18080@frira.zrqbmnf.qr> <j9bnrd$372$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j9bnrd$372$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "U.Mutlu" <for-gmane@mutluit.com>
Cc: netfilter@vger.kernel.org


>On Tuesday 2011-11-08 18:11, U.Mutlu wrote:
>> actually generates an equivalent of
>>
>> 	! -d a || ! -d b || ! -d c
>
> But OR'ing them IMHO doesn't make much sense, just think about it.
> I would suggest to AND them.

Rules exhibit an OR-like relationship to one another. There is nothing
that can be changed about it.
