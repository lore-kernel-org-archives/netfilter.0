From: Martin Kraus <lists_mk@wujiman.net>
Subject: Re: conntrackd, internal cache keeps filling up
Date: Sat, 10 May 2014 08:17:45 +0200
Message-ID: <20140510061743.GA32197@finrod>
References: <20140505104058.GA30297@finrod>
 <20140509113129.GA8031@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140509113129.GA8031@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Fri, May 09, 2014 at 01:31:29PM +0200, Pablo Neira Ayuso wrote:
> > There's thousands of these entries and in a few days they'll fill up the
> > internal cache and break internal routing.
> 
> Could you retry with lastest conntrackd version? 1.4.2.

will try 1.4.2. we just need to package it.
 
> You didn't specify your Linux kernel version either. Thanks.

current kernel is 3.13.7. 

we already hit a bug in the official 3.2 kernel packaged with wheezy where 
our scan for heartbleed vulnerability would cause conntrackd to kernel panic
the router.

mk
