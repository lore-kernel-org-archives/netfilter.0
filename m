From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: no table for ipv6
Date: Tue, 29 Jul 2014 00:08:35 +0200
Message-ID: <20140728220835.GA4243@salvia>
References: <53D67106.2070600@thwitt.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53D67106.2070600@thwitt.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Witt <lists@thwitt.de>
Cc: netfilter@vger.kernel.org

On Mon, Jul 28, 2014 at 05:49:26PM +0200, Thomas Witt wrote:
> Hi, I am trying to configure nftables on a new server.
> 
> I can add tables for ip4:
> 
> # nft add table ip filter
> 
> but not for ip6 or inet:
> 
> # nft add table ip6 filter6
> # nft add table inet filterboth
> # nft list tables
> table filter

nft list ip6 tables
nft list inet tables

You have to specify the family. I'll including this in the wiki page
to clarify this.
