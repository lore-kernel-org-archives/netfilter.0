From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: List chain during attack high CPU usage
Date: Thu, 1 Sep 2022 12:34:15 +0200
Message-ID: <YxCKp2yQT1mu096e@salvia>
References: <b5e3e3d3-9631-31a4-7fc0-7193bdc10176@brskt.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b5e3e3d3-9631-31a4-7fc0-7193bdc10176@brskt.be>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brskt <contact@brskt.be>
Cc: netfilter@vger.kernel.org

On Wed, Aug 31, 2022 at 02:18:17AM +0200, Brskt wrote:
> Hello,
> 
> I'm using some filter which uses sets with meters. When the server is
> receiving a lot of packets per seconds (~800k+) and using the command to
> list the chain, it does take ~80% of CPU and take a long time to return an
> output.
> 
> # cat /etc/issue
> Welcome to Alpine Linux 3.16
> 
> # nft -v
> nftables v1.0.5 (Lester Gooch #4)
> 
> # uname -r
> 5.15.62-1-lts

Could you provide more information on your setup? ruleset?

Ruleset listing is also lockless.

It is hard to guess with this short notice.
