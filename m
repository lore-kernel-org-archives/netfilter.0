From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: list vmap counter errot
Date: Thu, 16 Sep 2021 14:00:27 +0200
Message-ID: <20210916120027.GA21782@salvia>
References: <ec914466-169b-b146-c216-e1faf1159068@pvfree.net>
 <20210916092702.GA31336@salvia>
 <d02072df-d5e5-b76d-0003-0a6ef62f5d00@pvfree.net>
 <20210916120005.GB11941@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20210916120005.GB11941@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Zatloukal <slezi2@pvfree.net>
Cc: netfilter@vger.kernel.org

On Thu, Sep 16, 2021 at 01:05:03PM +0200, Martin Zatloukal wrote:
[...]
> root@igw-test:~# cat /etc/firewall/test
> 
> #!/sbin/nft -f
> 
> flush ruleset
> 
> add table ip filter
> add chain ip filter FORWARD { type filter hook forward priority 0; policy
> drop; }
> 
> add map ip filter forwport { type ipv4_addr . inet_proto . inet_service:
> verdict; flags interval; counter;  }
> add rule ip filter FORWARD iifname enp0s8 ip daddr . ip protocol  . th dport
> vmap @forwport counter
> 
> add element ip filter forwport { 10.133.89.138 . tcp . 8081: accept }

Thanks, this repro is useful. I managed to reproduce it.

Fix it here:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20210916115838.21724-1-pablo@netfilter.org/

Thanks for reporting.
