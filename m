From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Re: Regression caused by commit "netfilter: iptables: lock free
 counters"
Date: Mon, 30 Mar 2009 07:56:19 -0700
Message-ID: <20090330075619.23677280@nehalam>
References: <20090329234702.4988017f@desktop.r000n.info>
	<49D075A3.1050202@cosmosbay.com>
	<20090330145031.2dfd854e@desktop.r000n.info>
	<49D0B628.5000501@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49D0B628.5000501@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: Roman Mindalev <r000n@r000n.net>, Eric Dumazet <dada1@cosmosbay.com>, LKML <linux-kernel@vger.kernel.org>, netfilter@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Mon, 30 Mar 2009 14:08:08 +0200
Patrick McHardy <kaber@trash.net> wrote:

> Roman Mindalev wrote:
> > On Mon, 30 Mar 2009 09:32:51 +0200
> > Eric Dumazet <dada1@cosmosbay.com> wrote:
> > 
> >> Could you try following patch ?
> >>
> >> [PATCH] netfilter: use rcu_read_bh() in ipt_do_table()
> >>
> >> Commit 784544739a25c30637397ace5489eeb6e15d7d49
> >> (netfilter: iptables: lock free counters) forgot to disable BH
> >> in arpt_do_table(), ipt_do_table() and  ip6t_do_table()
> >>
> >> Use rcu_read_lock_bh() instead of rcu_read_lock() cures the problem.
> >>
> >> Reported-and-bisected-by: Roman Mindalev <r000n@r000n.net>
> >> Signed-off-by: Eric Dumazet <dada1@cosmosbay.com>
> >> ---
> > 
> > 2.6.29-git4 and 2.6.29-git6 both works fine for me with this patch. 
> > Thanks, Eric!
> 
> Thanks indeed Eric :) Dave, please apply.
> 
> Acked-by: Patrick McHardy <kaber@trash.net>
> 
> 
Acked-by: Stephen Hemminger <shemminger@vyatta.com>

The original version had rcu_read_lock_bh() but someone (not sure who)
talked me into removing it.
