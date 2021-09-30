From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft set load metrics
Date: Thu, 30 Sep 2021 16:00:05 +0200
Message-ID: <YVXC5cPRHyaE3VRL@salvia>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cristian Constantin <const.crist@googlemail.com>
Cc: netfilter@vger.kernel.org

On Thu, Sep 30, 2021 at 01:21:26PM +0200, Cristian Constantin wrote:
> hi!
> 
> is there a way to get from the kernel just some metrics about nft
> sets, without getting
> all (possibly lots of) elements of the set?
> 
> e.g.:
> 
> - number of full ip addresses (i.e. /32 prefix for ipv4);
> - number of "prefix" elements;
> - number of intervals;

It's possible to extend the interface to expose this, but how useful
is this?
