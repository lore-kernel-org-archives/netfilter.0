From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] bridge: fix rcu dereference outside of rcu_read_lock
Date: Wed, 15 Aug 2012 15:10:25 -0700 (PDT)
Message-ID: <20120815.151025.1185439989487730645.davem@davemloft.net>
References: <1344898062-23633-1-git-send-email-yefremov.denis@gmail.com>
	<1344931732-1858-1-git-send-email-yefremov.denis@gmail.com>
	<20120814081933.30f3e868@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20120814081933.30f3e868@nehalam.linuxnetplumber.net>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: shemminger@vyatta.com
Cc: yefremov.denis@gmail.com, pablo@netfilter.org, kaber@trash.net, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, linux-kernel@vger.kernel.org, ldv-project@ispras.ru

From: Stephen Hemminger <shemminger@vyatta.com>
Date: Tue, 14 Aug 2012 08:19:33 -0700

> Alternative solution for problem found by Linux Driver Verification
> project (linuxtesting.org).
> 
> As it noted in the comment before the br_handle_frame_finish
> function, this function should be called under rcu_read_lock.
> 
> The problem callgraph:
> br_dev_xmit -> br_nf_pre_routing_finish_bridge_slow ->
>  -> br_handle_frame_finish -> br_port_get_rcu -> rcu_dereference
> 
> And in this case there is no read-lock section.
> 
> Reported-by: Denis Efremov <yefremov.denis@gmail.com>
> Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>

Applied, thanks Stephen.

Please CC: this to netdev next time.  It's in a grey area whether I or
the netfilter folks should apply this one, and here I'm deciding to
take care of it.

