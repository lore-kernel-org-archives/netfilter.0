From: Florian Westphal <fw@strlen.de>
Subject: Re: not able to set ct state rule
Date: Fri, 17 Jul 2020 13:34:08 +0200
Message-ID: <20200717113408.GT32005@breakpoint.cc>
References: <VI1PR06MB4639985A43150F379C316E14C57C0@VI1PR06MB4639.eurprd06.prod.outlook.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <VI1PR06MB4639985A43150F379C316E14C57C0@VI1PR06MB4639.eurprd06.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Andreas Hoefler <andreas.hoefler@hitachi-powergrids.com> wrote:
> Hi
> 
> I am trying to set up a basic connection tracking rule:
> #nft list ruleset
> table ip filter {
>         chain input {
>                 type filter hook input priority 0; policy accept;
>         }
> }
> # nft add rule filter input ct state established accept
> Error: Could not process rule: No such file or directory
> add rule filter input ct state established accept
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

works for me on 5.6.18.

> cat /proc/config.gz | gunzip | grep NFT
> # CONFIG_NFT_NUMGEN is not set
> CONFIG_NFT_CT=m

Does "modinfo nft_ct" work?
If its does, is that module loaded?
If not, try to load it manually.

If that makes the rule add work, then module autoloading is broken
on your system for some reason.
