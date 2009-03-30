From: Patrick McHardy <kaber@trash.net>
Subject: Re: Regression caused by commit "netfilter: iptables: lock free counters"
Date: Mon, 30 Mar 2009 14:06:49 +0200
Message-ID: <49D0B5D9.3070405@trash.net>
References: <20090329234702.4988017f@desktop.r000n.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090329234702.4988017f@desktop.r000n.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Roman Mindalev <r000n@r000n.net>
Cc: Stephen Hemminger <shemminger@vyatta.com>, Eric Dumazet <dada1@cosmosbay.com>, LKML <linux-kernel@vger.kernel.org>, netfilter@vger.kernel.org

Roman Mindalev wrote:
> Since 2.6.29-git1 I got many debug messages in kernel log.
> One from them:
> 
> Mar 29 12:06:11 desktop kernel: [  917.414369] BUG: using
> smp_processor_id() in preemptible [00000000] code: hddtemp/2820 Mar 29
> 12:06:11 desktop kernel: [  917.414378] caller is
> ipt_do_table+0xd0/0x3a8 [ip_tables]

Stephen, please have a look at this. I think we need to disable
preemption in *t_do_table() for PREEMPT_RCU.

