From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables cgroup accounting problem
Date: Mon, 5 Oct 2020 11:34:59 +0200
Message-ID: <20201005093459.GA5213@breakpoint.cc>
References: <20200930192755.Horde.ZHlzJB9_OgMvaVsNNXoPYcf@webmail.inetadmin.eu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200930192755.Horde.ZHlzJB9_OgMvaVsNNXoPYcf@webmail.inetadmin.eu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: azurit@pobox.sk
Cc: netfilter@vger.kernel.org

azurit@pobox.sk <azurit@pobox.sk> wrote:
> Hi,
> 
> i'm migrating from iptables to nftables and i'm having problem with
> accounting using cgroups. Everything was working on iptables but is printing
> weird errors with nftables (chain 'accounting' exists):
> 
> # mkdir /sys/fs/cgroup/net_cls,net_prio/12345
> # echo 0x000112345 > /sys/fs/cgroup/net_cls,net_prio/12345/net_cls.classid
> # nfacct add 12345
> # iptables -I accounting -m cgroup --cgroup 0x000112345 -m nfacct
> --nfacct-name 12345
> iptables: No space left on device.
> 
> # uname -a
> Linux server 4.9.236 #2 SMP Thu Sep 17 16:32:19 CEST 2020 x86_64 GNU/Linux
> # iptables --version
> iptables v1.8.2 (nf_tables)

Use legacy version.  4.9 lacks several fixes that might account for
this.  Also, there is no advantage of iptables-over-nft vs.
iptables-legacy except it avoids race conditions with parallel rule
updates (plus a few advantages of the greater flexibility of the
nf_tables framework, but that has almost no bearing a this time).
