From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: iptables 1.6.0 parallel build trouble
Date: Mon, 17 Oct 2016 21:42:05 +0200
Message-ID: <20161017194205.GG24375@salvia>
References: <20160919192227.6b1f1487@playground>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160919192227.6b1f1487@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

On Mon, Sep 19, 2016 at 07:22:27PM -0400, Neal P. Murphy wrote:
> itpables 1.6.0 been building fine for a while now (though it *has*
> tripped on occasion, but works the second time through). But today
> it decided to stop building with -j 8.
> 
> I see the commit to add xtables-config-parser.h to BUILT_SOURCES.
> The patch works.
> 
> But I had to bump automake to v1.14(.1); iptables' build insists on
> using v1.14(.1). Do I need to run autoconf, too?

So is this an automake problem, precisely?
