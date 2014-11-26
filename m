From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: issue with nftable - goto : Operation not supported
Date: Wed, 26 Nov 2014 14:00:42 +0100
Message-ID: <20141126130042.GA1533@salvia>
References: <5474BC91.6060108@c-s.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5474BC91.6060108@c-s.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: leroy christophe <christophe.leroy@c-s.fr>
Cc: netfilter@vger.kernel.org

On Tue, Nov 25, 2014 at 06:29:53PM +0100, leroy christophe wrote:
> Using nft, i'm trying to jump to another table from the end of a
> table and I get the following error.
> 
> root@localhost:~# nft add rule filter input  goto accs
> <cmdline>:1:1-31: Error: Could not process rule: Operation not supported
> add rule filter input goto accs
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> What could be the reason ?
> 
> I'm using
> * nftables-20141121
> * gmp-4.3.2
> * libmnl-1.0.3
> * libnfnetlink-1.0.1
> * libnftnl-20141121
> * libnetfilter_conntrack-1.0.4

Kernel version?

Could you run this command with strace:

strace nft add rule ...

Could you post the relevant part of your ruleset (table and chain
configuration)?

Thanks.
