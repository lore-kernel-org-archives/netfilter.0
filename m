From: "Morgon J. Kanter" <morgon.j.kanter@dartmouth.edu>
Subject: Polling for conntrack events
Date: Mon, 26 Apr 2010 11:20:55 -0400
Message-ID: <201004261120.55513.morgon.j.kanter@dartmouth.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm developing an application that uses libnetfilter_conntrack to note when 
connections start and end as part of what it does. So far I've been able to do 
just fine is use nfct_filter with nfct_catch and have a function called 
whenever the appropriately filtered conntrack events happen. This works well, 
but my program doesn't *just* look for conntrack events and act on them. To 
keep it single-threaded what I'd like to do is just be able to poll for 
conntrack events, with poll() or select() or whatever.

What I attempted was extracting the netlink fd with the filter applied, and 
running select() on a set containing just that, and then using nfct_query(). 
This didn't work at all though -- when filtered conntrack events do happen, 
apparently nothing is pushed down that file descriptor. Is there any way to do 
what I want? I didn't see anything that was using this sort of functionality 
in the utils directory.

Thanks,
-- Morgon
