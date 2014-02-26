From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft error
Date: Wed, 26 Feb 2014 11:45:55 +0100
Message-ID: <20140226104555.GA4215@localhost>
References: <CAFnufp3Wzw9fLk2SU16kR1vfAbwaFQfhAo9dwNqk_80LVUfx4g@mail.gmail.com>
 <20140226102530.GA4093@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140226102530.GA4093@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matteo Croce <technoboy85@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Feb 26, 2014 at 11:25:30AM +0100, Pablo Neira Ayuso wrote:
> On Wed, Feb 26, 2014 at 11:12:29AM +0100, Matteo Croce wrote:
> > Hi,
> > 
> > I'm trying to run nftables on Debian with a vanilla 3.13 kernel.
> > I've compiled libnftnl and nftables from git, but when I try to start
> > ntf I get this error:
> > 
> > # nft list table filter
> > <cmdline>:1:1-17: Error: Could not receive sets from kernel: Address
> > family not supported by protocol
> > list table filter
> > ^^^^^^^^^^^^^^^^^
> > 
> > I think I have all modules loaded:
> > 
> > lsmod |grep nf
> > nfnetlink_log          12935  0
> > nft_ct                 12486  0
> > nft_compat             12844  0
> > nft_nat                12459  0
> > nf_tables              36626  3 nft_nat,nft_ct,nft_compat
> > nfnetlink              12818  3 nf_tables,nfnetlink_log,nft_compat
> > nf_conntrack_ipv4      13078  1
> > nf_defrag_ipv4         12443  1 nf_conntrack_ipv4
> > nf_nat_ipv4            12757  1 iptable_nat
> > 
> > What can it be?
> 
> I don't see the nf_tables_ipv4 and nf_tables_ipv6 modules there.

JFYI: Just created this section:

http://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting

I'll try to collect similar questions in that article.
