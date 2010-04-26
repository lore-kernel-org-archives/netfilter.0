From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_conntrack: notification on established/finished
 connection?
Date: Mon, 26 Apr 2010 14:27:05 +0200
Message-ID: <4BD58699.9000405@netfilter.org>
References: <201004211915.28436.morgon.j.kanter@dartmouth.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201004211915.28436.morgon.j.kanter@dartmouth.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Morgon J. Kanter" <morgon.j.kanter@dartmouth.edu>
Cc: netfilter@vger.kernel.org

Morgon J. Kanter wrote:
> Hi,
> 
> Apologies if I'm on the incorrect list, but this isn't a patch for netfilter 
> so I believe this to be the appropriate one.
> 
> I'm in the process of writing an application that requires notification when a 
> new TCP connection to a specific destination is established, and finished / 
> timed out. I've never used libnetfilter_conntrack (or anything netfilter at 
> all, for that matter), so I've been investigating using libnetfilter_conntrack 
> for this purpose. My question is: is this possible to do with this library?

Look at utils/conntrack_events.c, I think that example is more or less
what you need.

> My question is so basic because I'm not really sure what nfct_catch() actually 
> fires on. I noticed the filter infrastructure -- to get such an application to 
> work, would I create a filter for TCP, and that destination, and then do 
> something like:
> 
> nfct_filter_attach(nfct_fd(conntrack_handle), filter);
> nfct_callback_register(conntrack_handle, NFCT_T_NEW, new_connection_callback, 
> NULL);
> nfct_callback_register(conntrack_handle, NFCT_T_DESTROY, 
> dead_connection_callback, NULL);
> nfct_catch(conntrack_handle);

The filter infrastructure is there to attach filters in kernel-space.

> Is this the right track for what I want to do? My issue is I just don't really 
> understand exactly what nfct_catch does -- what is a conntrack event, exactly? 
> And what does it mean to steal one, as per the callback returning 
> NFCT_CB_STOLEN.

nfct_catch() receives conntrack events from kernel-space, by default it
blocks waiting for events. NFCT_CB_STOLEN means that the conntrack
object is not released after the callback.

Good luck with it.
