From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft set load metrics
Date: Thu, 30 Sep 2021 20:04:08 +0200
Message-ID: <YVX8GKmswL+4bGTL@salvia>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
 <YVXC5cPRHyaE3VRL@salvia>
 <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristian Constantin <const.crist@googlemail.com>
Cc: netfilter@vger.kernel.org

On Thu, Sep 30, 2021 at 05:47:07PM +0200, Cristian Constantin wrote:
> > It's possible to extend the interface to expose this, but how useful
> > is this?
> 
> cristian: imo, it is important from the operational point of view to
> monitor the size of the sets. from an implementation point of view,
> since the sets can grow to very large sizes, reading large packets
> over netlink sockets just to count the elements in the sets does not
> seem very efficient.

You mean, provide stats that allow to monitor the memory size? That
might make sense, yes.

> the nft user space tool has a switch which turns off showing the set
> content: '-t', however it will only show the name of the set and the
> flags. I also did not check if this feature is offered at the socket
> layer or if the elements are actually read from the kernel but not
> displayed.

IIRC, they are read from the kernel, then not displayed, but it should
be easy to only fetch the set, I'll prepare a patch to speed -t
listing.
