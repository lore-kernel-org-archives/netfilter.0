From: Patrick McHardy <kaber@trash.net>
Subject: Re: Regression caused by commit "netfilter: iptables: lock free counters"
Date: Mon, 30 Mar 2009 14:08:08 +0200
Message-ID: <49D0B628.5000501@trash.net>
References: <20090329234702.4988017f@desktop.r000n.info>	<49D075A3.1050202@cosmosbay.com> <20090330145031.2dfd854e@desktop.r000n.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756824AbZC3MI0@vger.kernel.org>
In-Reply-To: <20090330145031.2dfd854e@desktop.r000n.info>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roman Mindalev <r000n@r000n.net>
Cc: Eric Dumazet <dada1@cosmosbay.com>, Stephen Hemminger <shemminger@vyatta.com>, LKML <linux-kernel@vger.kernel.org>, netfilter@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Roman Mindalev wrote:
> On Mon, 30 Mar 2009 09:32:51 +0200
> Eric Dumazet <dada1@cosmosbay.com> wrote:
> 
>> Could you try following patch ?
>>
>> [PATCH] netfilter: use rcu_read_bh() in ipt_do_table()
>>
>> Commit 784544739a25c30637397ace5489eeb6e15d7d49
>> (netfilter: iptables: lock free counters) forgot to disable BH
>> in arpt_do_table(), ipt_do_table() and  ip6t_do_table()
>>
>> Use rcu_read_lock_bh() instead of rcu_read_lock() cures the problem.
>>
>> Reported-and-bisected-by: Roman Mindalev <r000n@r000n.net>
>> Signed-off-by: Eric Dumazet <dada1@cosmosbay.com>
>> ---
> 
> 2.6.29-git4 and 2.6.29-git6 both works fine for me with this patch. 
> Thanks, Eric!

Thanks indeed Eric :) Dave, please apply.

Acked-by: Patrick McHardy <kaber@trash.net>

