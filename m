From: David Miller <davem@davemloft.net>
Subject: Re: aligned_{u64,be64,le64} defined in #ifdef __KERNEL__
Date: Mon, 30 Aug 2010 18:42:40 -0700 (PDT)
Message-ID: <20100830.184240.58442478.davem@davemloft.net>
References: <20100829.212156.229740543.davem@davemloft.net>
	<201008301258.33113.agruen@suse.de>
	<alpine.LNX.2.01.1008301502280.19931@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1008301502280.19931@obet.zrqbmnf.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jengelh@medozas.de
Cc: agruen@suse.de, netfilter@vger.kernel.org, eparis@redhat.com, linux-kernel@vger.kernel.org, schwab@redhat.com, laforge@netfilter.org, andi@firstfloor.org

From: Jan Engelhardt <jengelh@medozas.de>
Date: Mon, 30 Aug 2010 15:02:55 +0200 (CEST)

> 
> On Monday 2010-08-30 12:58, Andreas Gruenbacher wrote:
>>
>>> If we want a version of this type visible to userspace, it needs to,
>>> for example, have double underscores prepended to the type name just
>>> as we do for things like __u16 and __u32.
>>
>>How about something like this?
> 
> 
> I like that approach:
> 

Me too.
