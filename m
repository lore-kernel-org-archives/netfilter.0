From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Polling for conntrack events
Date: Tue, 27 Apr 2010 20:11:38 +0200
Message-ID: <4BD728DA.1010004@netfilter.org>
References: <201004261120.55513.morgon.j.kanter@dartmouth.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201004261120.55513.morgon.j.kanter@dartmouth.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Morgon J. Kanter" <morgon.j.kanter@dartmouth.edu>
Cc: netfilter@vger.kernel.org

Morgon J. Kanter wrote:
> Hi,
> 
> I'm developing an application that uses libnetfilter_conntrack to note when 
> connections start and end as part of what it does. So far I've been able to do 
> just fine is use nfct_filter with nfct_catch and have a function called 
> whenever the appropriately filtered conntrack events happen. This works well, 
> but my program doesn't *just* look for conntrack events and act on them. To 
> keep it single-threaded what I'd like to do is just be able to poll for 
> conntrack events, with poll() or select() or whatever.

IRC, you can use nfct_fd() to get the netlink file descriptor.

> What I attempted was extracting the netlink fd with the filter applied, and 
> running select() on a set containing just that, and then using nfct_query().

nfct_query() is not of any use to listen to events.

> This didn't work at all though -- when filtered conntrack events do happen, 
> apparently nothing is pushed down that file descriptor. Is there any way to do 
> what I want? I didn't see anything that was using this sort of functionality 
> in the utils directory.

You can look at the conntrack-tools, specifically conntrackd, it does 
more or less what you seem to need.
