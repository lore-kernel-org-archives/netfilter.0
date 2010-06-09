From: Jiri Pirko <jpirko@redhat.com>
Subject: [Question] netfilter, xt_target->target and xt_target->checkentry
 locks
Date: Wed, 9 Jun 2010 14:21:15 +0200
Message-ID: <20100609122114.GB2825@psychotron.lab.eng.brq.redhat.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kaber@trash.net
Cc: netfilter@vger.kernel.org, bart.de.schuymer@pandora.be, davem@davemloft.net, shemminger@vyatta.com

Hi Patrick.

Once module registers it's struct xt_target by xt_register_target and ->target
and ->checkentry funtions are called later, is there any lock guaranteed to be
held?

From what I see for ->target it looks like rcu_read_lock is held, but I'm not
sure for all paths. There would be nice to put a comment into struct xt_target
definition regarding locks.

Asking because I found several places where dev->br_port is referenced directly
(without rcu_dereference).

Thanks a lot.

Jirka
