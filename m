From: Jiri Pirko <jpirko@redhat.com>
Subject: Re: [Question] netfilter, xt_target->target and
 xt_target->checkentry locks
Date: Wed, 9 Jun 2010 15:00:46 +0200
Message-ID: <20100609130045.GC2825@psychotron.lab.eng.brq.redhat.com>
References: <20100609122114.GB2825@psychotron.lab.eng.brq.redhat.com>
 <alpine.LSU.2.01.1006091434130.22105@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LSU.2.01.1006091434130.22105@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: kaber@trash.net, netfilter@vger.kernel.org, bart.de.schuymer@pandora.be, davem@davemloft.net, shemminger@vyatta.com

Wed, Jun 09, 2010 at 02:37:51PM CEST, jengelh@medozas.de wrote:
>On Wednesday 2010-06-09 14:21, Jiri Pirko wrote:
>
>>Hi Patrick.
>>
>>Once module registers it's struct xt_target by xt_register_target and 
>>->target and ->checkentry funtions are called later, is there any lock 
>>guaranteed to be held?
>>From what I see for ->target it looks like rcu_read_lock is held, but 
>>I'm not sure for all paths. There would be nice to put a comment into 
>>struct xt_target definition regarding locks.
>
>Though nf_hook_slow invokes rcu_read_lock, that should not be a formal
>guarantee that Xtables extensions run with RCU. See xt_TCPMSS for 
>example.

A was afraid of it. Thanks.

>
>>Asking because I found several places where dev->br_port is
>>referenced directly (without rcu_dereference).
>
