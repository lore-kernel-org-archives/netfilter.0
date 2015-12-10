From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: using iptables matches and targets with nft
Date: Thu, 10 Dec 2015 13:45:15 +0100
Message-ID: <20151210124515.GA2504@salvia>
References: <56696D12.6040601@secunet.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56696D12.6040601@secunet.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Berghofer <stefan.berghofer@secunet.com>
Cc: netfilter@vger.kernel.org

On Thu, Dec 10, 2015 at 01:16:18PM +0100, Stefan Berghofer wrote:
> Hi all,
> 
> recent versions of the Linux kernel and the libnftnl library define nft expression types
> with the names "match" and "target". However, I could not find any reference to these
> expression types in the code of the nft user space utility, but only in the code for iptables.
> Is it possible to access iptables matches and targets from rules defined with nft, or is
> this not intended?

iptables-compat uses this, this will be included in iptables 1.6.0
(just resolved a problem with static compilation, so we can release
this asap).

There is also a patch for nft (not in master yet) that takes what was
added via iptables-compat and provides a translation to the native
extensions (Shivani is working on the translation part at this
moment).

The idea is to provide an easy way to migrate from your iptables
ruleset to nft.
