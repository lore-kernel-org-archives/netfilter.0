From: Thomas Graf <tgraf@suug.ch>
Subject: Re: 4.8.0-rc1: page allocation failure: order:3,
 mode:0x2084020(GFP_ATOMIC|__GFP_COMP)
Date: Fri, 12 Aug 2016 00:28:16 +0200
Message-ID: <20160811222816.GA21039@pox.localdomain>
References: <8bdcb66dc3eb2448e4b6f2baef2ad8ea@eikelenboom.it>
 <20160809122241.GA13060@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suug-ch.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nFj1DcL10VKg48Q9FXGFUA6rRj4mfcl9PLWm3wjxlX0=;
        b=BxR5973DmviemObFFLFCOChxp6JO13HVwNnn8XwvTuaUePGI6WIgOYjZt649WRTBJQ
         CfnlnuzEw7eO6uRk5k216CpvlZnG7lkvh0nloolVGVPFD9hVapVM2jdRuDkYZ5nz0HmJ
         lY7aMrg4BYgnmObKKWJozvUdBcEKTlJywPSqhFt5W4PgM6FWO9i9LMAJxYBZcM6tE/CK
         Tb7+cuk+zno94lFAMWXfSDCTF05mXE5Z0czbdEoC8ZM8YTahIEoPoSWChOmi5Hr0oqXm
         VxUSyQmZGj1Au0K0RBvTjh1+Y2/SIocF1oNr7Z/uaOKi44rmaiCdNqp6eSrtmB5b1DGv
         cKYw==
Content-Disposition: inline
In-Reply-To: <20160809122241.GA13060@breakpoint.cc>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: linux@eikelenboom.it, netdev@vger.kernel.org, netfilter@vger.kernel.org

On 08/09/16 at 02:22pm, Florian Westphal wrote:
> Hmmm, seems this is coming from an attempt to allocate the bucket lock
> array (since actual table has __GFP_NOWARN).
> 
> I was about to just send a patch that adds a GPF_NOWARN in
> bucket_table_alloc/alloc_bucket_locks call.
> 
> However, I wonder if we really need this elaborate sizing logic.
> I think it makes more sense to always allocate a fixed size regardless
> of number of CPUs, i.e. get rid of locks_mul and all the code that comes
> with it.
> 
> Doing order-3 allocation for locks seems excessive to me.
> 
> The netfilter conntrack hashtable just uses a fixed array of 1024
> spinlocks (so on x86_64 we get on page of locks).
> 
> What do you think?

The code has been primarily derived from inet_ehash_locks_alloc()
so my initial suggestion would be to adjust it to after Eric's
latest fixes including the change to GFP_NOWARN.
