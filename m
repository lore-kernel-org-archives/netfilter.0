From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft set load metrics
Date: Sat, 2 Oct 2021 13:54:49 +0200
Message-ID: <YVhIiZFwML9228yq@salvia>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
 <YVXC5cPRHyaE3VRL@salvia>
 <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
 <YVX8GKmswL+4bGTL@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <YVX8GKmswL+4bGTL@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristian Constantin <const.crist@googlemail.com>
Cc: netfilter@vger.kernel.org

On Thu, Sep 30, 2021 at 08:04:08PM +0200, Pablo Neira Ayuso wrote:
> IIRC, they are read from the kernel, then not displayed, but it should
> be easy to only fetch the set, I'll prepare a patch to speed -t
> listing.

For the record, patch to speed up listing with -t:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20211002115059.26792-1-pablo@netfilter.org/
