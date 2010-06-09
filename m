From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [Question] netfilter, xt_target->target and xt_target->checkentry
 locks
Date: Wed, 9 Jun 2010 14:37:51 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006091434130.22105@obet.zrqbmnf.qr>
References: <20100609122114.GB2825@psychotron.lab.eng.brq.redhat.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100609122114.GB2825@psychotron.lab.eng.brq.redhat.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jpirko@redhat.com>
Cc: kaber@trash.net, netfilter@vger.kernel.org, bart.de.schuymer@pandora.be, davem@davemloft.net, shemminger@vyatta.com

On Wednesday 2010-06-09 14:21, Jiri Pirko wrote:

>Hi Patrick.
>
>Once module registers it's struct xt_target by xt_register_target and 
>->target and ->checkentry funtions are called later, is there any lock 
>guaranteed to be held?
From what I see for ->target it looks like rcu_read_lock is held, but 
>I'm not sure for all paths. There would be nice to put a comment into 
>struct xt_target definition regarding locks.

Though nf_hook_slow invokes rcu_read_lock, that should not be a formal
guarantee that Xtables extensions run with RCU. See xt_TCPMSS for 
example.

>Asking because I found several places where dev->br_port is
>referenced directly (without rcu_dereference).

