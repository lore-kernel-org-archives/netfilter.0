From: David Miller <davem@davemloft.net>
Subject: Re: aligned_{u64,be64,le64} defined in #ifdef __KERNEL__
Date: Tue, 05 Oct 2010 23:10:45 -0700 (PDT)
Message-ID: <20101005.231045.226758916.davem@davemloft.net>
References: <201008301258.33113.agruen@suse.de>
	<alpine.LNX.2.01.1008301502280.19931@obet.zrqbmnf.qr>
	<alpine.LNX.2.01.1010060804580.8631@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1010060804580.8631@obet.zrqbmnf.qr>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: jengelh@medozas.de
Cc: agruen@suse.de, netfilter@vger.kernel.org, eparis@redhat.com, linux-kernel@vger.kernel.org, schwab@redhat.com, laforge@netfilter.org, andi@firstfloor.org

From: Jan Engelhardt <jengelh@medozas.de>
Date: Wed, 6 Oct 2010 08:05:52 +0200 (CEST)

> Dave, you liked this too, but I don't see it in net-next yet. Was there 
> some sort of holdup?

Someone has to first add the types to linux/types.h, and that doesn't
go through my tree.
