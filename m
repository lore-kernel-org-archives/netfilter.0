From: Cristian Constantin <const.crist@googlemail.com>
Subject: Re: nft set load metrics
Date: Thu, 30 Sep 2021 20:46:11 +0200
Message-ID: <CANCV4NMHEeHqq=boTh-FBtiBSdMFD21GHG4HHPTHxsjhyihg8A@mail.gmail.com>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
 <YVXC5cPRHyaE3VRL@salvia> <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
 <YVX8GKmswL+4bGTL@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tK7uAyZnmtbG9dBSY7HEtm73d5XyLe0pRbzwyrK+eIY=;
        b=PrASheEeNRYCxxllRvOAsth7RTbElu+o8pAI2N9AcvJz9Qbvr2n23J0Wk3nR19I0j3
         GVHB4fU94zDUVHHyWYpNMgggVOvk9g3KljIx++zWOzsRbBFrGMmlBS2zHaJwSywmbvmZ
         BX/CDDNWdXXkfR1Ac7OLlvDSZ5cHn7Ckl3AdKh3Pig6eJKWcKgz3vnE389Fetmv9V519
         obR7a3SZCKITMc5li0IlM7FFrBw7qiXKYEtxxKQj5cJ7D0BkCqnMLsWgR7llEDMIDqVU
         Z5Kgt3hlYf28aIyXepm2Qv9WDcbO3a3fnKwL7iQzGcKjb8+tJhimRcXd/RYauyppQApB
         BjPQ==
In-Reply-To: <YVX8GKmswL+4bGTL@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> > cristian: imo, it is important from the operational point of view to
> > monitor the size of the sets. from an implementation point of view,
> > since the sets can grow to very large sizes, reading large packets
> > over netlink sockets just to count the elements in the sets does not
> > seem very efficient.
>
> You mean, provide stats that allow to monitor the memory size? That
> might make sense, yes.

cristian: basically generic resource consumption monitoring.

assume a setup like this:
1. ~1M ip addresses loaded in a set;
2. there is a filter rule which drops all forwarded ip packets with
dst address matching the ip addresses in the set;
3. some traffic generator (e.g. hping3) floods the respective
machine/interface with UDP traffic ~400 Kpkts/s, destination ip
addresses being randomized but in the range of those in the respective
set;
the machine running the firewall uses btw. 15%-20% CPU (with
occasional spikes up to 30%)

so far I can tell, the number of ip addresses in a set can affect
directly the CPU consumption as well...

On Thu, Sep 30, 2021 at 8:04 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Thu, Sep 30, 2021 at 05:47:07PM +0200, Cristian Constantin wrote:
> > > It's possible to extend the interface to expose this, but how useful
> > > is this?
> >
> > cristian: imo, it is important from the operational point of view to
> > monitor the size of the sets. from an implementation point of view,
> > since the sets can grow to very large sizes, reading large packets
> > over netlink sockets just to count the elements in the sets does not
> > seem very efficient.
>
> You mean, provide stats that allow to monitor the memory size? That
> might make sense, yes.
>
> > the nft user space tool has a switch which turns off showing the set
> > content: '-t', however it will only show the name of the set and the
> > flags. I also did not check if this feature is offered at the socket
> > layer or if the elements are actually read from the kernel but not
> > displayed.
>
> IIRC, they are read from the kernel, then not displayed, but it should
> be easy to only fetch the set, I'll prepare a patch to speed -t
> listing.
