From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Site-specific filter rules problem
Date: Thu, 29 May 2008 00:23:04 -0500
Message-ID: <483E3DB8.6000908@riverviewtech.net>
References: <1211702139.7164.22.camel@u804mbr>	 <483C1AAE.1010709@riverviewtech.net> <1212037361.7205.14.camel@u804mbr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1212037361.7205.14.camel@u804mbr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/29/08 00:02, Mark Baker wrote:
> Thanks for the advice, Grant.  Keeping in mind that I'm only having 
> this problem with one site and therefore it must be doing something 
> differently, I did a little more playing and found out I could 
> eliminate the problem by adding the following rule after my state 
> rule, like this:

You are welcome.  I'm glad that you got things working.

<snip>

> After adding the next 2nd and 3rd rules above, I found that huge 
> numbers of packets were getting past my state rule, but it cured the 
> problem. When I compare the logged packets to /proc/net/nf_conntrack, 
> though, I find that the sockets identified in the missed packets 
> matched established connections listed in nf_conntrack, so I'm still 
> not sure why they were being missed.

It might be worth submitting a new post to the mailing list (new thread 
rather than a reply to this one) clearly stating what you were seeing in 
your conntrack tables.  Also, include as many relevant logs and 
conntrack entries as possible.  You may want to consider sniffing some 
traffic and including that as well.



Grant. . . .
